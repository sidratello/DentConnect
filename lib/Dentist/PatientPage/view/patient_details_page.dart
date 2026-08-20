import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/PatientPage/controller/patient_controller.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/edit_patient_page.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/patient_cases_section.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/clinical_notes_card.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/teeth_images_grid.dart';

import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

class PatientDetailsPage extends StatelessWidget {
  final PatientModel patient;

  const PatientDetailsPage({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    final PatientController controller = Get.find<PatientController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          'تفاصيل المريض',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'تعديل بيانات المريض',
            onPressed: () async {
              await Get.to(
                () => EditPatientPage(
                  patient: patient,
                ),
              );

              // تحديث قائمة المرضى بعد الرجوع
              await controller.fetchPatientList();
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: AppColors.black,
            ),
          ),
          const AppbarVectorBlack(),
        ],
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              Static.getwidth(context, 24),
            ),
            child: Column(
              children: [
                // --------------------------------------------------
                // Patient Avatar
                // --------------------------------------------------

                CircleAvatar(
                  radius: Static.getwidth(context, 45),
                  backgroundImage: const AssetImage(
                    'assets/images/patient.jpg',
                  ),
                ),

                AppSpacing.height(context, 12),

                // --------------------------------------------------
                // Patient Name
                // --------------------------------------------------

                Text(
                  patient.fullName ?? 'لا يوجد اسم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 20),
                  ),
                ),

                // --------------------------------------------------
                // Patient Age
                // --------------------------------------------------

                if (patient.age != null) ...[
                  AppSpacing.height(context, 6),
                  Text(
                    '${patient.age} سنة',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: Static.getwidth(context, 13),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],

                AppSpacing.height(context, 24),

                // --------------------------------------------------
                // Clinical Notes
                // --------------------------------------------------

                ClinicalNotesCard(
                  notes: patient.clinicalNotes?.trim().isNotEmpty == true
                      ? patient.clinicalNotes!
                      : 'لا توجد ملاحظات سريرية',
                ),

                AppSpacing.height(context, 20),

                // --------------------------------------------------
                // Before / After Images
                // --------------------------------------------------

                TeethImagesGrid(
                  images: patient.uploadedFiles ?? [],
                ),

                AppSpacing.height(context, 20),

                // --------------------------------------------------
                // Patient Cases
                // --------------------------------------------------

                const PatientCasesSection(),

                AppSpacing.height(context, 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
