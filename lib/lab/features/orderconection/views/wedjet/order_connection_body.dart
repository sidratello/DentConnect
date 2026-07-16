import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/widgets/CustomEmptyState.dart';
import 'package:template/lab/features/homepage/controller/homecontroller.dart';
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
  final isSearching = controller.searchQuery.value.isNotEmpty;

  return CustomEmptyState(
    title: isSearching
        ? 'لا توجد نتائج بحث'
        : 'لا توجد طلبات اتصال',
    subtitle: isSearching
        ? 'لم يتم العثور على طبيب أو عنوان مطابق للبحث.'
        : 'عند وصول طلبات اتصال جديدة من الأطباء ستظهر هنا.',
    mainAxisAlignment: MainAxisAlignment.start,
  );
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
  onAccept: ()  async{
      await controller.acceptRequest(controller.requests[index].id);
    if (Get.isRegistered<LabHomeController>()) {
      Get.find<LabHomeController>().getConnectionRequestsCount();
    }
  },
    onReject: ()  async{
    await controller.rejectRequest(
      controller.requests[index].id,
    );
      if (Get.isRegistered<LabHomeController>()) {
      Get.find<LabHomeController>().getConnectionRequestsCount();
    }
  },
)
          );
        },
      );
    });
  }
}