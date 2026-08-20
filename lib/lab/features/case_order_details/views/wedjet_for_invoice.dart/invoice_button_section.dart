import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';
import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_bottom_sheet.dart';

class InvoiceButtonSection extends StatelessWidget {
  const InvoiceButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(
          color: AppColors.primaryBlue,
          width: 1.3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: () {
        final controller = Get.find<CaseOrderDetailsController>();

        Get.bottomSheet(
          InvoiceBottomSheet(
            controller: controller,
          ),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
        );

      },
      icon: const Icon(
        Icons.receipt_long_outlined,
        color: AppColors.primaryBlue,
      ),
      label: Text(
        'عرض الفاتورة',
        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}