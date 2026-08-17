import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/homepage/wedjet/lab_menu_item_widget.dart';

enum LabMenuItem {
  ads,
  complaints,
  invoices,
  subscriptions,
}

class LabHomeMenu extends StatelessWidget {
  const LabHomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<LabMenuItem>(
      tooltip: '',
      color: AppColors.white,
      elevation: 8,

      offset: Offset(
        0,
        55.h,
      ),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.r),
      ),

      onSelected: _onSelected,

      itemBuilder: (context) => [
        LabMenuItemWidget<LabMenuItem>(
          value: LabMenuItem.ads,
          icon: Icons.campaign_outlined,
          title: 'الإعلانات',
          subtitle: 'العروض والإعلانات',
        ),

        const PopupMenuDivider(),

        LabMenuItemWidget<LabMenuItem>(
          value: LabMenuItem.complaints,
          icon:
              Icons.help_outline_rounded,
          title: 'الشكاوى',
          subtitle:
              'تقديم ومتابعة الشكاوى',
        ),

        const PopupMenuDivider(),

        LabMenuItemWidget<LabMenuItem>(
          value: LabMenuItem.invoices,
          icon:
              Icons.receipt_long_outlined,
          title: 'الفواتير',
          subtitle:
              'عرض وإدارة الفواتير',
        ),

        const PopupMenuDivider(),

        LabMenuItemWidget<LabMenuItem>(
          value:
              LabMenuItem.subscriptions,
          icon:
              Icons.workspace_premium_outlined,
          title: 'الاشتراكات',
          subtitle:
              'خطط الاشتراك والفترة',
        ),
      ],

      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue
                  .withOpacity(.12),
              blurRadius: 8,
              offset:
                  const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.menu_rounded,
              color: AppColors.darkBlue,
              size: 27.sp,
            ),

            Positioned(
              top: 10.h,
              right: 10.w,
              child: Container(
                width: 7.w,
                height: 7.w,
                decoration:
                    const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _onSelected(
    LabMenuItem item,
  ) {
    switch (item) {
case LabMenuItem.ads:
  Get.toNamed(
    AppRouter.labAdFeed,
  );
  break;

case LabMenuItem.complaints:
  Get.toNamed(
    AppRouter.labComplaints,
  );
  break;

      case LabMenuItem.invoices:
        Get.toNamed(
          AppRouter.labInvoices,
        );
        break;

      case LabMenuItem.subscriptions:
   Get.toNamed(
  AppRouter.labSubscription,
);
        break;
    }
  }
}