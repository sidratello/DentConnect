import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/static.dart';
import '../controller/search_labs_controller.dart';

class RatingFilterSection extends StatelessWidget {
  const RatingFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchLabsController>();

    return Obx(
      () => Column(
        children: [
          _ratingItem(context, controller, title: 'الكل', value: 0),
          AppSpacing.height(context, 10),
          _ratingItem(context, controller,
              title: '4.5 نجوم فما فوق', value: 4.5),
          AppSpacing.height(context, 8),
          _ratingItem(context, controller, title: '3 نجوم فما فوق', value: 3),
          AppSpacing.height(context, 8),
          _ratingItem(context, controller, title: '1 نجوم فما فوق', value: 1),
        ],
      ),
    );
  }

  Widget _ratingItem(
    BuildContext context,
    SearchLabsController controller, {
    required String title,
    required double value,
  }) {
    final isSelected = controller.selectedRating.value == value;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        controller.selectedRating.value = value;
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 18),
          vertical: Static.getheight(context, 16),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.littleBlue : AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.primary200 : AppColors.white,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: Static.getwidth(context, 26),
              height: Static.getheight(context, 26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary200
                    : AppColors.surfaceTintColor,
                border: Border.all(
                  color: isSelected ? AppColors.primary200 : AppColors.white,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            AppSpacing.width(context, 12),
            const Icon(
              Icons.star_rounded,
              color: AppColors.yellowRate,
            ),
            AppSpacing.width(context, 8),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w500,
                  fontSize: Static.getwidth(context, 15),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
