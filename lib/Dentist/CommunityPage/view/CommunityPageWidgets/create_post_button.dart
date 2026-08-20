import 'package:flutter/material.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class CreatePostButton extends StatelessWidget {
  final VoidCallback onTap;

  const CreatePostButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 18),
          vertical: Static.getheight(context, 16),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.borderBlack,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: AppColors.boxBlack,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            AppSpacing.width(context, 12),
            Text(
              'إضافة منشور جديد',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
