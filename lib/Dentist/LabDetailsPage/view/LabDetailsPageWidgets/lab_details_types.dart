import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import 'compensation_bottom_sheet.dart';

class LabDetailsTypes extends StatelessWidget {
  const LabDetailsTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 16),
        ),
        child: InkWell(
          onTap: () {
            showCompensationBottomSheet(
              context,
            );
          },
          child: Text(
            'أنواع التعويضات التي يدعمها المخبر',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 18),
                decoration: TextDecoration.underline,
                color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
