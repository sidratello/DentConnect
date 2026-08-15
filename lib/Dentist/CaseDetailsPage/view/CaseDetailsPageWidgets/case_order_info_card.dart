import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/info_row.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class CaseOrderInfoCard extends StatelessWidget {
  final String sentDate;
  final String deliveryDate;
  final String price;

  const CaseOrderInfoCard({
    super.key,
    required this.sentDate,
    required this.deliveryDate,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(context, 20),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const SectionTitle(
            icon: Icons.receipt_long_rounded,
            title: 'معلومات الطلب',
          ),
          AppSpacing.height(context, 18),
          InfoRow(
            icon: Icons.calendar_month,
            title: 'تاريخ الإرسال',
            value: sentDate,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.event_available,
            title: 'تاريخ التسليم',
            value: deliveryDate,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.payments_outlined,
            title: 'السعر',
            value: price.isEmpty ? 'غير محدد' : '$price \$',
          ),
        ],
      ),
    );
  }
}
