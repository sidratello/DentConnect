import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_router.dart';

import 'package:template/lab/features/homepage/controller/homecontroller.dart';
import 'package:template/lab/features/homepage/wedjet/home_banner.dart';
import 'package:template/lab/features/homepage/wedjet/home_card.dart';
import 'package:template/lab/features/homepage/wedjet/home_header.dart';
import 'package:get/get.dart';
class LabHomeView extends StatelessWidget {
  const LabHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabHomeController>();
    return SafeArea(

        child: Column(
          children: [
            const LabHomeHeader(),

            SizedBox(height: 70.h),

            const LabHomeBanner(),

            SizedBox(height: 20.h),

            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                crossAxisCount: 2,
                crossAxisSpacing: 18.w,
                mainAxisSpacing: 18.h,
                childAspectRatio: 1.55,
                children:  [
                   Obx(() {
    return HomeActionCard(
      title: 'طلبات الاتصال',
      icon: Icons.connect_without_contact,
      count: controller.connectionRequestsCount.value,
onTap: () {
  Get.toNamed(AppRouter.orderconection);
    controller.getConnectionRequestsCount();
},
    );
  }),
Obx(() {
  return HomeActionCard(
    title: 'الطلبات الجديدة',
    icon: Icons.calendar_month_outlined,
    count: controller.pendingOrdersCount.value,
    onTap: () {
      Get.toNamed(AppRouter.orders);
      controller.getPendingOrdersCount();
    },
  );
}),
                  HomeActionCard(
                    title: 'تقويم الطلبات',
                    icon: Icons.calendar_today_outlined,
                  ),
                  HomeActionCard(
                    title: 'مواعيد المسح الضوئي',
                    icon: Icons.medical_services_outlined,
                  ),
                  HomeActionCard(
                    title: 'المدونة',
                    icon: Icons.edit_note_outlined,
                  ),
                 HomeActionCard(
  title: 'إدارة الحالات',
  icon: Icons.folder_copy_outlined,
  onTap: () {
    Get.toNamed(AppRouter.caseStatus);
  },
),
                ],
              ),
            ),
          ],
        ),
    
    );
  }
}