import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/appointment_slot_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/compensation_item_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_details_model.dart';
import 'package:template/core/api.dart';

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
    super.onInit();
  }

  String getLabImage() {
    if (labmodel != null &&
        labmodel!.profilePictureUrl != null &&
        labmodel!.profilePictureUrl!.isNotEmpty) {
      return labmodel!.profilePictureUrl!;
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

  Future<void> selectDate(AppointmentSlotModel slot) async {
    selectedDate.value = slot.readableDate;
    await bookAvailableSlots(id, slot.slotId);

    availableDates.remove(slot.readableDate);

    scannerStatus.value = ScannerStatus.booked;

    if (availableDates.isEmpty) {
      scannerStatus.value = ScannerStatus.unavailable;
    }
  }

  Future<void> fetchAvailableSlots(int id) async {
    var response = await apiService.get(
      'scan-visits/available-slots/$id',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        availableSlots = (response.data as List)
            .map((slot) => AppointmentSlotModel.fromJson(slot))
            .toList();

        availableDates.value =
            availableSlots.map((slot) => slot.readableDate).toList();
      } else {
        print('Failed to fetch available slots: ${response.message}');
      }
    } catch (e) {
      print('Error fetching available slots for ID $id: $e');
    }
  }

  Future<void> bookAvailableSlots(int idLab, int idSlot) async {
    var response = await apiService.post(
      'scan-visits/book/$idLab/$idSlot',
    );
    try {
      if (response.statusCode == 200) {
        availableSlots.removeWhere((e) => e.slotId == idSlot);

        availableDates.value =
            availableSlots.map((e) => e.readableDate).toList();

        scannerStatus.value = availableSlots.isEmpty
            ? ScannerStatus.unavailable
            : ScannerStatus.booked;
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
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
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
        fetchCaseDetails(id);
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
}
