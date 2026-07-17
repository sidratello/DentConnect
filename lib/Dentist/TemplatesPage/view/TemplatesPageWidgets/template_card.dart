import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.toNamed(
          AppRouter.templateDetailsPage,
        );
      },
      child: Container(
        width: double.infinity,
        height: Static.getheight(context, 62),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/template.png',
                width: Static.getwidth(context, 62),
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Static.getwidth(context, 16),
                ),
                child: Text(
                  'فيلر صدفي',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: Static.getwidth(context, 22),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Static.getwidth(context, 12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {},
                child: Container(
                  width: Static.getwidth(context, 36),
                  height: Static.getwidth(context, 36),
                  decoration: const BoxDecoration(
                    color: AppColors.boxRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.error,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
