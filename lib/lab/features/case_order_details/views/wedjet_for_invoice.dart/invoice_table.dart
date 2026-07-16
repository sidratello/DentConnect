

import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';




class InvoiceTable extends StatelessWidget {
  final CaseOrderDetailsController controller;

  const InvoiceTable({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final quote = controller.quote.value!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.6),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.littleBlue.withOpacity(.22),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: const [
                _HeaderCell('الصنف'),
                _HeaderCell('الأسنان'),
                _HeaderCell('الكمية'),
                _HeaderCell('سعر الوحدة'),
                _HeaderCell('الإجمالي'),
              ],
            ),
          ),

...quote.lines.map((line) {
  final priceMissing = !line.priceFound;

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
    decoration: BoxDecoration(
      color: priceMissing
          ? const Color(0xFFFFF7E6)
          : AppColors.white,
      border: Border(
        top: BorderSide(
          color: priceMissing
              ? const Color(0xFFE69500).withOpacity(.45)
              : AppColors.littleBlue.withOpacity(.45),
        ),
      ),
    ),
    child: Row(
      textDirection: TextDirection.rtl,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (priceMissing) ...[
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 16,
                  color: Color(0xFFE69500),
                ),
                const SizedBox(width: 4),
              ],
              Flexible(
                child: Text(
                  line.compensationTypeAr.isEmpty
                      ? line.compensationType
                      : line.compensationTypeAr,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    color: priceMissing
                        ? const Color(0xFFE69500)
                        : AppColors.darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        _BodyCell(line.toothNumbers.join('، ')),
        _BodyCell('${line.quantity}'),
        _BodyCell(
          priceMissing ? 'غير محدد' : controller.formatPrice(line.unitPrice),
          color: priceMissing ? const Color(0xFFE69500) : AppColors.darkBlue,
        ),
        _BodyCell(
          priceMissing ? '-' : controller.formatPrice(line.lineTotal),
          color: priceMissing ? const Color(0xFFE69500) : AppColors.darkBlue,
        ),
      ],
    ),
  );
}),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.littleBlue.withOpacity(.6),
                ),
              ),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'المجموع التقديري',
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Text(
                  controller.formatPrice(quote.estimatedTotal),
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
          color: AppColors.darkBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final String text;
  final Color? color;

  const _BodyCell(
    this.text, {
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
          color: color ?? AppColors.darkBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}