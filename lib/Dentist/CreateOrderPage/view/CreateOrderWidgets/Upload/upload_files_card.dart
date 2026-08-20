import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Cards/order_details_card.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

class UploadFilesCard extends GetView<CreateOrderController> {
  const UploadFilesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          'اختيار الملفات الطبية',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          AppbarVectorBlack(),
        ],
      ),

      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      icon: Icons.folder_zip_outlined,
                      title: "ملفات الطبعة الرقمية",
                    ),
                    SizedBox(
                      height: Static.getheight(context, 16),
                    ),
                    OrderDetailsCard(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: controller.pickFile,
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
                                    controller.selectedFile.value == null
                                        ? "اختر ملف الحالة"
                                        : "تغيير الملف",
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
                          if (controller.selectedFile.value != null) ...[
                            SizedBox(
                              height: Static.getheight(context, 18),
                            ),
                            _buildSelectedFile(
                              context,
                              controller.selectedFile.value!,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),

      // --------------------------------------------------
      // Upload Button
      // --------------------------------------------------
      bottomNavigationBar: SafeArea(
        child: Obx(
          () {
            final bool hasFile = controller.selectedFile.value != null;

            return Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                16,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border(
                  top: BorderSide(
                    color: AppColors.border.withOpacity(.7),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: hasFile ? controller.uploadFile : null,
                  icon: const Icon(
                    Icons.cloud_upload_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'رفع الملف',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: Colors.grey.shade300,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSelectedFile(
    BuildContext context,
    File file,
  ) {
    return Container(
      width: double.infinity,
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
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.insert_drive_file_outlined,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.split(Platform.pathSeparator).last,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "IBM Plex Sans Arabic",
                    fontSize: Static.getwidth(context, 12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "تم اختيار الملف",
                  style: TextStyle(
                    fontFamily: "IBM Plex Sans Arabic",
                    fontSize: Static.getwidth(context, 10),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: controller.removeFile,
            tooltip: 'حذف الملف',
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
