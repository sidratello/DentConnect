import 'package:flutter/material.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/save_patient_profile.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/upload_field.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/app_text_field.dart';
import 'package:template/core/widgets/top_background.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_spacing.dart';

class CreateNewPatientProfile extends StatelessWidget {
  const CreateNewPatientProfile({
    super.key,
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
        title: Text(
          'ملف مريض جديد',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 24),
            ),
            child: Column(
              children: [
                AppSpacing.height(context, 16),
                const AppTextField(
                  hint: 'اسمه',
                ),
                AppSpacing.height(context, 12),
                const AppTextField(
                  hint: 'ملاحظات سريرية عن أمراضه وما يخص حالة أسنانه',
                  maxLines: 4,
                ),
                AppSpacing.height(context, 12),
                const UploadField(
                  title: 'صور لأسنانه حالياً',
                ),
                AppSpacing.height(context, 12),
                const UploadField(
                  title: 'صورة أشعة',
                ),
                AppSpacing.height(context, 24),
                const SavePatientProfile(),
                AppSpacing.height(context, 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
