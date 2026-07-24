import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class LabDetailsLocation extends StatelessWidget {
  final String address;

  const LabDetailsLocation({super.key, required this.address});

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
              address,
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
