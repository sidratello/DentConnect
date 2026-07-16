import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_actions.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_final_price_box.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_info_box.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_table.dart';
import 'package:template/lab/features/case_order_details/views/widget/notes_section.dart';

class InvoiceBottomSheet extends StatelessWidget {
  final CaseOrderDetailsController controller;

  const InvoiceBottomSheet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final quote = controller.quote.value;
    final order = controller.order.value;

    if (quote == null || order == null) {
      return const SizedBox.shrink();
    }

    return Container(
      height: MediaQuery.of(context).size.height * .82,
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          _buildHandle(),

          const SizedBox(height: 18),

          _buildHeader(),

          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InvoiceTable(
                    controller: controller,
                  ),

                  const SizedBox(height: 14),

                  InvoiceFinalPriceBox(
                    controller: controller,
                  ),

                  const SizedBox(height: 14),

                  DoctorNotesSection(
                    notes: quote.notes,
                    withCard: false,
                  ),

                  const SizedBox(height: 14),

                  const InvoiceInfoBox(),

                  const SizedBox(height: 18),

                  InvoiceActions(
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.grey400,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.close_rounded,
            color: AppColors.darkBlue,
          ),
        ),
        const Spacer(),
        Text(
          'عرض الفاتورة',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.receipt_long_outlined,
          color: AppColors.primaryBlue,
        ),
      ],
    );
  }
}