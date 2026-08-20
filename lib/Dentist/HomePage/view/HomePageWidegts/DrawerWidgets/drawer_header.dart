import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: Static.getwidth(context, 38),
          backgroundImage: const AssetImage(
            'assets/images/doctor_profile.png',
          ),
        ),
        AppSpacing.height(context, 14),
        Text(
          'د. محمد الأحمد',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w600,
            fontSize: Static.getwidth(context, 18),
          ),
        ),
      ],
    );
  }
}
