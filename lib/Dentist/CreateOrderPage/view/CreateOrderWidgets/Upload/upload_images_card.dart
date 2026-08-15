import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Cards/order_details_card.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class UploadImagesCard extends GetView<CreateOrderController> {
  const UploadImagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          icon: Icons.photo_library_outlined,
          title: "صور الحالة",
        ),
        SizedBox(height: Static.getheight(context, 16)),
        OrderDetailsCard(
          child: Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: controller.pickImages,
                  child: DottedBorderWidget(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          size: 42,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "اضغط لاختيار الصور",
                          style: TextStyle(
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.w600,
                            fontSize: Static.getwidth(context, 15),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "PNG • JPG • JPEG",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "IBM Plex Sans Arabic",
                            fontSize: Static.getwidth(context, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.images.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (_, index) {
                      final File image = controller.images[index];

                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(index),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DottedBorderWidget extends StatelessWidget {
  final Widget child;

  const DottedBorderWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(context, 30),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
        color: AppColors.primary.withOpacity(.05),
      ),
      child: child,
    );
  }
}
