import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/lab_ad/view/widgets_details_screen.dart/details_content_card.dart';
import 'package:template/lab/features/lab_ad/view/widgets_details_screen.dart/details_image_section.dart';
import 'package:template/lab/features/lab_ad/view/widgets_details_screen.dart/details_info_card.dart';

import '../../controller/lab_ad_details_controller.dart';


import 'lab_ad_details_header.dart';

class LabAdDetailsBody
    extends GetView<
        LabAdDetailsController> {
  const LabAdDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final advertisement =
        controller.advertisement;

    return ListView(
      padding:
          const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        24,
      ),
      children: [
        const LabAdDetailsHeader(),

        const SizedBox(height: 6),

        LabAdDetailsImageSection(
          images:
              advertisement.images,
        ),

        const SizedBox(height: 20),

        LabAdDetailsContentCard(
          content:
              advertisement.content,
        ),

        const SizedBox(height: 16),

        LabAdDetailsInfoCard(
          isActive:
              advertisement.isActive,
          isPaid:
              advertisement.isPaid,
          price:
              controller.formatPrice(
            advertisement.price,
          ),
            showPrice:
      advertisement.price > 0,
          createdAt:
              controller.formatDate(
            advertisement.createdAt,
          ),
          expiresAt:
              controller.formatDate(
            advertisement.expiresAt,
          ),
        ),
      ],
    );
  }
}