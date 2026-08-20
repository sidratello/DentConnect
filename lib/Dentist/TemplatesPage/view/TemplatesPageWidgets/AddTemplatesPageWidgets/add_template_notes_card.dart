import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/add_template_controller.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class AddTemplateNotesCard extends GetView<AddTemplateController> {
  const AddTemplateNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الملاحظات",
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.noteController,
            decoration: InputDecoration(
              hintText: "أدخل ملاحظة",
              suffixIcon: IconButton(
                onPressed: controller.addNote,
                icon: const Icon(Icons.add_circle),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                controller.notes.length,
                (index) => Chip(
                  label: Text(controller.notes[index]),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: () {
                    controller.removeNote(index);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
