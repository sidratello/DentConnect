import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  final double bottomImageHeight;
  final EdgeInsetsGeometry? padding;

  const AuthLayout({
    super.key,
    required this.children,
    this.bottomImageHeight = 0.25,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/Vector.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * bottomImageHeight,
                fit: BoxFit.fill,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}