import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class ClinicalNotesCard extends StatelessWidget {
  final String notes;

  const ClinicalNotesCard({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          18,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الملاحظات السريرية',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                17,
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              12,
            ),
          ),
          Text(
            notes,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(
                context,
                14,
              ),
              height: 21 / 14,
            ),
          ),
        ],
      ),
    );
  }
}
