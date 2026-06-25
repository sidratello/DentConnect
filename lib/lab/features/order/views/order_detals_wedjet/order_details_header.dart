


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_header.dart';
import 'package:template/lab/features/order/controller/order_details_controller.dart';

class OrderDetailsHeaderWidget extends StatelessWidget {
  const OrderDetailsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderDetailsController>();

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 55.h, 20.w, 30.h),
      child: AuthHeader(
        title: 'تفاصيل الطلب',
        onBack: controller.goBack,
      ),
    );
  }
}