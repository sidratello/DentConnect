import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class AuthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  final double topSpacing;
  final double iconSize;
  final double iconBoxSize;
  final EdgeInsetsGeometry padding;

  const AuthCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
    this.topSpacing = 90,
    this.iconSize = 38,
    this.iconBoxSize = 72,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topSpacing),

        Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.96),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withOpacity(0.10),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: iconBoxSize,
                height: iconBoxSize,
                decoration: BoxDecoration(
                  color: AppColors.littleBlue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(0.12),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: AppColors.primaryBlue,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                  color: AppColors.textDark.withOpacity(0.75),
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 26),

              ...children,
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}