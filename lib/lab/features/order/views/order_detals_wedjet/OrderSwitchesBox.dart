



import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_chexk_box.dart';

class OrderSwitchesBox extends StatelessWidget {
  final LabOrderModel order;

  const OrderSwitchesBox({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SwitchRow(
            title: 'مؤقتة',
            value: order.isTemporary,
            readOnly: true,
                 activeTrackColor: AppColors.darkBlue,
          ),
          SwitchRow(
            title: 'يوجد اكسسوارات',
            value: order.hasAccessories,
            readOnly: true,
                 activeTrackColor: AppColors.darkBlue,
          ),
          SwitchRow(
            title: 'مستعجلة',
            value: order.isUrgent,
            readOnly: true,
              activeTrackColor: AppColors.darkBlue,
          ),
        ],
      ),
    );
  }
}