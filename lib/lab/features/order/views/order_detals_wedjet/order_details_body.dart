import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/order/controller/order_details_controller.dart';

import 'package:template/lab/features/case_order_details/views/widget/case_order_details_header.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_top_card.dart';
import 'package:template/lab/features/case_order_details/views/widget/required_teeth_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/doctor_info_section.dart.dart';
import 'package:template/lab/features/case_order_details/views/widget/notes_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/required_images_section.dart';

import 'package:template/lab/features/order/views/order_detals_wedjet/FilesSection.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/order_details_actions.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/order_details_info_section.dart';

class OrderDetailsBodyWidget extends StatelessWidget {
  const OrderDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderDetailsController>();
    final order = controller.order;

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 40),
      children: [
        const CaseOrdersdetalsHeader(),

        DetailsSectionCard(
          child: DetailsTopCard(
            order: order,
            date: order.formattedDeliveryDate,
          ),
        ),

        OrderDetailsInfoSection(
          order: order,
        ),

        RequiredTeethSection(
          items: order.items,
        ),

        DoctorInfoSection(
          order: order,
        ),

        DoctorNotesSection(
          notes: order.notes,
        ),

        RequiredImagesSection(
          images: order.requiredImages,
        ),

        FilesSection(
          order: order,
        ),
        const SizedBox(height: 12),
           OrderDetailsActionsWidget(),
      ],
    );
  }
}