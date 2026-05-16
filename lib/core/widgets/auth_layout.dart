import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  final double bottomImageHeight;
  final EdgeInsetsGeometry? padding;

  const AuthLayout({
    super.key,
    required this.children,
    this.bottomImageHeight = 0.18,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.45,
                child: Image.asset(
                  'assets/images/Vector.png',
                  width: double.infinity,
                  height: screenHeight * bottomImageHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                 constraints: BoxConstraints(
    minHeight: screenHeight,
  ),
                child: Padding(
                  padding: padding ??
                      EdgeInsets.only(
                        left: 28,
                        right: 28,
                        top: 10,
                        bottom: bottomInset + 24,
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}