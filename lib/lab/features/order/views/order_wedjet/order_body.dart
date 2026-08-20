import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/CustomEmptyState.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/case_orders/views/widget/case_orders_card.dart';
import 'package:template/lab/features/homepage/controller/homecontroller.dart';
import 'package:template/lab/features/order/views/order_wedjet/order_header.dart';
import 'package:template/lab/features/order/views/order_wedjet/order_tabs.dart';
import '../../controller/order_controller.dart';

class LabOrderBodyWidget extends StatelessWidget {
  const LabOrderBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabOrderController>();

    return Obx(() {
      if (controller.isLoading.value) {
    return const AppLoadingIndicator();
      }

      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: LabOrderHeaderWidget(),
          ),

          const SliverToBoxAdapter(
            child: LabOrderTabsWidget(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

controller.orders.isEmpty
    ? SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.55,
          child: Center(
            child: CustomEmptyState(
              title: _emptyTitle(
                controller.selectedFilter.value,
              ),
              subtitle: _emptySubtitle(
                controller.selectedFilter.value,
              ),
              mainAxisAlignment: MainAxisAlignment.start,
              animationSize: 170,
            ),
          ),
        ),
      )
    : SliverPadding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final order = controller.orders[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: GestureDetector(
                  onTap: () async {
                    final result = await Get.toNamed(
                      AppRouter.orderDetails,
                      arguments: order,
                    );

                    if (result is Map && result['success'] == true) {
                      await controller.getOrders();

                      if (Get.isRegistered<LabHomeController>()) {
                        Get.find<LabHomeController>()
                            .getPendingOrdersCount();
                      }

                      Get.snackbar(
                        'تم',
                        result['message'] ?? 'تم تحديث الطلب',
                      );
                    }
                  },
                  child: CaseOrdersCard(
                    order: order,
                    showPaidStatus: false,
                    bottomWidget: CaseOrderIconText(
                      icon: Icons.location_on_outlined,
                      text: order.dentistClinicAddress,
                      iconColor: AppColors.primaryBlue,
                      textColor: AppColors.darkBlue,
                    ),
                  ),
                ),
              );
            },
            childCount: controller.orders.length,
          ),
        ),
      ),
        ],
      );
    });
  }

String _emptyTitle(OrderFilter filter) {
  switch (filter) {
    case OrderFilter.all:
      return 'لا توجد طلبات';

    case OrderFilter.urgent:
      return 'لا توجد طلبات مستعجلة';

    case OrderFilter.notUrgent:
      return 'لا توجد طلبات غير مستعجلة';
  }
}

String _emptySubtitle(OrderFilter filter) {
  switch (filter) {
    case OrderFilter.all:
      return 'ستظهر الطلبات الجديدة هنا عند وصولها.';

    case OrderFilter.urgent:
      return 'لا توجد حالياً أي طلبات مستعجلة تحتاج إلى المعالجة.';

    case OrderFilter.notUrgent:
      return 'لا توجد حالياً أي طلبات غير مستعجلة.';
  }
}





}