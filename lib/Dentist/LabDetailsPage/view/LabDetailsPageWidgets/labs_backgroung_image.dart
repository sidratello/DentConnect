import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class LabsBackgroungImage extends StatelessWidget {
  final String imagePath;

  const LabsBackgroungImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Static.getheight(context, 260),
      child: Stack(
        children: [
          Image.network(
            imagePath,
            width: double.infinity,
            height: Static.getheight(context, 260),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Static.getheight(context, 120),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white.withValues(alpha: 0),
                    AppColors.white.withValues(alpha: 0.1),
                    AppColors.white.withValues(alpha: 0.5),
                    AppColors.white,
                  ],
                  stops: const [0, 0.3, 0.7, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
