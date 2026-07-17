import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/LabDetailsPage/controller/lab_controller.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/appbar_lab_details_vector.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_case_list.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_case_with_doctor_list.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_create_request_button.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_container.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_works_header.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_works_with_doctor_header.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/labs_backgroung_image.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_spacing.dart';

class LabDetailsPage extends StatelessWidget {
  const LabDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LabController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          elevation: 0,
          surfaceTintColor: AppColors.surfaceTintColor,
          automaticallyImplyLeading: false,
          actions: const [AppbarLabDetailsVector()],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LabsBackgroungImage(),
              const LabDetailsContainer(),
              const LabCreateRequestButton(),
              const LabDetailsWorksHeader(),
              const LabCaseList(),
              Obx(
                () {
                  final controller = Get.find<LabController>();
                  final homeController = Get.find<HomeController>();
                  final bool canShowCases = !homeController
                          .isPreviewMode.value &&
                      controller.followStatus.value == FollowStatus.following;

                  if (!canShowCases) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 26,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 28,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.border,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.03),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: const BoxDecoration(
                                color: AppColors.boxBlack,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.history_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                size: 34,
                              ),
                            ),
                            AppSpacing.height(context, 14),
                            Text(
                              'حالاتك السابقة مع المخبر',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            AppSpacing.height(context, 10),
                            const Text(
                              'بعد متابعة المخبر وإنشاء أول طلب، ستظهر هنا جميع الحالات السابقة الخاصة بك مع تفاصيلها الكاملة.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 1.7,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Column(
                    children: [
                      LabDetailsWorksWithDoctorHeader(),
                      LabCaseWithDoctorList(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
