import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class ScannerDateItem extends StatelessWidget {
  final String date;
  final VoidCallback onTap;

  const ScannerDateItem({
    super.key,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Static.getheight(context, 14),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Static.getwidth(context, 18),
            vertical: Static.getheight(context, 18),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: Static.getwidth(context, 42),
                height: Static.getwidth(context, 42),
                decoration: const BoxDecoration(
                  color: AppColors.boxBlack,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: Static.getwidth(context, 22),
                ),
              ),
              SizedBox(
                width: Static.getwidth(context, 14),
              ),
              Expanded(
                child: Text(
                  date,
                  style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w500,
                      fontSize: Static.getwidth(context, 16),
                      color: AppColors.textPrimary),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: Static.getwidth(context, 16),
                color: AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
