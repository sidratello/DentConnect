import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class TemplateDurationCard extends StatelessWidget {
  final int days;

  const TemplateDurationCard({
    super.key,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الوقت المتوقع',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            '$days أيام',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
