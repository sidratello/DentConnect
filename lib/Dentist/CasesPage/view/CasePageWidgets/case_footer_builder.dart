import 'package:flutter/material.dart';
import 'package:template/Dentist/CasesPage/model/case_model.dart';
import 'package:template/Dentist/CasesPage/model/case_status.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class CaseFooterBuilder extends StatelessWidget {
  final CaseModel item;

  const CaseFooterBuilder({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.status == CaseStatus.delivered) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'السعر النهائي: ${item.price}',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: Static.getwidth(
                context,
                14,
              ),
              color: AppColors.priceBlue,
            ),
          ),
          item.isRated
              ? Row(
                  children: [
                    Text(
                      item.rating.toString(),
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwidth(
                          context,
                          14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.yellowRate,
                      size: 18,
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellowRate.withValues(
                      alpha: 0.12,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: const Text(
                    'قيّم الآن',
                  ),
                ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'السعر: ${item.price}',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w400,
            fontSize: Static.getwidth(
              context,
              14,
            ),
            color: AppColors.priceBlue,
          ),
        ),
        Row(
          children: [
            Text(
              'لا يمكنك التقييم ',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(
                  context,
                  13,
                ),
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.star_rounded,
              color: AppColors.greyColor,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}
