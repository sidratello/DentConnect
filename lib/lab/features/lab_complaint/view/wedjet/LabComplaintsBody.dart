import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';

import '../../controller/lab_complaints_controller.dart';
import 'lab_complaint_card.dart';
import 'lab_complaints_header.dart';
import 'lab_complaints_tabs.dart';

class LabComplaintsBody
    extends GetView<
        LabComplaintsController> {
  const LabComplaintsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabComplaintsHeader(),

        const Padding(
          padding:
              EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child:
              LabComplaintsTabs(),
        ),

        const SizedBox(
          height: 14,
        ),

        Expanded(
          child: Obx(
            () {
              if (controller
                  .isLoading.value) {
                return const AppLoadingIndicator(
                  size: 32,
                );
              }

              final complaints =
                  controller
                      .currentComplaints;

              if (complaints.isEmpty) {
                return RefreshIndicator(
                  onRefresh:
                      controller
                          .refreshComplaints,
                  child: ListView(
                    physics:
                        const AlwaysScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                    children: [
                      EmptyStateCard(
                        title: controller
                                    .selectedTab
                                    .value ==
                                ComplaintsTab
                                    .unanswered
                            ? 'لا توجد شكاوى بانتظار الرد'
                            : 'لا توجد شكاوى تم الرد عليها',
                        subtitle: controller
                                    .selectedTab
                                    .value ==
                                ComplaintsTab
                                    .unanswered
                            ? 'الشكاوى الجديدة التي تحتاج إلى رد ستظهر هنا.'
                            : 'الشكاوى التي تم الرد عليها ستظهر هنا.',
                        icon: Icons
                            .report_problem_outlined,
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh:
                    controller
                        .refreshComplaints,
                child:
                    ListView.separated(
                  physics:
                      const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    30,
                  ),

                  itemCount:
                      complaints.length,

                  separatorBuilder:
                      (_, __) =>
                          const SizedBox(
                    height: 12,
                  ),

                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final complaint =
                        complaints[index];

                    return LabComplaintCard(
                      complaint:
                          complaint,
                      onDetails: () {
                        controller
                            .openComplaint(
                          complaint,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}