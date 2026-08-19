import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/static.dart';
import '../../controller/case_controller.dart';
import '../../model/case_model.dart';
import '../../model/case_status.dart';
import 'case_card_item.dart';
import 'case_empty_widget.dart';
import 'case_section_header.dart';

class CaseSection extends StatelessWidget {
  final String title;
  final CaseStatus status;

  const CaseSection({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaseController>();

    return Obx(() {
      final List<CaseItem> cases = controller.getCases(status);
      final bool expanded = controller.expandedSections[status] ?? true;
      final int visibleCount = controller.visibleCount[status] ?? 3;

      return Padding(
        padding: EdgeInsets.only(
          bottom: Static.getheight(context, 16),
        ),
        child: Column(
          children: [
            CaseSectionHeader(
              title: title,
              count: cases.length,
              expanded: expanded,
              onTap: () {
                controller.toggleSection(status);
              },
            ),
            if (expanded) ...[
              SizedBox(
                height: Static.getheight(context, 12),
              ),
              if (cases.isEmpty)
                const CaseEmptyWidget(
                  text: 'ستظهر الحالات هنا بمجرد توفر طلبات ضمن هذه المرحلة',
                )
              else
                Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: Static.getwidth(context, 24),
                      ),
                      itemCount: cases.length > visibleCount
                          ? visibleCount
                          : cases.length,
                      separatorBuilder: (_, __) => SizedBox(
                        height: Static.getheight(context, 12),
                      ),
                      itemBuilder: (context, index) {
                        return CaseCardItem(
                          item: cases[index],
                        );
                      },
                    ),
                    if (cases.length > visibleCount)
                      Padding(
                        padding: EdgeInsets.only(
                          top: Static.getheight(context, 10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.showMore(
                              status,
                              cases.length,
                            );
                          },
                          child: Text(
                            'عرض المزيد',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w500,
                              fontSize: Static.getwidth(
                                context,
                                15,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ],
        ),
      );
    });
  }
}
