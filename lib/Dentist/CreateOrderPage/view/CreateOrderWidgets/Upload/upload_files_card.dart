import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Cards/order_details_card.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class UploadFilesCard extends GetView<CreateOrderController> {
  const UploadFilesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.model.value.impressionType != "digital") {
        return const SizedBox();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            icon: Icons.folder_zip_outlined,
            title: "ملفات الطبعة الرقمية",
          ),
          SizedBox(height: Static.getheight(context, 16)),
          OrderDetailsCard(
            child: Column(
              children: [
                GestureDetector(
                  onTap: controller.pickFiles,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: Static.getheight(context, 28),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.05),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.upload_file_outlined,
                          color: AppColors.primary,
                          size: 42,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "اختر ملفات الحالة",
                          style: TextStyle(
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.w600,
                            fontSize: Static.getwidth(context, 15),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "STL • PLY • OBJ • ZIP",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "IBM Plex Sans Arabic",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.files.isNotEmpty) ...[
                  SizedBox(
                    height: Static.getheight(context, 18),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.files.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, index) {
                      File file = controller.files[index];

                      return Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.insert_drive_file,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                file.path.split('/').last,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: "IBM Plex Sans Arabic",
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.removeFile(index);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ]
              ],
            ),
          ),
        ],
      );
    });
  }
}
