import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/CustomEmptyState.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/case_orders/views/widget/case_orders_card.dart';
import 'package:template/lab/features/orderconection/views/doctor_orders_wedjet/doctor_orders_header.dart';

import '../../controller/doctor_orders_controller.dart';

class DoctorOrdersBody extends StatelessWidget {
  const DoctorOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorOrdersController>();

    return Obx(() {
      if (controller.isLoading.value) {
    return const AppLoadingIndicator();
      }
     final emptyStateHeight =
          MediaQuery.sizeOf(context).height * 0.62;


      return  RefreshIndicator(
  onRefresh: controller.getDoctorOrders,
  child: CustomScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    slivers: [
      const SliverToBoxAdapter(
        child: DoctorOrdersHeader(),
      ),

      const SliverToBoxAdapter(
        child: SizedBox(height: 18),
      ),


            if (controller.orders.isEmpty)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: emptyStateHeight,
                  child: const CustomEmptyState(
                    title: 'لا توجد طلبات',
                    subtitle:
                        'لا توجد طلبات مرتبطة بهذا الطبيب حالياً.',
                  ),
                ),
              )
            else


      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final order = controller.orders[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: CaseOrdersCard(
                  order: order,
                  showPaidStatus: false,
                  statusWidget: CaseOrderIconText(
                    isChip: true,
                    expandText: false,
                    text: AppHelper.getArabicTitle(order.status),
                    icon: AppHelper.getIcon(order.status),
                    iconColor: AppHelper.getColor(order.status),
                    textColor: AppHelper.getColor(order.status),
                    background: AppHelper.getLightColor(order.status),
                  ),
                 onTap: () {
  if (order.status == 'Pennding') {
    Get.toNamed(
      AppRouter.orderDetails,
      arguments: order,
    );
  } else {
    Get.toNamed(
      AppRouter.caseOrderDetails,
      arguments: order,
    );
  }
},
                ),
              );
            },
            childCount: controller.orders.length,
          ),
        ),
      ),
    ],
  ),
);
    });
  }
}