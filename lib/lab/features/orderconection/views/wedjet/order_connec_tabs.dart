import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/orderconection/controller/connected_doctors_controller.dart';
import 'package:template/lab/features/orderconection/controller/order_connection_controller.dart';

class OrderConnectionTabs extends StatelessWidget {
  const OrderConnectionTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderConnectionController>();
final connectedController =
    Get.find<ConnectedDoctorsController>();
    return Obx(() {
      return Container(
        height: 52,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        decoration: BoxDecoration(
          color: AppColors.littleBlue.withOpacity(.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: _ConnectionTabItem(
                title: 'الأطباء المتصلون',
                count: connectedController.allConnectedDoctors.length, // استبدله لاحقاً بعدد الأطباء المتصلين
                selected: controller.selectedTab.value ==
                    OrderConnectionTab.connectedDoctors,
                onTap: () {
                  controller.changeTab(
                    OrderConnectionTab.connectedDoctors,
                  );
                },
              ),
            ),
            Expanded(
              child: _ConnectionTabItem(
                title: 'طلبات الاتصال',
                count: controller.allRequests.length,
                selected: controller.selectedTab.value ==
                    OrderConnectionTab.connectionRequests,
                onTap: () {
                  controller.changeTab(
                    OrderConnectionTab.connectionRequests,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _ConnectionTabItem extends StatelessWidget {
  final String title;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  const _ConnectionTabItem({
    required this.title,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              bottom: BorderSide(
                color: selected
                    ? AppColors.primaryBlue
                    : Colors.transparent,
                width: 2.5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              '$title ($count)',
              textAlign: TextAlign.center,
              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                color: selected
                    ? AppColors.primaryBlue
                    : AppColors.normalText,
                fontWeight: selected
                    ? FontWeight.w800
                    : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}