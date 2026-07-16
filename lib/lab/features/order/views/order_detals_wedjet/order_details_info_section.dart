import 'package:flutter/material.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_info_item.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class OrderDetailsInfoSection extends StatelessWidget {
  final LabOrderModel order;

  const OrderDetailsInfoSection({
    super.key,
    required this.order,
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
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.15,
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
            ],
          ),
        ],
      ),
    );
  }
}