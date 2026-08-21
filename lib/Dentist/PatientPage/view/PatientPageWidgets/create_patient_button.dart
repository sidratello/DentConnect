import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class CreatePatientButton extends StatelessWidget {
  const CreatePatientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Get.toNamed(
          AppRouter.createPatientPage,
        );
      },
      child: Container(
        width: double.infinity,
        height: Static.getheight(context, 54),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: AppColors.boxBlack,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_rounded,
              color: AppColors.white,
              size: Static.getwidth(context, 22),
            ),
            SizedBox(
              width: Static.getwidth(context, 8),
            ),
            Text(
              'إنشاء ملف مريض جديد',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: Static.getwidth(context, 16),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
