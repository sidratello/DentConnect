import 'package:get/get.dart';
import 'package:template/Dentist/MainPage/view/main_page.dart';
import 'package:template/auth/binding/forpa_binding.dart';
import 'package:template/auth/binding/login_binding.dart';
import 'package:template/auth/binding/otp_binding.dart';
import 'package:template/auth/binding/reset_password_binding.dart';
import 'package:template/auth/binding/signup_binding.dart';
import 'package:template/auth/view/forget_password.dart';
import 'package:template/auth/view/login_screen.dart';
import 'package:template/auth/view/otp_screen.dart';
import 'package:template/auth/view/reset_password_screen.dart';
import 'package:template/Dentist/CommunityPage/view/community_page.dart';
import 'package:template/Dentist/ComplaintPage/view/complaint_page.dart';
import 'package:template/Dentist/CreateOrderPage/view/create_order_page.dart';
import 'package:template/Dentist/LabDetailsPage/view/lab_details_page.dart';
import 'package:template/Dentist/NotificationsPage/view/notifications_page.dart';
import 'package:template/Dentist/PatientPage/view/create_new_patient_profile.dart';
import 'package:template/Dentist/PatientPage/view/patient_page.dart';
import 'package:template/Dentist/TemplatesPage/view/templates_page.dart';
import 'package:template/auth/view/signup_screen.dart';

import 'package:template/choose_user_type/view/choose_user_type.dart';
import 'package:template/lab/features/add_scan_slot/binding/add_scan_slot_binding.dart';
import 'package:template/lab/features/add_scan_slot/binding/booked_scan_appointments_binding.dart';
import 'package:template/lab/features/add_scan_slot/binding/scan_slots_binding.dart';
import 'package:template/lab/features/add_scan_slot/binding/update_scan_slot_binding.dart';
import 'package:template/lab/features/add_scan_slot/views/UpdateScanSlotScreen.dart';
import 'package:template/lab/features/add_scan_slot/views/add_scan_slot_screen.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_screen.dart';
import 'package:template/lab/features/add_scan_slot/views/scan_slots_screen.dart';
import 'package:template/lab/features/case_order_details/binding/case_order_details_binding.dart';
import 'package:template/lab/features/case_order_details/views/case_order_details_screen.dart';
import 'package:template/lab/features/case_orders/binding/case_orders_binding.dart';
import 'package:template/lab/features/case_orders/views/case_orders_screen.dart';
import 'package:template/lab/features/case_status/binding/case_status_binding.dart';
import 'package:template/lab/features/case_status/views/case_status_screen.dart';
import 'package:template/lab/features/homepage/binding/homebinding.dart';
import 'package:template/lab/features/homepage/lab_home_page.dart';
import 'package:template/lab/features/lab_ad/binding/create_lab_ad_binding.dart';
import 'package:template/lab/features/lab_ad/binding/lab_ad_details_binding.dart';
import 'package:template/lab/features/lab_ad/binding/lab_ad_feed_binding.dart';
import 'package:template/lab/features/lab_ad/binding/lab_ads_binding.dart';
import 'package:template/lab/features/lab_ad/view/create_lab_ad_screen.dart';
import 'package:template/lab/features/lab_ad/view/lab_ad_details_screen.dart';
import 'package:template/lab/features/lab_ad/view/lab_ad_feed_screen.dart';
import 'package:template/lab/features/lab_ad/view/lab_ads_screen.dart';
import 'package:template/lab/features/lab_ad_payment/binding/ad_payment_binding.dart';
import 'package:template/lab/features/lab_ad_payment/view/ad_payment_screen.dart';
import 'package:template/lab/features/lab_ad_payment/view/lab_falure_pay.dart';
import 'package:template/lab/features/lab_ad_payment/view/sucess_pay.dart';
import 'package:template/lab/features/lab_blog/binding/blog_feed_binding.dart';
import 'package:template/lab/features/lab_blog/binding/create_blog_binding.dart';
import 'package:template/lab/features/lab_blog/binding/posts_binding.dart';
import 'package:template/lab/features/lab_blog/view/blog_details_screen.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_screen.dart';
import 'package:template/lab/features/lab_blog/view/create_blog_screen.dart';
import 'package:template/lab/features/lab_blog/view/pennding_posts_screen.dart';
import 'package:template/lab/features/lab_complaint/binding/LabComplaintDetailsBinding.dart';
import 'package:template/lab/features/lab_complaint/binding/LabComplaintsBinding.dart';
import 'package:template/lab/features/lab_complaint/view/LabComplaintDetailsScreen.dart';
import 'package:template/lab/features/lab_complaint/view/LabComplaintsScreen.dart';
import 'package:template/lab/features/monthly_calendar/binding/calendar_day_details_binding.dart';
import 'package:template/lab/features/monthly_calendar/binding/monthly_calendar_binding.dart';
import 'package:template/lab/features/monthly_calendar/view/day_details_screen.dart';
import 'package:template/lab/features/monthly_calendar/view/monthly_calendar_screen.dart';
import 'package:template/lab/features/order/binding/order_binding.dart';
import 'package:template/lab/features/order/binding/order_details_binding.dart';
import 'package:template/lab/features/order/views/order_details_screen.dart';
import 'package:template/lab/features/order/views/order_screen.dart';
import 'package:template/lab/features/order_invoice/binding/LabInvoicesBinding.dart';
import 'package:template/lab/features/order_invoice/views/LabInvoicesScreen.dart';
import 'package:template/lab/features/orderconection/binding/doctor_orders_binding.dart';

import 'package:template/lab/features/orderconection/binding/orderconection_binding.dart';
import 'package:template/lab/features/orderconection/views/doctor_orders_screen.dart';
import 'package:template/lab/features/orderconection/views/orderconection.dart';
import 'package:template/lab/features/profile/binding/edit_profile_binding.dart';
import 'package:template/lab/features/profile/binding/profile_binding.dart';
import 'package:template/lab/features/profile/views/edit_profile_screen.dart';
import 'package:template/lab/features/profile/views/profile.dart';
import 'package:template/lab/features/subscription/binding/LabSubscriptionBinding.dart';
import 'package:template/lab/features/subscription/binding/SubscriptionPlansBinding.dart';
import 'package:template/lab/features/subscription/view/lab_subscription_screen.dart';
import 'package:template/lab/features/subscription/view/subscription_plans_screen.dart';
import 'package:template/lab/features/update_order_satatus/binding/update_order_status_binding.dart';
import 'package:template/lab/features/update_order_satatus/views/update_order_status_screen.dart';

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
  static const caseStatus = '/caseStatus';
  static const caseOrders = '/caseOrders';
  static const caseOrderDetails = '/caseOrderDetails';
  static const updateOrderStatus = '/updateOrderStatus';
  static const doctorOrders = '/doctorOrders';
  static const addScanSlot = '/addScanSlot';
  static const scanSlots = '/scan-slots';
  static const updateScanSlot = '/updateScanSlot';
  static const bookedScanAppointments = '/booked-scan-appointments';
  static const createBlog = '/create-blog';
  static const penndingPosts = '/pennding-posts';
  static const String blogFeed = '/blog-feed';
  static const String blogPostDetails = '/blog-post-details';
  static const monthlyCalendar = '/monthly-calendar';
  static const calendarDayDetails = '/calendar-day-details';
  static const createLabAd = '/create-lab-ad';
  static const labAds = '/lab-ads';
  static const labAdDetails = '/lab-ad-details';
  static const labAdPayment = '/lab-ad-payment';
  static const labAdPaymentSuccess = '/lab-ad-payment-success';

  static const labAdPaymentFailed = '/lab-ad-payment-failed';
  static const labAdFeed = '/lab-ad-feed';

  static const String labInvoices = '/lab-invoices';
  static const String labComplaints = '/lab-complaints';

  static const String labComplaintDetails = '/lab-complaint-details';

  static const String labSubscription = '/lab-subscription';

  static const String subscriptionPlans = '/subscription-plans';
  static const dentistHomePage = '/dentist-home-page';

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
    GetPage(
      name: caseStatus,
      page: () => const CaseStatusScreen(),
      binding: CaseStatusBinding(),
    ),
    GetPage(
      name: caseOrders,
      page: () => const CaseOrdersScreen(),
      binding: CaseOrdersBinding(),
    ),
    GetPage(
      name: caseOrderDetails,
      page: () => const CaseOrderDetailsScreen(),
      binding: CaseOrderDetailsBinding(),
    ),
    GetPage(
      name: updateOrderStatus,
      page: () => const UpdateOrderStatusScreen(),
      binding: UpdateOrderStatusBinding(),
    ),
    GetPage(
      name: doctorOrders,
      page: () => const DoctorOrdersScreen(),
      binding: DoctorOrdersBinding(),
    ),
    GetPage(
      name: scanSlots,
      page: () => const ScanSlotsScreen(),
      binding: ScanSlotsBinding(),
    ),
    GetPage(
      name: addScanSlot,
      page: () => const AddScanSlotScreen(),
      binding: AddScanSlotBinding(),
    ),
    GetPage(
      name: updateScanSlot,
      page: () => const UpdateScanSlotScreen(),
      binding: UpdateScanSlotBinding(),
    ),
    GetPage(
      name: AppRouter.bookedScanAppointments,
      page: () => const BookedScanAppointmentsScreen(),
      binding: BookedScanAppointmentsBinding(),
    ),
    GetPage(
      name: createBlog,
      page: () => const CreateBlogScreen(),
      binding: CreateBlogBinding(),
    ),
    GetPage(
      name: penndingPosts,
      page: () => const MyBlogPostsScreen(),
      binding: MyBlogPostsBinding(),
    ),
    GetPage(
      name: AppRouter.blogFeed,
      page: () => const BlogFeedScreen(),
      binding: BlogFeedBinding(),
    ),
    GetPage(
      name: AppRouter.blogPostDetails,
      page: () => const BlogPostDetailsScreen(),
    ),
    GetPage(
      name: AppRouter.monthlyCalendar,
      page: () => const MonthlyCalendarScreen(),
      binding: MonthlyCalendarBinding(),
    ),
    GetPage(
      name: AppRouter.calendarDayDetails,
      page: () => const CalendarDayDetailsScreen(),
      binding: CalendarDayDetailsBinding(),
    ),
    GetPage(
      name: createLabAd,
      page: () => const CreateLabAdScreen(),
      binding: CreateLabAdBinding(),
    ),
    GetPage(
      name: labAds,
      page: () => const LabAdsScreen(),
      binding: LabAdsBinding(),
    ),
    GetPage(
      name: labAdDetails,
      page: () => const LabAdDetailsScreen(),
      binding: LabAdDetailsBinding(),
    ),
    GetPage(
      name: labAdPayment,
      page: () => const LabAdPaymentScreen(),
      binding: LabAdPaymentBinding(),
    ),
    GetPage(
      name: labAdPaymentSuccess,
      page: () => const LabAdPaymentSuccessScreen(),
    ),
    GetPage(
      name: labAdPaymentFailed,
      page: () => const LabAdPaymentFailedScreen(),
    ),
    GetPage(
      name: AppRouter.labAdFeed,
      page: () => const LabAdFeedScreen(),
      binding: LabAdFeedBinding(),
    ),
    GetPage(
      name: labInvoices,
      page: () => const LabInvoicesScreen(),
      binding: LabInvoicesBinding(),
    ),
    GetPage(
      name: labComplaints,
      page: () => const LabComplaintsScreen(),
      binding: LabComplaintsBinding(),
    ),
    GetPage(
      name: labComplaintDetails,
      page: () => const LabComplaintDetailsScreen(),
      binding: LabComplaintDetailsBinding(),
    ),
    GetPage(
      name: labSubscription,
      page: () => const LabSubscriptionScreen(),
      binding: LabSubscriptionBinding(),
    ),
    GetPage(
      name: subscriptionPlans,
      page: () => const SubscriptionPlansScreen(),
      binding: SubscriptionPlansBinding(),
    ),
    GetPage(
      name: complaintPage,
      page: () => ComplaintPage(),
    ),
    GetPage(
      name: dentistHomePage,
      page: () => MainPage(),
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
