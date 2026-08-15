import 'package:flutter/material.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/clinical_notes_card.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/teeth_images_grid.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/xray_card.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/top_background.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/static.dart';
import '../model/patient_model.dart';

class PatientDetailsPage extends StatelessWidget {
  final PatientModel patient;

  const PatientDetailsPage({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
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
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              Static.getwidth(context, 24),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: Static.getwidth(context, 45),
                  backgroundImage:
                      const AssetImage('assets/images/patient.jpg'),
                ),
                AppSpacing.height(context, 12),
                Text(
                  patient.name,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 20),
                  ),
                ),
                AppSpacing.height(context, 24),
                ClinicalNotesCard(
                  notes: patient.clinicalNotes,
                ),
                AppSpacing.height(context, 20),
                XrayCard(
                  imagePath: patient.xrayImage,
                ),
                AppSpacing.height(context, 20),
                TeethImagesGrid(
                  images: patient.teethImages,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
