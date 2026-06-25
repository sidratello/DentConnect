

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
import 'package:template/lab/features/homepage/binding/homebinding.dart';
import 'package:template/lab/features/homepage/lab_home_page.dart';
import 'package:template/lab/features/order/binding/order_binding.dart';
import 'package:template/lab/features/order/binding/order_details_binding.dart';
import 'package:template/lab/features/order/views/order_details_screen.dart';
import 'package:template/lab/features/order/views/order_screen.dart';

import 'package:template/lab/features/orderconection/binding/orderconection_binding.dart';
import 'package:template/lab/features/orderconection/views/orderconection.dart';
import 'package:template/lab/features/profile/binding/edit_profile_binding.dart';
import 'package:template/lab/features/profile/binding/profile_binding.dart';
import 'package:template/lab/features/profile/views/edit_profile_screen.dart';
import 'package:template/lab/features/profile/views/profile.dart';




abstract class AppRouter {
  static const choseuserpage = '/';
  static const loginpage = '/loginpage';
  static const signuppage = '/signuppage';
  static const OTPpage = '/OTPpage';
  static const forgetpasswordpage = '/forgetpasswordpage';
  static const resetpasswordpage = '/resetpasswordpage';
   static const homepage = '/homepage';
   static const profile = '/profile';
   static const editProfile = '/editProfile';
   static const orderconection = '/orderconection';
   static const orders = '/orders';
static const orderDetails = '/orderDetails';

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



GetPage(
  name: homepage,
  page: () => const LabHomePage(),
  binding: LabHomeBinding(),
),
GetPage(
  name: profile,
  page: () => const LabProfileViewScreen(),
   binding: LabProfileBinding(),
),
GetPage(
  name: editProfile,
  page: () => const EditProfileScreen(),
  binding: EditProfileBinding(),
),
GetPage(
  name: orderconection,

  page: () => const OrderConnectionScreen(),

  binding: OrderConnectionBinding(),
),
GetPage(
  name: orders,
  page: () => const LabOrderScreen(),
  binding: LabOrderBinding(),
),

GetPage(
  name: orderDetails,
  page: () => const OrderDetailsScreen(),
  binding: OrderDetailsBinding(),
),

  ];

}
