import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';


import 'order_connection_card.dart';



class OrderConnectionBodyWidget extends StatelessWidget {
  const OrderConnectionBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderConnectionController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.requests.isEmpty) {
        return const Center(child: Text('لا يوجد طلبات اتصال'));
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: controller.requests.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 300 + (index * 80)),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 25 * (1 - value)),
                  child: child,
                ),
              );
            },
            child:OrderConnectionCard(
  item: controller.requests[index],
  onAccept: () {
    controller.acceptRequest(controller.requests[index].id);
  },
    onReject: () {
    controller.rejectRequest(
      controller.requests[index].id,
    );
  },
)
          );
        },
      );
    });
  }
}