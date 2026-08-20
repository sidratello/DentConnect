import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/template_controller.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/add_template_page.dart';
import 'package:template/Dentist/TemplatesPage/view/TemplatesPageWidgets/template_card.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

class TemplatesPage extends GetView<TemplateController> {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: const [
          AppbarVectorBlack(),
        ],
        title: Text(
          'القوالب',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
      ),
      body: TopBackground(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 24),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.templates.length,
                  separatorBuilder: (_, __) => SizedBox(
                    height: Static.getheight(context, 12),
                  ),
                  itemBuilder: (context, index) {
                    final template = controller.templates[index];

                    return TemplateCard(
                      template: template,
                      onDelete: () => controller.deleteTemplate(template.id),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(
          Static.getwidth(context, 24),
          0,
          Static.getwidth(context, 24),
          Static.getheight(context, 18),
        ),
        child: SizedBox(
          height: Static.getheight(context, 56),
          child: ElevatedButton.icon(
            onPressed: () {
              Get.to(
                () => const AddTemplatePage(),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            icon: const Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
            label: Text(
              'إضافة قالب جديد',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w700,
                fontSize: Static.getwidth(context, 17),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
