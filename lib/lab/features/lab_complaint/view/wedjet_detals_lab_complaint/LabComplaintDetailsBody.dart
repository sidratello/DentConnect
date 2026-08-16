import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';

import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/lab_complaint/controller/LabComplaintDetailsController.dart';
import 'package:template/lab/features/lab_complaint/view/ComplaintReplyDialog.dart';
import 'package:template/lab/features/lab_complaint/view/wedjet_detals_lab_complaint/ComplaintDentistCard.dart';
import 'package:template/lab/features/lab_complaint/view/wedjet_detals_lab_complaint/ComplaintDetailsCard.dart';



class LabComplaintDetailsBody
    extends GetView<
        LabComplaintDetailsController> {
  const LabComplaintDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        30,
      ),
      children: [
        AppPageHeader(
          title:
              'تفاصيل الشكوى',
          subtitle:
              'تفاصيل الشكوى والطبيب المرسل',
          icon: Icons
              .report_problem_outlined,
          onBack:
              controller.goBack,
        ),

        const SizedBox(
          height: 10,
        ),

   Obx(
  () =>
      ComplaintDetailsCard(
    complaint:
        controller
            .complaint.value,
  ),
),

        const SizedBox(
          height: 15,
        ),

        Obx(
          () {
            if (controller
                .isLoadingDentist
                .value) {
              return const Padding(
                padding:
                    EdgeInsets.all(
                  30,
                ),
                child:
                    AppLoadingIndicator(
                  size: 30,
                ),
              );
            }

            final dentist =
                controller
                    .dentist.value;

            if (dentist == null) {
              return const SizedBox
                  .shrink();
            }

            return ComplaintDentistCard(
              dentist:
                  dentist,
            );
 },
        ),
         const SizedBox(
          height: 18,
        ),

        Obx(
          () {
            final complaint =
                controller
                    .complaint.value;

            if (complaint.isAnswered) {
              return const SizedBox
                  .shrink();
            }

            return AppButton(
              title:
                  'الرد على الشكوى',
              onTap: () {
                ComplaintReplyDialog.show(
                  context: context,
                  controller:
                      controller,
                );
              },
              height: 48,
              borderRadius: 12,
              icon: const Icon(
                Icons.reply_rounded,
                color:
                    AppColors.white,
                size: 20,
              ),
            );
          },
        ),
      ],
    );
  }
}
            
          
        
    