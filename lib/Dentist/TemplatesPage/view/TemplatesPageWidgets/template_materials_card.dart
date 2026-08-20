import 'package:flutter/material.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class TemplateMaterialsCard extends StatelessWidget {
  final List<String> materials;

  const TemplateMaterialsCard({
    super.key,
    required this.materials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المواد المستخدمة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AppSpacing.height(context, 12),
          ...materials.map(
            (material) => Padding(
              padding: EdgeInsets.only(
                bottom: Static.getheight(context, 8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.success,
                    size: Static.getwidth(context, 18),
                  ),
                  SizedBox(
                    width: Static.getwidth(context, 8),
                  ),
                  Expanded(
                    child: Text(
                      material,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
