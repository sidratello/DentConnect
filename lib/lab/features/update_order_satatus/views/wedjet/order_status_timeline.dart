import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/update_order_satatus/controller/update_order_status_controller.dart';




class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateOrderStatusController>();

    final steps = [
      'Accepted',
      'InDesign',
      'InProduction',
      'InColoring',
      'Ready',
      'Delivered',
    ];

    int currentIndex =
        steps.indexWhere((status) => status == controller.order.status);

    if (currentIndex == -1) currentIndex = 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
   decoration: AppHelper.whiteCardDecoration(
  hasBorder: false,
),
      height: 145,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: steps.length,
          separatorBuilder: (_, index) {
            final completed = index < currentIndex;

            return Container(
              width: 38,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 23),
              child: Container(
                height: 3,
                color: completed
                    ? AppColors.primaryBlue
                    : Colors.grey.shade300,
              ),
            );
          },
          itemBuilder: (context, index) {
            final status = steps[index];

            final completed = index < currentIndex;
            final current = index == currentIndex;

            return SizedBox(
              width: 72,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: current
                        ? AppColors.primaryBlue
                        : completed
                            ? AppColors.green
                            : Colors.grey.shade200,
                    child: Icon(
                      AppHelper.getIcon(status),
                      color: current || completed
                          ? AppColors.white
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppHelper.getArabicTitle(status),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: current
                          ? AppColors.primaryBlue
                          : AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}