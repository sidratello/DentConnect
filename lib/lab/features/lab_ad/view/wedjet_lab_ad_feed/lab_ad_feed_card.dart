import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/AdImagesGalleryScreen.dart';

import '../../model/lab_feed_ad_model.dart';

class LabAdFeedCard
    extends StatelessWidget {
  final LabFeedAdModel advertisement;

  const LabAdFeedCard({
    super.key,
    required this.advertisement,
  });

  @override
  Widget build(BuildContext context) {
    final firstImage =
        advertisement.images.isEmpty
            ? null
            : advertisement.images.first;

    final additionalImagesCount =
        advertisement.images.isEmpty
            ? 0
            : advertisement.images.length -
                1;

    return Container(
      padding:
          const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.45),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.045),
            blurRadius: 14,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          if (advertisement
              .images.isNotEmpty) ...[
            InkWell(
  onTap: () {
    Get.to(
      () => AdImagesGalleryScreen(
        images: advertisement.images,
      ),
    );
  },
  borderRadius: BorderRadius.circular(15),



              child: AppNetworkContentImage(
                imagePath: firstImage,
                additionalImagesCount:
                    additionalImagesCount,
                aspectRatio:
                    16 / 9,
                borderRadius: 15,
              ),
            ),

            const SizedBox(
              height: 14,
            ),
          ],

          if (advertisement
              .content.isNotEmpty)
            Text(
              advertisement.content,
              textAlign:
                  TextAlign.right,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.darkBlue,
                fontSize: 15,
                height: 1.6,
                fontWeight:
                    FontWeight.w600,
              ),
            )
          else
            Text(
              'إعلان جديد',
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
            height: 15,
          ),

          Container(
            height: 1,
            color: AppColors.littleBlue
                .withOpacity(.55),
          ),

          const SizedBox(
            height: 12,
          ),

          Row(
            textDirection:
                ui.TextDirection.rtl,
            children: [
              Expanded(
                child:
                    CaseOrderIconText(
                  icon: Icons
                      .calendar_month_outlined,
                  text:
                      'نُشر ${_formatDate(advertisement.createdAt)}',
                  iconColor:
                      AppColors.primaryBlue,
                  textColor:
                      AppColors.normalText,
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              if (advertisement
                      .expiresAt !=
                  null)
                Expanded(
                  child:
                      CaseOrderIconText(
                    icon: Icons
                        .event_available_outlined,
                    text:
                        'حتى ${_formatDate(advertisement.expiresAt)}',
                    iconColor:
                        AppColors.primaryBlue,
                    textColor:
                        AppColors.normalText,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return 'غير محدد';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(
      date.toLocal(),
    );
  }
}