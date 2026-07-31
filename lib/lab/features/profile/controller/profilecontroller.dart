



import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/repositry/profile_repo.dart';

class LabProfileController extends GetxController {
  final isLoading = false.obs;
  final Rxn<LabProfileModel> profile = Rxn<LabProfileModel>();
final profilePictureUrl = ''.obs;
  final LabProfileRepo repo = LabProfileRepo();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

// Future<void> getProfile() async {
//   isLoading.value = true;

//   final response = await repo.getLabProfile();

//   isLoading.value = false;

//   if (response.success) {
//     profile.value = LabProfileModel.fromJson(response.data!);

  
//   } else {
//     Get.snackbar('خطأ', response.message);
//   }
// }

Future<void> getProfile() async {
    isLoading.value = true;

    try {
      final results = await Future.wait([
        repo.getLabProfile(),
        repo.getLabProfilePicture(),
      ]);

      final profileResponse = results[0];
      final pictureResponse = results[1];

      if (profileResponse.success &&
          profileResponse.data != null) {
        profile.value = LabProfileModel.fromJson(
          profileResponse.data!,
        );
      } else {
        Get.snackbar(
          'خطأ',
          profileResponse.message,
        );
      }

      if (pictureResponse.success &&
          pictureResponse.data != null) {
        profilePictureUrl.value =
            pictureResponse.data?['profilePictureUrl']
                    ?.toString()
                    .trim() ??
                '';
      } else {
        // عدم وجود صورة لا يمنع ظهور الملف الشخصي
        profilePictureUrl.value = '';
      }
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل الملف الشخصي.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProfilePicture() async {
    final response = await repo.getLabProfilePicture();

    if (response.success && response.data != null) {
      profilePictureUrl.value =
          response.data?['profilePictureUrl']
                  ?.toString()
                  .trim() ??
              '';
    } else {
      profilePictureUrl.value = '';
    }
  }





}