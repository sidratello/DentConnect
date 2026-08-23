import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core_dentist/api.dart';

class SplashController extends GetxController {
  final ApiService apiService = ApiService();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await apiService.get(
        'CaseOrders/dentist-personal-profile',
      );
      if (response.statusCode == 200) {
        Get.offAllNamed(AppRouter.dentistHomePage);
      } else {
        final response2 = await apiService.get(
          'lab-blog/my-posts',
        );
        if (response2.statusCode == 200) {
          Get.offAllNamed(AppRouter.homepage);
        } else {
          Get.offAllNamed(AppRouter.choseuserpage);
        }
      }
    } catch (_) {
      Get.offAllNamed(AppRouter.choseuserpage);
    } finally {
      isLoading.value = false;
    }
  }
}
