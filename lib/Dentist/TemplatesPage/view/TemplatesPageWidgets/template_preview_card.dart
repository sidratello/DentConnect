import 'package:flutter/material.dart';
import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class TemplatePreviewCard extends StatelessWidget {
  final String title;

  const TemplatePreviewCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Image.asset('assets/images/template_rec.png',
                height: Static.getheight(context, 180),
                width: double.infinity,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(
              Static.getwidth(context, 16),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w700,
                fontSize: Static.getwidth(context, 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
