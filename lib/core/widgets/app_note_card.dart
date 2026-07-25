import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AppNoteCard extends StatelessWidget {
  final String? title;
  final List<String> messages;

  final IconData icon;
  final Color color;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const AppNoteCard({
    super.key,
    this.title,
    required this.messages,
    this.icon = Icons.info_outline_rounded,
    this.color = AppColors.primaryBlue,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 15,
    ),
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? color.withOpacity(.06),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? color.withOpacity(.10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null &&
                    title!.trim().isNotEmpty) ...[
                  Text(
                    title!,
                    style: AppTextStyles
                        .ibmRegular14NeutralStyle
                        .copyWith(
                      color: textColor ?? AppColors.darkBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                ...messages.map(
                  (message) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2,
                    ),
                    child: Text(
                      '• $message',
                      textAlign: TextAlign.right,
                      style: AppTextStyles
                          .ibmRegular14NeutralStyle
                          .copyWith(
                        color: textColor ?? AppColors.normalText,
                        height: 1.6,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}