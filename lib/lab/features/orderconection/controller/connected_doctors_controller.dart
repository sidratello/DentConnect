import 'package:get/get.dart';

import '../model/connected_doctor_model.dart';
import '../repositry/connected_doctors_repo.dart';

class ConnectedDoctorsController extends GetxController {
  final ConnectedDoctorsRepo _repo = ConnectedDoctorsRepo();

  final isLoading = false.obs;
  final isDisconnecting = false.obs;

  final connectedDoctors = <ConnectedDoctorModel>[].obs;
  final allConnectedDoctors = <ConnectedDoctorModel>[].obs;

  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getConnectedDoctors();
  }

  Future<void> getConnectedDoctors() async {
    isLoading.value = true;

    final response = await _repo.getConnectedDoctors();

    isLoading.value = false;

    if (response.success && response.data != null) {
      allConnectedDoctors.assignAll(response.data!);
      _applyCurrentSearch();
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
      );
    }
  }

  void searchDoctors(String value) {
    searchQuery.value = value.trim();
    _applyCurrentSearch();
  }

 void _applyCurrentSearch() {
  final query = searchQuery.value.trim().toLowerCase();

  if (query.isEmpty) {
    connectedDoctors.assignAll(allConnectedDoctors);
    return;
  }

  final result = allConnectedDoctors.where((doctor) {
    final name = doctor.name.trim().toLowerCase();
    final address = doctor.fullAddress.trim().toLowerCase();

    return name.contains(query) || address.contains(query);
  }).toList();

  connectedDoctors.assignAll(result);
}

  Future<bool> disconnectDoctor(int connectionId) async {
    if (isDisconnecting.value) return false;

    isDisconnecting.value = true;

    final response = await _repo.disconnectDoctor(connectionId);

    isDisconnecting.value = false;

    if (!response.success) {
      Get.snackbar(
        'خطأ',
        response.message,
      );

      return false;
    }

    allConnectedDoctors.removeWhere(
      (doctor) => doctor.id == connectionId,
    );

    connectedDoctors.removeWhere(
      (doctor) => doctor.id == connectionId,
    );

    Get.snackbar(
      'تم',
      response.message ?? 'تم قطع الاتصال مع الطبيب بنجاح',
    );

    return true;
  }
}