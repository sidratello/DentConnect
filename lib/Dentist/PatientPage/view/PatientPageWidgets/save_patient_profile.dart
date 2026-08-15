import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class SavePatientProfile extends StatelessWidget {
  const SavePatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        18,
      ),
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: Static.getheight(
          context,
          54,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Center(
          child: Text(
            'إنشاء الملف',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                16,
              ),
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
