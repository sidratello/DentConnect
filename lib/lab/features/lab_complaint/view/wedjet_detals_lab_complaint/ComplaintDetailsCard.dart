import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

import '../../model/lab_complaint_model.dart';

class ComplaintDetailsCard
    extends StatelessWidget {
  final LabComplaintModel complaint;

  const ComplaintDetailsCard({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.6),
        ),
      ),
      child: Directionality(
        textDirection:
            TextDirection.rtl,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              complaint.title,
              style: AppTextStyles
                  .ibmMedium18NeutralStyle
                  .copyWith(
                color:
                    AppColors.darkBlue,
                fontWeight:
                    FontWeight.w800,
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              complaint.text,
              textAlign:
                  TextAlign.right,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.normalText,
                height: 1.7,
              ),
            ),

            if (complaint.isAnswered) ...[
              const SizedBox(
                height: 16,
              ),

              Divider(
                color: AppColors
                    .littleBlue
                    .withOpacity(.5),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                'رد المخبر',
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.darkBlue,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),

              const SizedBox(
                height: 7,
              ),

              Text(
                complaint.reply!,
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
            ],
          ],
        ),
      ),
    );
  }
}