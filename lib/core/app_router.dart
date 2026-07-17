import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/Dentist/CommunityPage/view/community_page.dart';
import 'package:template/Dentist/HomePage/view/view_only.dart';
import 'package:template/Dentist/LabDetailsPage/view/lab_details_page.dart';
import 'package:template/Dentist/NotificationsPage/view/notifications_page.dart';
import 'package:template/Dentist/PatientPage/view/create_new_patient_profile.dart';
import 'package:template/Dentist/PatientPage/view/patient_page.dart';
import 'package:template/Dentist/TemplatesPage/view/template_details_page.dart';
import 'package:template/Dentist/TemplatesPage/view/templates_page.dart';
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
import 'package:template/lab/features/orderconection/binding/orderconection_binding.dart';
import 'package:template/lab/features/orderconection/views/orderconection.dart';

abstract class AppRouter {
  // static const choseuserpage = '/';
  static const homePage = '/';
  static const labDetailsPage = '/labDetailsPage';
  static const casePage = '/casePage';
  static const patientsPage = '/patientsPage';
  static const createPatientPage = '/createPatientPage';
  static const templatesPage = '/templatesPage';
  static const templateDetailsPage = '/templateDetailsPage';
  static const communityPage = '/communityPage';
  static const notificationPage = '/notificationPage';
  static const loginpage = '/loginpage';
  static const signuppage = '/signuppage';
  static const OTPpage = '/OTPpage';
  static const forgetpasswordpage = '/forgetpasswordpage';
  static const resetpasswordpage = '/resetpasswordpage';
  static const orderconection = '/orderconection';
  static final List<GetPage<dynamic>> pages = [
    // GetPage(
    //   name: choseuserpage,
    //   page: () => const ChooseUserTypeScreen(),
    // ),
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
      name: orderconection,
      page: () => const OrderConnectionScreen(),
      binding: OrderConnectionBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => const ModeScreen(),
    ),
    GetPage(
      name: labDetailsPage,
      page: () => const LabDetailsPage(),
    ),
    GetPage(
      name: patientsPage,
      page: () => const PatientsPage(),
    ),
    GetPage(
      name: templatesPage,
      page: () => const TemplatesPage(),
    ),
    GetPage(
      name: templateDetailsPage,
      page: () => const TemplateDetailsPage(),
    ),
    GetPage(
      name: communityPage,
      page: () => const CommunityPage(),
    ),
    GetPage(
      name: notificationPage,
      page: () => const NotificationsPage(),
    ),

    GetPage(
      name: createPatientPage,
      page: () => const CreateNewPatientProfile(),
    ),
  ];
}
