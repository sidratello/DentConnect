import 'package:get/get.dart';
import 'package:template/Dentist/CommunityPage/view/community_page.dart';
import 'package:template/Dentist/ComplaintPage/view/complaint_page.dart';
import 'package:template/Dentist/CreateOrderPage/view/create_order_page.dart';
import 'package:template/Dentist/HomePage/view/view_only.dart';
import 'package:template/Dentist/LabDetailsPage/view/lab_details_page.dart';
import 'package:template/Dentist/NotificationsPage/view/notifications_page.dart';
import 'package:template/Dentist/PatientPage/view/create_new_patient_profile.dart';
import 'package:template/Dentist/PatientPage/view/patient_page.dart';
import 'package:template/Dentist/TemplatesPage/view/templates_page.dart';

abstract class AppRouter {
  // static const choseuserpage = '/';
  static const homePage = '/';
  static const createOrderPage = '/createOrderPage';
  static const labDetailsPage = '/labDetailsPage';
  static const casePage = '/casePage';
  static const patientsPage = '/patientsPage';
  static const createPatientPage = '/createPatientPage';
  static const templatesPage = '/templatesPage';
  static const templateDetailsPage = '/templateDetailsPage';
  static const communityPage = '/communityPage';
  static const complaintPage = '/complaintPage';
  static const notificationPage = '/notificationPage';
  static const loginpage = '/loginpage';
  static const signuppage = '/signuppage';
  static const forgetpasswordpage = '/forgetpasswordpage';
  static const resetpasswordpage = '/resetpasswordpage';
  static const orderconection = '/orderconection';
  static final List<GetPage<dynamic>> pages = [
    // GetPage(
    //   name: choseuserpage,
    //   page: () => const ChooseUserTypeScreen(),
    // ),
    GetPage(
      name: complaintPage,
      page: () => ComplaintPage(),
    ),
    GetPage(
      name: homePage,
      page: () => const ModeScreen(),
    ),
    GetPage(
      name: labDetailsPage,
      page: () => LabDetailsPage(id: Get.arguments),
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
    GetPage(
      name: createOrderPage,
      page: () => const CreateOrderPage(),
    ),
  ];
}
