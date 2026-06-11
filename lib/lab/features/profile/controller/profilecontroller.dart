



import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/repositry/profile_repo.dart';

class LabProfileController extends GetxController {
  final isLoading = false.obs;
  final Rxn<LabProfileModel> profile = Rxn<LabProfileModel>();

  final LabProfileRepo repo = LabProfileRepo();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

Future<void> getProfile() async {
  isLoading.value = true;

  final response = await repo.getLabProfile();

  isLoading.value = false;

  if (response.success) {
    profile.value = LabProfileModel.fromJson(response.data!);

  
  } else {
    Get.snackbar('خطأ', response.message);
  }
}
}