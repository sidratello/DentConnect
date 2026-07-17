import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/create_patient_button.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/patient_card.dart';
import 'package:template/Dentist/PatientPage/view/patient_details_page.dart';
import 'package:template/core/widgets/top_background.dart';
import '../../../../core/utils/static.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/patient_files_empty_state.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/patient_files_preview_card.dart';

import '../../../core/theme/app_colors.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final patients = [
      const PatientModel(
        name: 'أحمد محمد',
        clinicalNotes:
            'يعاني من تآكل متوسط في الأسنان الخلفية مع حساسية بسيطة في الأسنان الأمامية.',
        xrayImage: 'assets/images/xray.jpg',
        teethImages: [
          'assets/images/teeth1.jpg',
          'assets/images/teeth2.jpg',
          'assets/images/teeth3.jpg',
        ],
      ),
      const PatientModel(
        name: 'محمد علي',
        clinicalNotes:
            'يوجد فقدان جزئي في الأسنان الخلفية ويحتاج إلى خطة تعويض مستقبلية.',
        xrayImage: 'assets/images/xray.jpg',
        teethImages: [
          'assets/images/teeth1.jpg',
          'assets/images/teeth2.jpg',
        ],
      ),
    ];

    final appModeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          'ملفات المرضى',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              Static.getwidth(context, 24),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () {
                      if (appModeController.isPreviewMode.value) {
                        return const Center(
                          child: PatientFilesPreviewCard(),
                        );
                      }
                      if (patients.isEmpty) {
                        return const PatientFilesEmptyState();
                      }
                      return ListView.separated(
                        itemCount: patients.length,
                        separatorBuilder: (_, __) => SizedBox(
                          height: Static.getheight(context, 14),
                        ),
                        itemBuilder: (context, index) {
                          final patient = patients[index];
                          return PatientCard(
                            patient: patient,
                            onTap: () {
                              Get.to(
                                () => PatientDetailsPage(
                                  patient: patient,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                AppSpacing.height(context, 16),
                if (!appModeController.isPreviewMode.value)
                  const CreatePatientButton(),
                AppSpacing.height(context, 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
