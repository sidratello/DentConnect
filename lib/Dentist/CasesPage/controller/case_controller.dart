import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CasesPage/model/cancel_order_response.dart';
import 'package:template/core_dentist/api.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import '../model/case_model.dart';
import '../model/case_status.dart';

class CaseController extends GetxController {
  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;
  final RxString clarificationText = ''.obs;
  final Rxn<CaseModel> caseModel = Rxn<CaseModel>();

  @override
  void onInit() {
    fetchCases();
    super.onInit();
  }
  // ------------------------------------------
  // Sections
  // ------------------------------------------

  final expandedSections = <CaseStatus, bool>{
    CaseStatus.waitingApproval: true,
    CaseStatus.accepted: true,
    CaseStatus.needInfo: true,
    CaseStatus.inDesign: true,
    CaseStatus.inProgress: true,
    CaseStatus.ready: true,
    CaseStatus.delivered: true,
    CaseStatus.cancelled: true,
    CaseStatus.inColoring: true,
    CaseStatus.waitingForClarification: true,
  }.obs;

  // ------------------------------------------
  // Visible items count
  // ------------------------------------------

  final visibleCount = <CaseStatus, int>{
    CaseStatus.waitingApproval: 3,
    CaseStatus.accepted: 3,
    CaseStatus.needInfo: 3,
    CaseStatus.inDesign: 3,
    CaseStatus.inProgress: 3,
    CaseStatus.ready: 3,
    CaseStatus.delivered: 3,
    CaseStatus.cancelled: 3,
    CaseStatus.inColoring: 3,
    CaseStatus.waitingForClarification: 3,
  }.obs;

  // ------------------------------------------
  // Toggle section
  // ------------------------------------------

  void toggleSection(CaseStatus status) {
    expandedSections[status] = !(expandedSections[status] ?? true);

    expandedSections.refresh();
  }

  // ------------------------------------------
  // Show more
  // ------------------------------------------

  void showMore(
    CaseStatus status,
    int total,
  ) {
    visibleCount[status] = total;

    visibleCount.refresh();
  }

  // ------------------------------------------
  // Get cases by status
  // ------------------------------------------

  List<CaseItem> getCases(CaseStatus status) {
    final model = caseModel.value;

    if (model == null) {
      return [];
    }

    switch (status) {
      case CaseStatus.waitingApproval:
        return model.pending ?? [];

      case CaseStatus.accepted:
        return model.accepted ?? [];

      case CaseStatus.needInfo:
        return model.requestInfo ?? [];

      case CaseStatus.inDesign:
        return model.inDesign ?? [];

      case CaseStatus.inProgress:
        return model.inProduction ?? [];

      case CaseStatus.ready:
        return model.ready ?? [];

      case CaseStatus.delivered:
        return model.delivered ?? [];

      case CaseStatus.cancelled:
        return model.cancelled ?? [];

      case CaseStatus.inColoring:
        return model.inColoring ?? [];

      case CaseStatus.waitingForClarification:
        return model.waitingForClarification ?? [];
    }
  }

  // ------------------------------------------
  // Fetch Cases
  // ------------------------------------------

  Future<void> fetchCases() async {
    isLoading.value = true;

    try {
      final response = await apiService.get(
        'CaseOrders/my-orders-tracking',
      );

      if (response.statusCode == 200) {
        print(response.data.toString());

        if (response.data is Map<String, dynamic>) {
          caseModel.value = CaseModel.fromJson(
            response.data as Map<String, dynamic>,
          );
        } else {
          print(
            'Unexpected response format: '
            '${response.data.runtimeType}',
          );

          caseModel.value = null;
        }
      } else {
        print(
          'Failed to fetch cases: ${response.message}',
        );

        caseModel.value = null;
      }
    } catch (e) {
      print(
        'Error fetching cases: $e',
      );

      caseModel.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  void setClarificationText(String value) {
    clarificationText.value = value;
  }

  Future<bool> createNotes(
    int orderId, {
    required String text,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'Notes': text,
      };
      final response = await apiService.post(
        'CaseOrders/$orderId/reply-to-lab',
        data: data,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'نجاح',
          'تم إرسال الملاحظة بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
        clarificationText.value = '';
        await fetchCases();
        Get.back();

        return true;
      }

      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }
  }

  Future<void> cancelOrder({
    required int orderId,
    required int labId,
  }) async {
    final reason = await _showCancellationReasonDialog();

    if (reason == null || reason.trim().isEmpty) {
      return;
    }

    try {
      isLoading.value = true;

      debugPrint(
        'Cancel Order → orderId: $orderId, labId: $labId',
      );

      final response = await apiService.delete(
        'CaseOrders/$orderId/lab/$labId/cancel',
        data: {
          'CancellationReason': reason.trim(),
        },
      );

      debugPrint(
        'Cancel Order Status → ${response.statusCode}',
      );

      debugPrint(
        'Cancel Order Data → ${response.data}',
      );

      if (response.statusCode != 200) {
        Get.snackbar(
          'تعذر إلغاء الطلبية',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      if (response.data is! Map<String, dynamic>) {
        Get.snackbar(
          'خطأ',
          'تم إلغاء الطلبية لكن استجابة الخادم غير صالحة.',
          snackPosition: SnackPosition.BOTTOM,
        );

        await fetchCases();

        return;
      }

      final result = CancelOrderResponse.fromJson(
        Map<String, dynamic>.from(response.data),
      );

      await fetchCases();

      Get.snackbar(
        'تم إلغاء الطلبية',
        result.details.isNotEmpty ? result.details : result.message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
      );
    } catch (e, stackTrace) {
      debugPrint(
        'Cancel Order Error: $e',
      );

      debugPrint(
        stackTrace.toString(),
      );

      Get.snackbar(
        'تعذر إلغاء الطلبية',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> _showCancellationReasonDialog() async {
    final reasonController = TextEditingController();

    final result = await Get.dialog<String>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'إلغاء الطلبية',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'هل أنت متأكد من رغبتك في إلغاء هذه الطلبية؟',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 13,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(
                  alpha: 0.08,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.orange.withValues(
                    alpha: 0.18,
                  ),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.orange,
                    size: 20,
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      'تنبيه حول الإلغاء:\n'
                      '• في حال إلغاء الطلب خلال 24 ساعة من إنشائها، '
                      'سيتم استرداد المبلغ بالكامل.\n'
                      '• في حال مضي أكثر من 24 ساعة على إنشاء الطلب، '
                      'سيتم خصم 50% من المبلغ كغرامة إلغاء، '
                      'ويتم استرداد المبلغ المتبقي.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 11,
                        height: 1.7,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'سبب الإلغاء',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 7),
            TextField(
              controller: reasonController,
              maxLines: 3,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: 'اكتب سبب إلغاء الطلبية...',
                hintStyle: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          14,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'تراجع',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final reason = reasonController.text.trim();

              if (reason.isEmpty) {
                Get.snackbar(
                  'تنبيه',
                  'يرجى كتابة سبب الإلغاء',
                  snackPosition: SnackPosition.BOTTOM,
                );

                return;
              }

              Get.back(
                result: reason,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'تأكيد إلغاء الطلبية',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    return result;
  }
}
