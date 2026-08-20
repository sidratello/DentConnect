import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';

class DetailsSectionCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const DetailsSectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.35),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}