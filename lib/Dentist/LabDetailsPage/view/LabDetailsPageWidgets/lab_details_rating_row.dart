import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class LabDetailsRatingRow extends StatelessWidget {
  final String yearsOfExperience;
  final String rating;
  const LabDetailsRatingRow(
      {super.key, required this.yearsOfExperience, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'سنوات الخبرة:',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: Static.getwidth(context, 4),
              ),
              child: Text(
                yearsOfExperience,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwidth(context, 18),
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Static.getwidth(context, 12),
          ),
          child: Row(
            children: [
              Text(
                'تقييم المخبر العام:',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w500,
                  fontSize: Static.getwidth(context, 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Static.getwidth(context, 4),
                ),
                child: Text(
                  rating,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwidth(context, 18),
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Static.getwidth(context, 4),
                ),
                child: Icon(
                  Icons.star_rounded,
                  color: AppColors.yellowRate,
                  size: Static.getwidth(context, 24),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
