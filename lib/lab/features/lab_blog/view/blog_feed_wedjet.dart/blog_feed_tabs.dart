import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/filter_item.dart';
import 'package:template/lab/features/lab_blog/controller/blog_feed_controller.dart';


class BlogFeedTabs
    extends GetView<BlogFeedController> {
  const BlogFeedTabs({
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
        color: AppColors.littleBlue
            .withOpacity(.20),
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: FilterItem(
                title: 'منشورات الأطباء',
                   fontSize: 14,
                selected:
                    controller
                            .selectedTab
                            .value ==
                        BlogFeedTab.doctors,
                onTap: () {
                  controller.selectTab(
                    BlogFeedTab.doctors,
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
                    controller
                            .selectedTab
                            .value ==
                        BlogFeedTab.labs,
                onTap: () {
                  controller.selectTab(
                    BlogFeedTab.labs,
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
