
import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';

class InvoiceFinalPriceBox extends StatelessWidget {
  final CaseOrderDetailsController controller;

  const InvoiceFinalPriceBox({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final quote = controller.quote.value!;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.6),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'السعر النهائي',
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: controller.finalPriceController,
                  enabled: !quote.isPaid,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixText: 'ل.س',
                    prefixIcon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: AppColors.primaryBlue,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'حالة الدفع',
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: quote.isPaid
                      ? AppColors.green.withOpacity(.1)
                      : AppColors.red.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  quote.isPaid ? 'مدفوع' : 'غير مدفوع',
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    color: quote.isPaid ? AppColors.green : AppColors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}