import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/filter_item.dart';

import '../../controller/lab_complaints_controller.dart';

class LabComplaintsTabs
    extends GetView<
        LabComplaintsController> {
  const LabComplaintsTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 48,
        padding:
            const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(15),
        ),
        child: Row(
          textDirection:
              TextDirection.rtl,
          children: [
            Expanded(
              child: FilterItem(
                title:
                    'بانتظار الرد (${controller.unansweredCount})',
                selected:
                    controller
                            .selectedTab
                            .value ==
                        ComplaintsTab
                            .unanswered,
                onTap: () {
                  controller.selectTab(
                    ComplaintsTab
                        .unanswered,
                  );
                },
              ),
            ),

            const SizedBox(
              width: 6,
            ),

            Expanded(
              child: FilterItem(
                title:
                    'تم الرد (${controller.answeredCount})',
                selected:
                    controller
                            .selectedTab
                            .value ==
                        ComplaintsTab
                            .answered,
                onTap: () {
                  controller.selectTab(
                    ComplaintsTab
                        .answered,
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