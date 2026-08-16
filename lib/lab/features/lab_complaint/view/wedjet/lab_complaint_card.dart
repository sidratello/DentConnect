import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import '../../model/lab_complaint_model.dart';

class LabComplaintCard
    extends StatelessWidget {
  final LabComplaintModel complaint;

  final VoidCallback onDetails;

  const LabComplaintCard({
    super.key,
    required this.complaint,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.55),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.045),
            blurRadius: 13,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Directionality(
        textDirection:
            ui.TextDirection.rtl,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration:
                      BoxDecoration(
                    color: AppColors
                        .littleBlue
                        .withOpacity(.35),
                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Icon(
                    complaint.isAnswered
                        ? Icons
                            .mark_chat_read_outlined
                        : Icons
                            .report_problem_outlined,
                    color:
                        AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        complaint.title,
                        style: AppTextStyles
                            .ibmRegular14NeutralStyle
                            .copyWith(
                          color:
                              AppColors.darkBlue,
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),

                      const SizedBox(
                        height: 3,
                      ),

                      Text(
                        complaint.dentistName,
                        style: AppTextStyles
                            .ibmRegular12DarkStyle
                            .copyWith(
                          color: AppColors
                              .normalText,
                        ),
                      ),
                    ],
                  ),
                ),

            CaseOrderIconText(
  icon: complaint.isAnswered
      ? Icons
          .check_circle_outline_rounded
      : Icons
          .schedule_rounded,

  text: complaint.isAnswered
      ? 'تم الرد'
      : 'بانتظار الرد',

  iconColor:
      complaint.isAnswered
          ? AppColors.green
          : const Color(
              0xFFE69500,
            ),

  textColor:
      complaint.isAnswered
          ? AppColors.green
          : const Color(
              0xFFE69500,
            ),

  background:
      complaint.isAnswered
          ? AppColors.green
              .withOpacity(.10)
          : const Color(
              0xFFE69500,
            ).withOpacity(.10),

  isChip: true,

  expandText: false,
),
              ],
            ),

            const SizedBox(
              height: 13,
            ),

            Text(
              complaint.text,
              maxLines: 3,
              overflow:
                  TextOverflow.ellipsis,
              textAlign:
                  TextAlign.right,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.normalText,
                height: 1.6,
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                const Icon(
                  Icons
                      .calendar_month_outlined,
                  color:
                      AppColors.normalText,
                  size: 17,
                ),

                const SizedBox(
                  width: 5,
                ),

                Text(
                  _formatDate(
                    complaint
                        .createdAtUtc,
                  ),
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color: AppColors
                        .normalText,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 14,
            ),

            AppButton(
              title:
                  'عرض التفاصيل',
              onTap:
                  onDetails,
              type:
                  AppButtonType.outlined,
              height: 46,
              borderRadius: 12,
              borderColor:
                  AppColors.primary200,
              textColor:
                  AppColors.darkBlue,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return '';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }
}
