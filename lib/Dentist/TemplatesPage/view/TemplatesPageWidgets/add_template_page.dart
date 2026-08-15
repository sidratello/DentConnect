import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/add_template_controller.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';
import 'AddTemplatesPageWidgets/add_template_basic_info_card.dart';
import 'AddTemplatesPageWidgets/add_template_materials_card.dart';
import 'AddTemplatesPageWidgets/add_template_images_card.dart';
import 'AddTemplatesPageWidgets/add_template_notes_card.dart';
import 'AddTemplatesPageWidgets/add_template_options_card.dart';
import 'AddTemplatesPageWidgets/add_template_save_button.dart';

class AddTemplatePage extends GetView<AddTemplateController> {
  const AddTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddTemplateController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          AppbarVectorBlack(),
        ],
        title: Text(
          'إضافة قالب جديد',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
      ),
      body: TopBackground(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(
                    Static.getwidth(context, 24),
                  ),
                  child: const Column(
                    children: [
                      AddTemplateBasicInfoCard(),
                      AppSpacingHeight16(),
                      AddTemplateMaterialsCard(),
                      AppSpacingHeight16(),
                      AddTemplateImagesCard(),
                      AppSpacingHeight16(),
                      AddTemplateNotesCard(),
                      AppSpacingHeight16(),
                      AddTemplateOptionsCard(),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
              const AddTemplateSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSpacingHeight16 extends StatelessWidget {
  const AppSpacingHeight16({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSpacing.height(context, 16);
  }
}
