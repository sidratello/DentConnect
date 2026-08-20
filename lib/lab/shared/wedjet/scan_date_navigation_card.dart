import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';

class ScanDateNavigationCard extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onDateTap;

  const ScanDateNavigationCard({
    super.key,
    required this.selectedDate,
    required this.onPrevious,
    required this.onNext,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'EEEE، d MMMM yyyy',
      'ar',
    ).format(selectedDate);

    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _ArrowButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: onPrevious,
          ),

          Expanded(
            child: InkWell(
              onTap: onDateTap,
              borderRadius: BorderRadius.circular(14),
              child: Center(
                child: Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          _ArrowButton(
            icon: Icons.arrow_forward_ios_rounded,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 60,
        height: double.infinity,
        child: Icon(
          icon,
          color: AppColors.darkBlue,
          size: 22,
        ),
      ),
    );
  }
}