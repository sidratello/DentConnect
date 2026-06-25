

import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order/model/order_model.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/TeethCompensationGrid.dart';


class OrderInfoBox extends StatelessWidget {
  final LabOrderModel order;

  const OrderInfoBox({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.90),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.darkBlue,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black54,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/557f03b1-0116-4d2a-90e8-cd363dc895c6.png',
          ),
          fit: BoxFit.contain,
          opacity: 0.45,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
             
              ),
            ),
            child: Text(
              'اسم الطلبية: ${order.title}',
              textAlign: TextAlign.right,
              style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

     Padding(
  padding: const EdgeInsets.all(12),
  child: TeethCompensationGrid(order: order),
),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'درجة اللون: ${order.shade}',
                style: AppTextStyles.ibmRegular16WhiteStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}