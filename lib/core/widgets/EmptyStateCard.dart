import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';



class EmptyStateCard extends StatelessWidget {
  final String title;
  final String subtitle;

  final IconData icon;

  final bool showCard;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final double iconContainerSize;
  final double iconSize;

  final Color? iconColor;
  final Color? iconBackgroundColor;

  final Color? backgroundColor;
  final Color? borderColor;

  final double borderRadius;

  const EmptyStateCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.event_busy_outlined,
    this.showCard = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 38,
    ),
    this.margin = EdgeInsets.zero,
    this.iconContainerSize = 70,
    this.iconSize = 34,
    this.iconColor,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 18,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconContainerSize,
          height: iconContainerSize,
          decoration: BoxDecoration(
            color: iconBackgroundColor ??
                AppColors.littleBlue.withOpacity(
                  0.45,
                ),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color:
                iconColor ?? AppColors.primaryBlue,
            size: iconSize,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles
              .ibmMedium18NeutralStyle
              .copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles
              .ibmRegular14NeutralStyle
              .copyWith(
            color: AppColors.normalText,
            height: 1.5,
          ),
        ),
      ],
    );

    if (!showCard) {
      return Padding(
        padding: padding,
        child: content,
      );
    }

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color:
            backgroundColor ?? AppColors.white,
        borderRadius:
            BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ??
              AppColors.littleBlue.withOpacity(
                0.8,
              ),
        ),
      ),
      child: content,
    );
  }
}