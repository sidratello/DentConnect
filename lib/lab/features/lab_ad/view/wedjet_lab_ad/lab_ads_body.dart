import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/app_note_card.dart';

import '../../controller/lab_ads_controller.dart';
import 'lab_ads_header.dart';
import 'lab_ads_list.dart';
import 'lab_ads_tabs.dart';

class LabAdsBody
    extends GetView<LabAdsController> {
  const LabAdsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabAdsHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              4,
              20,
              0,
            ),
            child: Column(
              children: [
                const LabAdsTabs(),
                const SizedBox(height: 16),
                Obx(
                  () {
                    if (controller.isPendingTab) {
                      return const AppNoteCard(
                        messages: [
                          'تم اعتماد إعلاناتك من قبل الإدارة.',
                          'يمكنك دفع الرسوم لتفعيل الإعلان ونشره.',
                        ],
                      );
                    }

                    return const AppNoteCard(
                      icon: Icons
                          .check_circle_outline_rounded,
                      color: AppColors.green,
                      messages: [
                        'هذه الإعلانات فعالة حالياً.',
                        'سيتم إيقاف الإعلان تلقائياً عند انتهاء صلاحيته.',
                      ],
                    );
                  },
                ),
                const SizedBox(height: 14),
                const Expanded(
                  child: LabAdsList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}