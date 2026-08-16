import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order_invoice/model/invoice_table_item.dart';


class InvoiceTable extends StatelessWidget {
  final List<InvoiceTableItem> items;

  final double total;
 final double? finalPrice;
  final String totalTitle;
  final String finalPriceTitle;
  const InvoiceTable({
    super.key,
    required this.items,
    required this.total,
    this.totalTitle = 'المجموع التقديري',
     this.finalPrice,
    this.finalPriceTitle = 'السعر النهائي',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color:
              AppColors.littleBlue.withOpacity(.6),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Column(
          children: [
            const _InvoiceTableHeader(),

            ...items.map(
              (item) => _InvoiceTableRow(
                item: item,
              ),
            ),

            _InvoiceTotalRow(
              title: totalTitle,
              total: total,
            ),
            if (finalPrice != null)
  _InvoiceTotalRow(
    title: finalPriceTitle,
    total: finalPrice!,
    highlighted: true,
  ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// Header
// =====================================================

class _InvoiceTableHeader
    extends StatelessWidget {
  const _InvoiceTableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      color:
          AppColors.littleBlue.withOpacity(.22),
      child: const Row(
        textDirection: TextDirection.rtl,
        children: [
          _HeaderCell('الصنف'),
          _HeaderCell('الأسنان'),
          _HeaderCell('الكمية'),
          _HeaderCell('سعر الوحدة'),
          _HeaderCell('الإجمالي'),
        ],
      ),
    );
  }
}

// =====================================================
// Row
// =====================================================

class _InvoiceTableRow
    extends StatelessWidget {
  final InvoiceTableItem item;

  const _InvoiceTableRow({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final priceMissing =
        item.priceMissing;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: priceMissing
            ? const Color(0xFFFFF7E6)
            : AppColors.white,
        border: Border(
          top: BorderSide(
            color: priceMissing
                ? const Color(0xFFE69500)
                    .withOpacity(.40)
                : AppColors.littleBlue
                    .withOpacity(.40),
          ),
        ),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
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
                    item.compensationType,
                    textAlign:
                        TextAlign.center,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style: AppTextStyles
                        .ibmRegular12DarkStyle
                        .copyWith(
                      color: priceMissing
                          ? const Color(
                              0xFFE69500,
                            )
                          : AppColors.darkBlue,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          _BodyCell(
            item.toothNumbers,
          ),

          _BodyCell(
            '${item.quantity}',
          ),

          _BodyCell(
            priceMissing
                ? 'غير محدد'
                : _formatPrice(
                    item.unitPrice,
                  ),
            color: priceMissing
                ? const Color(0xFFE69500)
                : AppColors.darkBlue,
          ),

          _BodyCell(
            priceMissing
                ? '-'
                : _formatPrice(
                    item.lineTotal,
                  ),
            color: priceMissing
                ? const Color(0xFFE69500)
                : AppColors.darkBlue,
          ),
        ],
      ),
    );
  }
}

// =====================================================
// Total
// =====================================================

class _InvoiceTotalRow
    extends StatelessWidget {
  final String title;
  final double total;

  final bool highlighted;

  const _InvoiceTotalRow({
    required this.title,
    required this.total,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: highlighted
            ? AppColors.littleBlue
                .withOpacity(.22)
            : AppColors.littleBlue
                .withOpacity(.08),
        border: Border(
          top: BorderSide(
            color: AppColors.littleBlue
                .withOpacity(.6),
          ),
        ),
      ),
      child: Row(
        textDirection:
            TextDirection.rtl,
        children: [
          Text(
            title,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color:
                  AppColors.darkBlue,
              fontWeight:
                  FontWeight.w800,
            ),
          ),

          const Spacer(),

          Text(
            _formatPrice(total),
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: highlighted
                  ? AppColors.primaryBlue
                  : AppColors.darkBlue,
              fontWeight:
                  FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// Cells
// =====================================================

class _HeaderCell
    extends StatelessWidget {
  final String text;

  const _HeaderCell(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles
            .ibmRegular12DarkStyle
            .copyWith(
          color: AppColors.darkBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _BodyCell
    extends StatelessWidget {
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
        style: AppTextStyles
            .ibmRegular12DarkStyle
            .copyWith(
          color:
              color ?? AppColors.darkBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// =====================================================
// Price formatter
// =====================================================

String _formatPrice(
  double price,
) {
  if (price == price.roundToDouble()) {
    return price.toInt().toString();
  }

  return price.toStringAsFixed(2);
}