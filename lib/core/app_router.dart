

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/auth/binding/forpa_binding.dart';
import 'package:template/auth/binding/login_binding.dart';
import 'package:template/auth/binding/otp_binding.dart';
import 'package:template/auth/binding/reset_password_binding.dart';
import 'package:template/auth/binding/signup_binding.dart';
import 'package:template/auth/view/forget_password.dart';
import 'package:template/auth/view/login_screen.dart';
import 'package:template/auth/view/otp_screen.dart';
import 'package:template/auth/view/reset_password_screen.dart';

import 'package:template/auth/view/signup_screen.dart';

import 'package:template/choose_user_type/view/choose_user_type.dart';




abstract class AppRouter {
  static const choseuserpage = '/';
  static const loginpage = '/loginpage';
  static const signuppage = '/signuppage';
  static const OTPpage = '/OTPpage';
  static const forgetpasswordpage = '/forgetpasswordpage';
  static const resetpasswordpage = '/resetpasswordpage';
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: choseuserpage,
      page: () => const ChooseUserTypeScreen(),
    ),
    GetPage(
      name: signuppage,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
       GetPage(
      name: loginpage,
      page: () => const LoginScreen(),
       binding: LoginBinding(),
    ),

           GetPage(
      name: OTPpage,
      page: () => const OtpScreen(),
        binding: OtpBinding(),
    ),

GetPage(
  name: forgetpasswordpage,
  page: () => const fpScreen(),
  binding: ForgetPasswordBinding(),
),
GetPage(
  name: resetpasswordpage,
  page: () => const ResetPasswordScreen(),
  binding: ResetPasswordBinding(),
),
  ];

}
