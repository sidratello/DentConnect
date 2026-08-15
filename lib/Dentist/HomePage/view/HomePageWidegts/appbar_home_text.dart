import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class AppbarHomeText extends StatelessWidget {
  final bool isPreviewMode;

  const AppbarHomeText({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isPreviewMode)
          Text(
            isPreviewMode ? '! مرحبا بك ' : ' مرحبا بك دكتور ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
              letterSpacing: 0,
            ),
          ),
        Text(
          ' محمد',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
