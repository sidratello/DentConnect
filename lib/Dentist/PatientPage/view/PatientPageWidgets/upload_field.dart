import 'package:flutter/material.dart';

import 'package:template/core_dentist/utils/static.dart' show Static;

import '../../../../core_dentist/theme/app_colors.dart';

class UploadField extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const UploadField({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Static.getheight(
          context,
          54,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Static.getwidth(
                    context,
                    14,
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Container(
              width: Static.getwidth(
                context,
                50,
              ),
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: const Icon(
                Icons.upload_rounded,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
