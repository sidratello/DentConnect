import 'package:get/get.dart';
import 'package:template/lab/features/homepage/repositry/homerepo.dart';
import 'package:template/lab/features/profile/repositry/profile_repo.dart';

class LabHomeController extends GetxController {
  final LabHomeRepo _repo = LabHomeRepo();

  final isLoading = false.obs;
  final connectionRequestsCount = 0.obs;
 final LabProfileRepo _profileRepo = LabProfileRepo();

  final labName = 'المخبر'.obs;
  final pendingOrdersCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getConnectionRequestsCount();
     getLabName();
     getPendingOrdersCount();
  }

  Future<void> getConnectionRequestsCount() async {
    isLoading.value = true;

    final response = await _repo.getConnectionRequestsCount();

    isLoading.value = false;

    if (response.success && response.data != null) {
      connectionRequestsCount.value = response.data!;
    }
  }
    Future<void> getLabName() async {
    final response = await _profileRepo.getLabProfile();

    if (response.success && response.data != null) {
      final owner = response.data!['owner'];

      labName.value = owner['namePlace'] ?? 'المخبر';
    }
}


Future<void> getPendingOrdersCount() async {
  final response = await _repo.getPendingOrdersCount();

  if (response.success && response.data != null) {
    pendingOrdersCount.value = response.data!;
  }
}


}