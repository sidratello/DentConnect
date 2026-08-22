import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/filter_item.dart';

class BlogDoctorFeedTabs extends GetView<BlogFeedDoctorController> {
  const BlogDoctorFeedTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.fromLTRB(
        18,
        0,
        18,
        16,
      ),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.littleBlue.withOpacity(.20),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: FilterItem(
                title: 'منشورات الأطباء',
                fontSize: 14,
                selected:
                    controller.selectedTab.value == BlogDoctorFeedTab.doctors,
                onTap: () {
                  controller.selectTab(
                    BlogDoctorFeedTab.doctors,
                  );
                },
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: FilterItem(
                title: 'منشورات المخابر',
                fontSize: 14,
                selected:
                    controller.selectedTab.value == BlogDoctorFeedTab.labs,
                onTap: () {
                  controller.selectTab(
                    BlogDoctorFeedTab.labs,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
