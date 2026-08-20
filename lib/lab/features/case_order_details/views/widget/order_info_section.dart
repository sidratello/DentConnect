import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_info_item.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';
import '../../model/order_quote_model.dart';

class OrderInfoSection extends StatelessWidget {
  final LabOrderModel order;
  final OrderQuoteModel quote;
  final String Function(double? price) formatPrice;

  const OrderInfoSection({
    super.key,
    required this.order,
    required this.quote,
    required this.formatPrice,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'معلومات الطلب',
            icon: Icons.info_outline_rounded,
          ),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: .85,
            children: [
              DetailsInfoItem(
                icon: Icons.hourglass_empty_rounded,
                title: 'مؤقتة',
                value: order.isTemporary ? 'نعم' : 'لا',
              ),
              DetailsInfoItem(
                icon: Icons.palette_outlined,
                title: 'درجة اللون',
                value: order.shade,
              ),
              DetailsInfoItem(
                icon: Icons.approval_rounded,
                title: 'نوع الطبعة',
                value: AppHelper.arabicImpressionType(order.impressionType),
              ),
              DetailsInfoItem(
                icon: Icons.medical_information_outlined,
                title: 'مرحلة الطبعة',
                value: AppHelper.arabicImpressionStage(order.impressionStage),
              ),
              DetailsInfoItem(
                icon: Icons.inventory_2_outlined,
                title: 'إكسسوارات',
                value: order.hasAccessories ? 'يوجد' : 'لا يوجد',
              ),
              DetailsInfoItem(
                icon: Icons.payments_outlined,
                title: 'الدفع',
                value: order.isPaid ? 'مدفوع' : 'غير مدفوع',
                valueColor: order.isPaid ? AppColors.green : AppColors.red,
              ),
              DetailsInfoItem(
                icon: Icons.attach_money_rounded,
                title: 'السعر التقديري',
                value: formatPrice(quote.estimatedTotal),
              ),
              DetailsInfoItem(
                icon: Icons.price_change_outlined,
                title: 'السعر النهائي',
                value: formatPrice(quote.finalPrice),
              ),
            ],
          ),
        ],
      ),
    );
  }
}