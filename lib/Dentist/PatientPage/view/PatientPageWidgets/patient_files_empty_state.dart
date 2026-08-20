import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../../core_dentist/widgets/app_spacing.dart';

class PatientFilesEmptyState extends StatelessWidget {
  const PatientFilesEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Static.getwidth(context, 90),
              height: Static.getwidth(context, 90),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.folder_shared_outlined,
                size: Static.getwidth(context, 42),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            AppSpacing.height(context, 20),
            Text(
              'لا توجد ملفات مرضى حالياً',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: Static.getwidth(context, 18),
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            AppSpacing.height(context, 8),
            Text(
              'يمكنك إنشاء ملف جديد لكل مريض لحفظ الملاحظات السريرية والصور والأشعة ومتابعة حالته بسهولة.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 14),
                height: 21 / 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
