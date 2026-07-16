import 'package:flutter/material.dart';
import 'package:template/core/app_text_styles.dart';

class CaseOrderIconText extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String text;
  final Color iconColor;
  final Color textColor;
  final Color? background;
  final bool isChip;
  final bool expandText;

  const CaseOrderIconText({
    super.key,
    this.icon,
    this.imagePath,
    required this.text,
    required this.iconColor,
    required this.textColor,
    this.background,
    this.isChip = false,
    this.expandText = true,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      textAlign: TextAlign.right,
      // maxLines: expandText ? 1 : null,
      // overflow: expandText ? TextOverflow.ellipsis : TextOverflow.visible,
      maxLines: isChip ? 2 : 1,
overflow: TextOverflow.ellipsis,
      style: isChip
          ? AppTextStyles.ibmRegular12DarkStyle.copyWith(
              color: textColor,
              // fontWeight: FontWeight.normal,
              fontSize: 14,
height: 1.15,
fontWeight: FontWeight.w600,
            )
          : AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: textColor,
              fontSize: 13,
              height: 1.1,
              fontWeight: FontWeight.w500,
            ),
    );

    final row = Row(
      mainAxisSize:
          (isChip || !expandText) ? MainAxisSize.min : MainAxisSize.max,
      textDirection: TextDirection.rtl,
      children: [
        if (imagePath != null)
          Image.asset(
            imagePath!,
            width: isChip ? 15 : 18,
            height: isChip ? 15 : 18,
          )
        else
          Icon(
            icon,
            size: isChip ? 15 : 18,
            color: iconColor,
          ),

        const SizedBox(width: 6),
Flexible(
  child: textWidget,
),
        // if (expandText && !isChip)
        //   Expanded(child: textWidget)
        // else
        //   textWidget,
      ],
    );

    if (!isChip) return row;

    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      constraints: const BoxConstraints(
  maxWidth: 130,
),

padding: const EdgeInsets.symmetric(
  horizontal: 8,
  vertical: 5,
),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(11),
      ),
      child: row,
    );
  }
}