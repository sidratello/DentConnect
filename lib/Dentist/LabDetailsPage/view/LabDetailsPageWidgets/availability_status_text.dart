import 'package:flutter/material.dart';

import '../../../../core_dentist/utils/static.dart';

class AvailabilityStatusText extends StatelessWidget {
  final String text;
  final Color color;

  const AvailabilityStatusText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 18),
        color: color,
      ),
    );
  }
}
