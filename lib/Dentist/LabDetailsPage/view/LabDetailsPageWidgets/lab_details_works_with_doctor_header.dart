import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class LabDetailsWorksWithDoctorHeader extends StatelessWidget {
  const LabDetailsWorksWithDoctorHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: Static.getwidth(context, 8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'حالاتك السابقة مع المخبر',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(context, 18),
                  height: 27 / 16,
                  color: AppColors.textDark,
                ),
              ),
              Transform.rotate(
                angle: 3.14,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: Static.getwidth(context, 18),
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
