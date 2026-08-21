import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/Dentist/TemplatesPage/view/template_details_page.dart';
import 'package:template/Dentist/TemplatesPage/model/template_model.dart';
import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class TemplateCard extends StatelessWidget {
  final CaseTemplate template;
  final VoidCallback onDelete;

  const TemplateCard({
    super.key,
    required this.template,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.to(
          () => TemplateDetailsPage(
            template: template,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: Static.getheight(context, 62),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/template.png',
                width: Static.getwidth(context, 62),
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Static.getwidth(context, 16),
                ),
                child: Text(
                  template.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: Static.getwidth(context, 22),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Static.getwidth(context, 12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: onDelete,
                child: Container(
                  width: Static.getwidth(context, 36),
                  height: Static.getwidth(context, 36),
                  decoration: const BoxDecoration(
                    color: AppColors.boxRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.error,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
