import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/CustomEmptyState.dart';

import 'package:template/lab/features/case_orders/views/widget/SmallActionButton.dart';
import 'package:template/lab/features/case_orders/views/widget/case_orders_card.dart';

import '../../controller/case_orders_controller.dart';

import 'case_orders_header.dart';


class CaseOrdersBody extends StatelessWidget {
  const CaseOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseOrdersController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

  if (controller.orders.isEmpty) {
        return RefreshIndicator(
          onRefresh: controller.getOrders,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 40),
            children: [
              CaseOrdersHeader(
                statusTitle: controller.statusTitle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: CustomEmptyState(
                  title: 'لا توجد طلبات في هذه الحالة',
                  subtitle: 'ستظهر الطلبات هنا عند إضافتها',

                ),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: controller.getOrders,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 40),
          itemCount: controller.orders.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CaseOrdersHeader(
                statusTitle: controller.statusTitle,
              );
            }

            if (index == 1) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SmallActionButton(
                      icon: Icons.swap_vert_rounded,
                      title: 'الأقرب موعداً',
                      onTap: () {},
                    ),
                    const Spacer(),
                    SmallActionButton(
                      title: 'تصفية',
                      icon: Icons.filter_list_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              );
            }

            final order = controller.orders[index - 2];

            return CaseOrdersCard(
              order: order,
              showPaidStatus: controller.showPaidStatus,
                onTap: () {
   Get.toNamed(
  AppRouter.caseOrderDetails,
  arguments: order,
);
  },
            );
          },
        ),
      );
    });
  }
}