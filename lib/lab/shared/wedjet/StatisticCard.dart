

import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';
class StatisticCard extends StatelessWidget {
  final String title;
  final int count;
  final Color valueColor;
  final Color iconColor;
  final Color iconBackground;
  final IconData icon;
  final VoidCallback? onTap;

  const StatisticCard({
    super.key,
    required this.title,
    required this.count,
    required this.valueColor,
    required this.iconColor,
    required this.iconBackground,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 125,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.littleBlue.withOpacity(0.6),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkBlue.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color: AppColors.normalText,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius:
                          BorderRadius.circular(13),
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 26,
                    ),
                  ),
                  Text(
                    count.toString(),
                    style: AppTextStyles
                        .ibmBold22NeutralStyle
                        .copyWith(
                      color: valueColor,
                      fontSize: 32,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}