import 'package:get/get.dart';
import 'package:template/lab/features/homepage/repositry/homerepo.dart';

class LabHomeController extends GetxController {
  final LabHomeRepo _repo = LabHomeRepo();

  final isLoading = false.obs;
  final connectionRequestsCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getConnectionRequestsCount();
  }

  Future<void> getConnectionRequestsCount() async {
    isLoading.value = true;

    final response = await _repo.getConnectionRequestsCount();

    isLoading.value = false;

    if (response.success && response.data != null) {
      connectionRequestsCount.value = response.data!;
    }
  }
}