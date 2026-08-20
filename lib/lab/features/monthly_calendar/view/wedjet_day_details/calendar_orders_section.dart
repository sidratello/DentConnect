import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/case_orders/views/widget/case_orders_card.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class CalendarOrdersSection
    extends StatelessWidget {
  final List<LabOrderModel> orders;
  final ValueChanged<LabOrderModel>
      onOrderTap;
  const CalendarOrdersSection({
    super.key,
    required this.orders,
       required this.onOrderTap,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch,
      children: [
        Text(
          'طلبات الأطباء (${orders.length})',
          textAlign: TextAlign.right,
          style: AppTextStyles
              .ibmMedium18NeutralStyle
              .copyWith(
            color: AppColors.darkBlue,
            fontSize: 16,
            fontWeight:
                FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        ...orders.map(
          (order) {
            return CaseOrdersCard(
              order: order,
              showPaidStatus: false,
              statusWidget:
                  CaseOrderIconText(
                isChip: true,
                expandText: false,
                text:
                    AppHelper.getArabicTitle(
                  order.status,
                ),
                icon:
                    AppHelper.getIcon(
                  order.status,
                ),
                iconColor:
                    AppHelper.getColor(
                  order.status,
                ),
                textColor:
                    AppHelper.getColor(
                  order.status,
                ),
                background:
                    AppHelper.getLightColor(
                  order.status,
                ),
              ),
           onTap: () {
                onOrderTap(order);
              },
            );
          },
        ),
      ],
    );
  }
}