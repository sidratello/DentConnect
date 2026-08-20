
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order_invoice/model/InvoiceItemModel.dart';
import 'package:template/lab/features/order_invoice/model/invoice_table_item.dart';
import 'package:template/lab/features/order_invoice/views/wedjet/invoice_items_table.dart';
import 'package:template/core/app_helper.dart';
class OrderInvoiceCard
    extends StatelessWidget {
  final OrderInvoiceModel invoice;

  const OrderInvoiceCard({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.55),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.05),
            blurRadius: 12,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Directionality(
        textDirection:
            ui.TextDirection.rtl,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration:
                      BoxDecoration(
                    color: AppColors
                        .littleBlue
                        .withOpacity(.35),
                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Icon(
                    Icons
                        .receipt_long_outlined,
                    color:
                        AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        invoice.caseOrderTitle,
                        style: AppTextStyles
                            .ibmRegular14NeutralStyle
                            .copyWith(
                          color:
                              AppColors.darkBlue,
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),

                      const SizedBox(
                        height: 3,
                      ),

                      Text(
                        'الطبيب: ${invoice.dentistName}',
                        style: AppTextStyles
                            .ibmRegular12DarkStyle
                            .copyWith(
                          color: AppColors
                              .normalText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons
                      .check_circle_outline_rounded,
                  size: 18,
                  color:
                      AppColors.primaryBlue,
                ),

                const SizedBox(width: 6),

                Text(
                  'تم الدفع ${_formatDate(invoice.paidAt)}',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            InvoiceTable(
              items: invoice.items.map(
                (item) {
                  return InvoiceTableItem(
                   compensationType:
    AppHelper.arabicCompensationType(
  item.compensationType,
),
                    toothNumbers:
                        item.toothNumbers,
                    quantity:
                        item.teethCount,
                    unitPrice:
                        item.unitPrice,
                    lineTotal:
                        item.lineTotal,

                    // السعر غير محدد فقط
                    // عندما تكون القيمتان 0.
                    priceMissing:
                        item.unitPrice == 0 &&
                        item.lineTotal == 0,
                  );
                },
              ).toList(),

              total:
                  invoice.totalAmount,

                    finalPrice:
      invoice.finalPrice,

  finalPriceTitle:
      'السعر النهائي',
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return 'غير محدد';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }
}