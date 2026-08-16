import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/input_textfield.dart';

import 'package:template/lab/features/lab_complaint/controller/LabComplaintDetailsController.dart';

class ComplaintReplyDialog
    extends StatelessWidget {
  final LabComplaintDetailsController
      controller;

  const ComplaintReplyDialog({
    super.key,
    required this.controller,
  });

  static void show({
    required BuildContext context,
    required LabComplaintDetailsController
        controller,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent,
      builder: (_) {
        return ComplaintReplyDialog(
          controller: controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context)
                .viewInsets
                .bottom,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          20,
          12,
          20,
          24,
        ),
        decoration:
            const BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.vertical(
            top:
                Radius.circular(26),
          ),
        ),
        child: Directionality(
          textDirection:
              TextDirection.rtl,
          child: Column(
            mainAxisSize:
                MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 46,
                  height: 5,
                  decoration:
                      BoxDecoration(
                    color:
                        AppColors.grey400,
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                'الرد على الشكوى',
                textAlign:
                    TextAlign.right,
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
                height: 6,
              ),

              Text(
                'اكتب الرد الذي تريد إرساله للطبيب.',
                textAlign:
                    TextAlign.right,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.normalText,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              AuthInputField(
                title:
                    'الرد',
                hintText:
                    'اكتب ردك هنا',
                controller:
                    controller
                        .replyController,
                maxLines: 5,
                fillColor:
                    AppColors.littleBlue
                        .withOpacity(.12),
                borderColor:
                    AppColors.littleBlue
                        .withOpacity(.7),
                focusedBorderColor:
                    AppColors.primaryBlue,
                validator: (value) {
                  if (value == null ||
                      value
                          .trim()
                          .isEmpty) {
                    return 'يرجى كتابة الرد';
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 18,
              ),

              Obx(
                () {
                  if (controller
                      .isReplying.value) {
                    return const SizedBox(
                      height: 48,
                      child:
                          AppLoadingIndicator(
                        size: 27,
                      ),
                    );
                  }

                  return AppButton(
                    title:
                        'إرسال الرد',
                    onTap:
                        controller
                            .submitReply,
                    height: 48,
                    borderRadius: 12,
                    icon: const Icon(
                      Icons.send_rounded,
                      color:
                          AppColors.white,
                      size: 19,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}