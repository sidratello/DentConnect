import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import '../../controller/case_status_controller.dart';
import 'CaseStatusTotalCard.dart';
import 'case_status_card.dart';
import 'case_status_header.dart';

class CaseStatusBody extends StatelessWidget {
  const CaseStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseStatusController>();

    return Obx(() {
      if (controller.isLoading.value) {
      return const AppLoadingIndicator();
      }

      return RefreshIndicator(
        onRefresh: controller.getStatuses,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(22, 25, 22, 40),
          itemCount: controller.statuses.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const CaseStatusHeader();
            }

            if (index == 1) {
              return const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 14),
                child: CaseStatusTotalCard(),
              );
            }

            if (controller.statuses.isEmpty) {
              return const Center(child: Text('لا توجد حالات'));
            }

            final item = controller.statuses[index - 2];

            return CaseStatusCard(status: item);
          },
        ),
      );
    });
  }
}