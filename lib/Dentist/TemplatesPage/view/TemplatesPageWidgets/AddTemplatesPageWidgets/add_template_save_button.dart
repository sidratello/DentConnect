import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/add_template_controller.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class AddTemplateSaveButton extends GetView<AddTemplateController> {
  const AddTemplateSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.all(
          Static.getwidth(context, 24),
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: SizedBox(
          width: double.infinity,
          height: Static.getheight(context, 56),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: controller.saveTemplate,
            icon: const Icon(
              Icons.save_rounded,
              color: Colors.white,
            ),
            label: Text(
              "حفظ القالب",
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w700,
                fontSize: Static.getwidth(context, 16),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
