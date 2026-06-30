


import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';

import 'package:template/lab/features/order/controller/order_details_controller.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/DoctorInfo_container.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/FilesSection.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/ImagesSection.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/OrderInfoBox.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/OrderSwitchesBox.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/orderinfocard.dart';


class OrderDetailsBodyWidget extends StatelessWidget {
  const OrderDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<OrderDetailsController>();
    final order = controller.order;
final date = order.formattedDeliveryDate;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.darkBlue,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  DoctorInfo(order: order),
                  const SizedBox(height: 16),
                  OrderInfoBox(order: order),
                  const SizedBox(height: 12),


                  Row(
  children: [

    const SizedBox(width: 10),
    OrderDetailInfoCard(
      title: 'نوع الطبعة',
      value: AppHelper.arabicImpressionType(order.impressionType),
      imagePath: 'assets/images/teeth (1).png',
    ),
    const SizedBox(width: 10),
    OrderDetailInfoCard(
      title: 'مرحلة الطبعة',
      value: AppHelper.arabicImpressionStage(order.impressionStage),
      imagePath: 'assets/images/dentist.png',
    ),
  ],
),
       SizedBox(height: 12,),           
              
       OrderSwitchesBox(order: order),

          SizedBox(height: 12,), 
            Row(
                        textDirection: ui.TextDirection.ltr,
                        children: [
                          Text(
                            date,
                            style: AppTextStyles.ibmMedium18NeutralStyle,
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.grey,
                          ),
                          const Spacer(),
                          Text(
                            'تاريخ التسليم:',
                            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                              color: AppColors.textDark,
                            ),
                          ),
                          
              
                        ],
                      ),
                      
              InfoRow(
  label: 'ملاحظات الطبيب:',
  value: order.notes.isEmpty ? '--' : order.notes,
  multiline: true,
),
               
                  const SizedBox(height: 12),
                  ImagesSection(order: order),
                     const SizedBox(height: 12),
                  FilesSection(order: order),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}