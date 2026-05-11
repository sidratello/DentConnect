

import 'package:get/get.dart';


import 'package:template/auth/repository/otp_repo.dart';
import 'package:template/core/app_router.dart';
class OtpController extends GetxController {


  final OtpRepo _repo = OtpRepo();
  final isLoading = false.obs;
 final isResending = false.obs;
 final code = ''.obs;
  late final String email;







@override
  void onInit() {
    super.onInit();
    email = Get.arguments as String;
  }




   Future<void> verifyOtp() async {


    isLoading.value = true;

    final response = await _repo.verifyOtp(

       email: email,
      code: code.value,

    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        'تم بنجاح',
        'تم تأكيد البريد الإلكتروني بنجاح، بانتظار موافقة الإدارة لتفعيل الحساب.',
        snackPosition: SnackPosition.BOTTOM,
      );
  Get.offAllNamed(AppRouter.loginpage);
      print(response.data);
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


 Future<void> resendOtp() async {
    if (isResending.value) return;

    isResending.value = true;

    final response = await _repo.resendOtp(email: email);

    isResending.value = false;

    if (response.success) {
      Get.snackbar(
        'تم الإرسال',
        'تم إرسال رمز تحقق جديد إلى بريدك الإلكتروني.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

  void goBack() {
    Get.back();
  }

}

}