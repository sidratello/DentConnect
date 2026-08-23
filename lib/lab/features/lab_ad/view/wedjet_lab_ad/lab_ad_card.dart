import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/case_orders/views/widget/InfoRow.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/AdImagesGalleryScreen.dart';

import '../../model/lab_ad_model.dart';
import 'lab_ad_status_chip.dart';

class LabAdCard extends StatelessWidget {
final LabAdModel advertisement;
  final bool isPendingPayment;

  final VoidCallback onDetails;
  final VoidCallback onPay;

  const LabAdCard({
    super.key,
    required this.advertisement,
    required this.isPendingPayment,
    required this.onDetails,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.75),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: LabAdStatusChip(
              isActive:
                  advertisement.isActive,
              isPaid:
                  advertisement.isPaid,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            textDirection: ui.TextDirection.rtl,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
      _AdvertisementImage(
  advertisement: advertisement,
),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                       advertisement.content,
                      textAlign: TextAlign.right,
                      maxLines: 3,
                      overflow:
                          TextOverflow.ellipsis,
                      style: AppTextStyles
                          .ibmRegular14NeutralStyle
                          .copyWith(
                        color:
                            AppColors.darkBlue,
                        fontWeight:
                            FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 13),
                    if (isPendingPayment) ...[
                      CaseOrderIconText(
                        icon: Icons
                            .payments_outlined,
                        text:
                            '${_formatPrice(advertisement.price)} \$',
                        iconColor:
                            AppColors.primaryBlue,
                        textColor:
                            AppColors.primaryBlue,
                        expandText: false,
                      ),
                      const SizedBox(height: 10),
                    ],
                    CaseOrderIconText(
                      icon: Icons
                          .calendar_month_outlined,
                      text:
                          ' الانتهاء: ${_formatDate(advertisement.expiresAt)}',
                      iconColor:
                          AppColors.normalText,
                      textColor:
                          AppColors.darkBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          if (isPendingPayment)
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: 'التفاصيل',
                    onTap: onDetails,
                    type:
                        AppButtonType.outlined,
                    height: 46,
                    borderRadius: 12,
                    borderColor:
                        AppColors.primary200,
                    textColor:
                        AppColors.darkBlue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppButton(
                    title: 'ادفع الآن',
                    onTap: onPay,
                    height: 46,
                    borderRadius: 12,
                    icon: const Icon(
                      Icons.payments_outlined,
                      color: AppColors.white,
                      size: 19,
                    ),
                  ),
                ),
              ],
            )
          else
            AppButton(
              title: 'التفاصيل',
              onTap: onDetails,
              type: AppButtonType.outlined,
              height: 46,
              borderRadius: 12,
              borderColor:
                  AppColors.primary200,
              textColor: AppColors.darkBlue,
            ),
        ],
      ),
    );
  }



  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'غير محدد';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(date);
  }

  String _formatPrice(double price) {
    if (price == price.roundToDouble()) {
      return price.toInt().toString();
    }

    return price.toStringAsFixed(2);
  }
}
class _AdvertisementImage
    extends StatelessWidget {
  final LabAdModel advertisement;

  const _AdvertisementImage({
    required this.advertisement,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
       borderRadius:
          BorderRadius.circular(14),

      onTap: advertisement.images.isEmpty
          ? null
          : () {
              Get.to(
                () => AdImagesGalleryScreen(
                  images:
                      advertisement.images,
                ),
              );
            },
      child: AppNetworkContentImage(
        imagePath: advertisement.images.isEmpty
            ? null
            : advertisement.images.first,
        additionalImagesCount:
            advertisement.images.isEmpty
                ? 0
                : advertisement.images.length - 1,
        width: 116,
        height: 116,
        borderRadius: 14,
      ),
    );
  }
}