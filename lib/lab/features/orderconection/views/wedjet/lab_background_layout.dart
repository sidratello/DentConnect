import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';

class LabBackgroundLayout extends StatelessWidget {
  final Widget child;

  const LabBackgroundLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/Vector.png',
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
