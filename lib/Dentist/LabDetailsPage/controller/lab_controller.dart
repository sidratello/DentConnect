import 'package:get/get.dart';

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

  final RxList<String> availableDates = [
    'الأحد 10:00',
    'الاثنين 12:00',
    'الثلاثاء 03:00',
  ].obs;

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
}
