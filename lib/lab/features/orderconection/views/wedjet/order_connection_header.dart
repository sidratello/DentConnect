import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:template/core/widgets/app_header.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';

class OrderConnectionHeaderWidget extends StatelessWidget {
  const OrderConnectionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.find<OrderConnectionController>();
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 55.h, 20.w, 30.h),
      child: 
                AuthHeader(
         title:    'طلبات الاتصال',
          onBack: controller.goBack,
        ),
      
    );
  }
}