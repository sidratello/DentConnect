import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
class ScrollDotsIndicator extends StatelessWidget {
  final int currentPage;

  const ScrollDotsIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(currentPage == 0),
        const SizedBox(width: 8),
        _dot(currentPage == 1),
              const SizedBox(width: 8),
        _dot(currentPage == 2),
      ],
    );
  }

  Widget _dot(bool active) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? AppColors.primaryBlue
            : AppColors.primaryBlue.withOpacity(0.3),
      ),
    );
  }
}