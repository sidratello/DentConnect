import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/appointment_slot_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/compensation_item_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_details_model.dart';
import 'package:template/Dentist/ScannerAppointmentsPage/controller/scanner_appointments_controller.dart';
import 'package:template/core_dentist/api.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

enum ScannerStatus {
  available,
  booked,
  unavailable,
}

enum FollowStatus {
  notFollowing,
  pending,
  following,
}

class LabController extends GetxController {
  final Rx<ScannerStatus> scannerStatus = ScannerStatus.available.obs;
  final RxInt qualityRating = 0.obs;
  final RxInt timeRating = 0.obs;

  final RxBool isSubmittingRating = false.obs;
  final RxBool isLabAvailable = true.obs;
  final RxBool isLoading = false.obs;
  LabDetailsModel? labmodel;
  final int id;
  ApiService apiService = ApiService();
  LabDetailsModel? get labModel => labmodel;
  final RxList<CompensationItemModel> compensations =
      <CompensationItemModel>[].obs;

  LabController(this.id);

  @override
  void onInit() {
    fetchLabDetails(id);
    fetchCaseDetails(id);
    super.onInit();
  }

  String getLabImage() {
    if (labmodel != null &&
        labmodel!.profilePictureUrl != null &&
        labmodel!.profilePictureUrl!.isNotEmpty) {
      return '${Static.imageBaseUrl}/${labmodel!.profilePictureUrl!}';
    } else {
      return 'assets/images/lab_card.png';
    }
  }

  final RxList<String> availableDates = [''].obs;

  List<AppointmentSlotModel> availableSlots = [];

  final Rxn<CaseDetailsModel> caseDetails = Rxn<CaseDetailsModel>();

  final Rx<FollowStatus> followStatus = FollowStatus.notFollowing.obs;

  void sendFollowRequestStatus() {
    followStatus.value = FollowStatus.pending;
  }

  void acceptFollowRequest() {
    followStatus.value = FollowStatus.following;
  }

  final RxString selectedDate = ''.obs;

  bool get hasSelectedDate => selectedDate.isNotEmpty;

  Future<void> selectDate(
    AppointmentSlotModel slot,
  ) async {
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'تأكيد الحجز',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        content: Text(
          'هل أنت متأكد من حجز موعد الماسح؟\n\n'
          '${slot.fullDisplay}',
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 14,
            height: 1.6,
          ),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          16,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text(
              'إلغاء',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(result: true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'تأكيد الحجز',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return;
    }

    selectedDate.value = slot.fullDisplay;

    await bookAvailableSlots(
      id,
      slot.slotId,
    );
  }

  Future<void> fetchAvailableSlots(int id) async {
    try {
      final response = await apiService.get(
        'scan-visits/available-slots/$id',
      );

      if (response.statusCode == 200) {
        availableSlots = (response.data as List)
            .map(
              (slot) => AppointmentSlotModel.fromJson(
                slot,
              ),
            )
            .toList();

        availableDates.value = availableSlots
            .map(
              (slot) => slot.fullDisplay,
            )
            .toList();
      } else {
        print(
          'Failed to fetch available slots: '
          '${response.message}',
        );
      }
    } catch (e) {
      print(
        'Error fetching available slots for ID $id: $e',
      );
    }
  }

  Future<void> bookAvailableSlots(
    int idLab,
    int idSlot,
  ) async {
    try {
      final response = await apiService.post(
        'scan-visits/book/$idLab/$idSlot',
      );

      if (response.statusCode == 200) {
        availableSlots.removeWhere(
          (slot) => slot.slotId == idSlot,
        );

        availableDates.value = availableSlots
            .map(
              (slot) => slot.fullDisplay,
            )
            .toList();

        scannerStatus.value = availableSlots.isEmpty
            ? ScannerStatus.unavailable
            : ScannerStatus.booked;

        final scannerAppointmentsController =
            Get.find<ScannerAppointmentsController>();

        await scannerAppointmentsController.fetchAppointments();

        Get.back();

        Get.snackbar(
          'تم الحجز',
          'تم حجز موعد الماسح بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> fetchLabDetails(int id) async {
    isLoading.value = true;
    var response = await apiService.get(
      'Ratings/lab-profile/$id',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        labmodel = LabDetailsModel.fromJson(response.data);
        followStatus.value = labmodel!.connectionStatus == 'Accepted'
            ? FollowStatus.following
            : labmodel!.connectionStatus == 'Pending'
                ? FollowStatus.pending
                : FollowStatus.notFollowing;
        if (labmodel != null &&
            labmodel!.hasScanVisitService != null &&
            labmodel!.hasScanVisitService == true) {
          scannerStatus.value = ScannerStatus.available;
          fetchAvailableSlots(id);
        } else {
          scannerStatus.value = ScannerStatus.unavailable;
        }
        isLabAvailable.value =
            labmodel != null && labmodel!.availability == 'Available';
        if (labmodel?.prices != null) {
          compensations.clear();
          compensations.addAll(
            labmodel!.prices!.map(
              (price) => CompensationItemModel(
                name: price.type ?? '',
                price: '\$${price.price?.toStringAsFixed(0) ?? '0'}',
              ),
            ),
          );
        }
        await fetchCaseDetails(id);
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } catch (e) {
      print('Error fetching lab details for ID $id: $e');
    }
    isLoading.value = false;
  }

  Future<void> fetchCaseDetails(int id) async {
    isLoading.value = true;
    var response = await apiService.get(
      'CaseOrders/lab/$id/orders',
    );

    try {
      if (response.statusCode == 200) {
        print(response.data);
        final data = response.data as List;
        if (data.isNotEmpty) {
          caseDetails.value = CaseDetailsModel.fromJson(data.first);
        } else {
          caseDetails.value = null;
        }
        // update();
      } else {
        print('Failed to fetch case details: ${response.message}');
      }
    } catch (e) {
      print('Error fetching case details for ID $id: $e');
    } finally {
      isLoading.value = false;
    }
  }

  String getLabName() {
    if (labmodel != null && labmodel!.labName != null) {
      return labmodel!.labName!;
    } else {
      return 'اسم المخبر';
    }
  }

  int getLabId() {
    if (labmodel != null && labmodel!.id != null) {
      return labmodel!.id!;
    } else {
      return 0;
    }
  }

  Future<void> sendFollowRequest(int labId) async {
    try {
      var response = await apiService.post(
        'Connections/follow/$labId',
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال طلب المتابعة بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> submitRating({
    required int labId,
  }) async {
    if (qualityRating.value == 0 || timeRating.value == 0) {
      Get.snackbar(
        'تنبيه',
        'يجب تقييم جودة العمل والالتزام بالوقت',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    isSubmittingRating.value = true;

    try {
      final qualityResponse = await apiService.post(
        'Ratings/$labId/quality/${qualityRating.value}',
      );

      if (qualityResponse.statusCode != 200) {
        Get.snackbar(
          'خطأ',
          qualityResponse.message,
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      final timeResponse = await apiService.post(
        'Ratings/$labId/time/${timeRating.value}',
      );

      if (timeResponse.statusCode != 200) {
        Get.snackbar(
          'خطأ',
          timeResponse.message,
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      Get.snackbar(
        'تم التقييم',
        'تم إرسال تقييم الجودة والوقت بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      qualityRating.value = 0;
      timeRating.value = 0;
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isSubmittingRating.value = false;
    }
  }
}
