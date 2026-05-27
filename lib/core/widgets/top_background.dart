import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class TopBackground extends StatelessWidget {
  final Widget body;

  const TopBackground({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Static.getheight(context, 260),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        body,
      ],
    );
  }
}
