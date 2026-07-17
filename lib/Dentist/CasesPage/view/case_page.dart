import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_section.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/cases_preview_card.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/DrawerWidgets/app_drawer.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/top_background.dart';

import '../controller/case_controller.dart';
import '../model/case_status.dart';

class CasePage extends StatelessWidget {
  const CasePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CaseController());
    final appModeController = Get.find<HomeController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          title: Text(
            'إدارة الحالات',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
          centerTitle: true,
        ),
        body: TopBackground(
          body: SafeArea(
            child: Obx(
              () => appModeController.isPreviewMode.value
                  ? const Center(
                      child: SingleChildScrollView(
                      child: CasesPreviewCard(),
                    ))
                  : const SingleChildScrollView(
                      child: Column(
                        children: [
                          CaseSection(
                            title: 'الحالات بانتظار الموافقة',
                            status: CaseStatus.waitingApproval,
                          ),
                          CaseSection(
                            title: 'الحالات المقبولة',
                            status: CaseStatus.accepted,
                          ),
                          CaseSection(
                            title: 'تحتاج معلومات إضافية',
                            status: CaseStatus.needInfo,
                          ),
                          CaseSection(
                            title: 'قيد التصميم',
                            status: CaseStatus.inDesign,
                          ),
                          CaseSection(
                            title: 'قيد التنفيذ',
                            status: CaseStatus.inProgress,
                          ),
                          CaseSection(
                            title: 'جاهزة',
                            status: CaseStatus.ready,
                          ),
                          CaseSection(
                            title: 'تم التسليم',
                            status: CaseStatus.delivered,
                          ),
                          CaseSection(
                            title: 'ملغاة',
                            status: CaseStatus.cancelled,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
