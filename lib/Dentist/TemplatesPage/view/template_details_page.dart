import 'package:flutter/material.dart';
import 'package:template/Dentist/TemplatesPage/model/template_model.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_impression_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_options_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_required_images_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_work_type_card.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_color_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_duration_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_materials_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_notes_card.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_preview_card.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/top_background.dart';

import '../../../core/theme/app_colors.dart';

class TemplateDetailsPage extends StatelessWidget {
  final CaseTemplate template;

  const TemplateDetailsPage({
    super.key,
    required this.template,
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
          'عرض القالب',
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
                TemplatePreviewCard(
                  title: template.title,
                ),
                AppSpacing.height(context, 16),
                TemplateWorkTypeCard(
                  workType: template.workType,
                ),
                AppSpacing.height(context, 16),
                TemplateColorCard(
                  color: template.defaultShade,
                ),
                AppSpacing.height(context, 16),
                TemplateMaterialsCard(
                  materials: template.materials,
                ),
                AppSpacing.height(context, 16),
                TemplateImpressionCard(
                  impression: template.preferredImpression,
                ),
                AppSpacing.height(context, 16),
                TemplateRequiredImagesCard(
                  images: template.requiredImages,
                ),
                AppSpacing.height(context, 16),
                TemplateDurationCard(
                  days: template.deliveryDays,
                ),
                AppSpacing.height(context, 16),
                TemplateNotesCard(
                  notes: template.notes,
                ),
                AppSpacing.height(context, 16),
                TemplateOptionsCard(
                  urgent: template.isUrgent,
                  tryIn: template.needsTryIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
