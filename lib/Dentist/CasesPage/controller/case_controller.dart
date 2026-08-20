import 'package:get/get.dart';
import 'package:template/core/api.dart';
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
}
