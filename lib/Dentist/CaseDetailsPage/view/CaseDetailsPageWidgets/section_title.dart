import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Static.getwidth(context, 38),
          height: Static.getwidth(context, 38),
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: Static.getwidth(context, 20),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(
          width: Static.getwidth(context, 12),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 18),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
