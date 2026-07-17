import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class LabDetailsLocation extends StatelessWidget {
  const LabDetailsLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الموقع:',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontSize: Static.getwidth(context, 18),
            color: AppColors.black,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: Static.getwidth(context, 6),
            ),
            child: Text(
              'برزة - الشارع الرئيسي - شارع 17 نيسان بناء 23',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 18),
                height: 24 / 16,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
