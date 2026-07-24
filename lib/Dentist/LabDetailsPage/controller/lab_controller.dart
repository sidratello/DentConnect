import 'package:get/get.dart';
import 'package:template/Dentist/LabDetailsPage/model/appointment_slot_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/compensation_item_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
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
  LabModel? labmodel;
  final int id;
  ApiService apiService = ApiService();
  LabModel? get labModel => labmodel;
  final List<CompensationItemModel> compensations = [
    CompensationItemModel(
      name: 'CRISTAL EMAX',
      price: '80\$',
    ),
    CompensationItemModel(
      name: 'VENEER',
      price: '65\$',
    ),
  ];

  LabController(this.id);

  @override
  void onInit() {
    fetchLabDetails(id);
    super.onInit();
  }

  String getLabImage() {
    if (labmodel != null &&
        labmodel!.mainImage != null &&
        labmodel!.mainImage!.isNotEmpty) {
      return labmodel!.mainImage!.first;
    } else {
      return 'assets/images/lab_card.png';
    }
  }

  final RxList<String> availableDates = [''].obs;
  // 'الأحد 10:00',
  // 'الاثنين 12:00',
  // 'الثلاثاء 03:00',
  List<AppointmentSlotModel> availableSlots = [];

  final Rx<FollowStatus> followStatus = FollowStatus.notFollowing.obs;

  void sendFollowRequest() {
    followStatus.value = FollowStatus.following;
  }

  void acceptFollowRequest() {
    followStatus.value = FollowStatus.following;
  }

  final RxString selectedDate = ''.obs;

  bool get hasSelectedDate => selectedDate.isNotEmpty;

  void selectDate(String date) {
    selectedDate.value = date;

    availableDates.remove(date);

    scannerStatus.value = ScannerStatus.booked;

    if (availableDates.isEmpty) {
      scannerStatus.value = ScannerStatus.unavailable;
    }
  }

  Future<void> fetchAvailableSlots(int id) async {
    var response = await apiService.get(
      'scan-visits/available/$id',
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

  Future<void> fetchLabDetails(int id) async {
    isLoading.value = true;
    var response = await apiService.get(
      'Ratings/lab-profile/$id',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        labmodel = LabModel.fromJson(response.data);
        followStatus.value = labmodel!.connectionStatus == 'Accepted'
            ? FollowStatus.following
            : labmodel!.connectionStatus == 'Pending'
                ? FollowStatus.pending
                : FollowStatus.notFollowing;
        if (labmodel != null &&
            labmodel!.hasScan != null &&
            labmodel!.hasScan!) {
          scannerStatus.value = ScannerStatus.available;
          fetchAvailableSlots(id);
        } else {
          scannerStatus.value = ScannerStatus.unavailable;
        }
        isLabAvailable.value =
            labmodel != null && labmodel!.availability == 'Available';
        if (labmodel != null && labmodel!.prices != null) {
          // TODO: fill the consumption list
          // compensations.clear();
          // compensations.addAll(labmodel!.prices!.map((price) {
          //   return CompensationItemModel(
          //     name: price.name,
          //     price: price.price,
          //   );
          // }));
        }
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } catch (e) {
      print('Error fetching lab details for ID $id: $e');
    }
    isLoading.value = false;
  }

  String getLabName() {
    if (labmodel != null && labmodel!.labName != null) {
      return labmodel!.labName!;
    } else {
      return 'اسم المخبر';
    }
  }
}
