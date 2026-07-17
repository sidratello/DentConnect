import 'package:flutter/material.dart';
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
  const TemplateDetailsPage({super.key});

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
                const TemplatePreviewCard(),
                AppSpacing.height(context, 16),
                const TemplateColorCard(),
                AppSpacing.height(context, 16),
                const TemplateMaterialsCard(),
                AppSpacing.height(context, 16),
                const TemplateDurationCard(),
                AppSpacing.height(context, 16),
                const TemplateNotesCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
