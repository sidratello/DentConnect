import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final bool centered;

  const AppLoadingIndicator({
    super.key,
    this.size = 36,
    this.strokeWidth = 4,
    this.color,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    final loader = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? AppColors.primaryBlue,
      ),
    );

    if (!centered) {
      return loader;
    }

    return Center(
      child: loader,
    );
  }
}