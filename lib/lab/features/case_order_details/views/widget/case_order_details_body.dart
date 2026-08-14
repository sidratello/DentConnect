import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_button_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/case_order_details_header.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/features/case_order_details/views/widget/doctor_info_section.dart.dart';
import 'package:template/lab/features/case_order_details/views/widget/notes_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/order_info_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/required_images_section.dart';
import 'package:template/lab/features/case_order_details/views/widget/required_teeth_section.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/FilesSection.dart';
import '../../controller/case_order_details_controller.dart';
import 'details_top_card.dart';


class CaseOrderDetailsBody extends StatelessWidget {
  const 
  CaseOrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseOrderDetailsController>();

    return Obx(() {
      if (controller.isLoading.value) {
         return const AppLoadingIndicator();
      }

      final order = controller.order.value;
      final quote = controller.quote.value;

      if (order == null || quote == null) {
        return const Center(child: Text('لا توجد بيانات'));
      }

      return RefreshIndicator(
        onRefresh: controller.getData,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 110),
          children: [
            CaseOrdersdetalsHeader(
  onBack: controller.goBack,
),
           
            DetailsSectionCard(
              child: DetailsTopCard(
                order: order,
                date: controller.formatDate(order.deliveryDate),
              ),
            ),

         OrderInfoSection(
  order: order,
  quote: quote,
  formatPrice: controller.formatPrice,
),

RequiredTeethSection(
  items: order.items,
),

      DoctorInfoSection(
  order: order,
),

          RequiredImagesSection(
  images: order.requiredImages,
),

    FilesSection(order: order),
    const SizedBox(height: 18),

            // DetailsSectionCard(
            //   child: QuoteCard(quote: quote),
            // ),


DoctorNotesSection(
  notes: order.notes,
),
const SizedBox(height: 14),
const InvoiceButtonSection(),
          ],
        ),
      );
    });
  }


}