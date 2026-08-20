import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: Static.getwidth(
            context,
            16,
          ),
          color: AppColors.primary,
        ),
        SizedBox(
          width: Static.getwidth(
            context,
            6,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: Static.getwidth(
                    context,
                    10,
                  ),
                  color: AppColors.black54,
                ),
              ),
              SizedBox(
                height: Static.getheight(
                  context,
                  2,
                ),
              ),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(
                    context,
                    11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
