import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/LabDetailsPage/controller/lab_controller.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class LabRatingCard extends StatelessWidget {
  final int labId;

  const LabRatingCard({
    super.key,
    required this.labId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LabController>();

    return Obx(
      () {
        final bool canSubmit = controller.qualityRating.value > 0 &&
            controller.timeRating.value > 0;

        final bool isSubmitting = controller.isSubmittingRating.value;

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          padding: EdgeInsets.all(
            Static.getwidth(context, 18),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(
                  alpha: 0.04,
                ),
                blurRadius: 16,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(
                        alpha: 0.08,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'قيّم تجربتك مع المخبر',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'قيّم جودة العمل والالتزام بالوقت',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontSize: 10.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              _RatingItem(
                icon: Icons.workspace_premium_outlined,
                title: 'جودة العمل',
                subtitle: 'قيّم جودة التعويض والنتيجة النهائية',
                rating: controller.qualityRating.value,
                onRatingChanged: (value) {
                  controller.qualityRating.value = value;
                },
              ),

              const SizedBox(height: 12),

              _RatingItem(
                icon: Icons.schedule_outlined,
                title: 'الالتزام بالوقت',
                subtitle: 'قيّم مدى الالتزام بموعد التسليم',
                rating: controller.timeRating.value,
                onRatingChanged: (value) {
                  controller.timeRating.value = value;
                },
              ),

              const SizedBox(height: 18),

              // رسالة توضيحية
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: !canSubmit
                    ? Container(
                        key: const ValueKey(
                          'rating-hint',
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 11,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.07),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 18,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'يرجى تقييم الجودة والوقت لإرسال التقييم',
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(
                        key: ValueKey(
                          'rating-ready',
                        ),
                      ),
              ),

              if (!canSubmit) const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: !canSubmit || isSubmitting
                      ? null
                      : () {
                          controller.submitRating(
                            labId: labId,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary.withValues(
                      alpha: 0.10,
                    ),
                    disabledForegroundColor: AppColors.textSecondary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'إرسال التقييم',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RatingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const _RatingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Static.getwidth(context, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 10.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                final star = index + 1;

                return IconButton(
                  onPressed: () {
                    onRatingChanged(star);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 34,
                    minHeight: 34,
                  ),
                  icon: Icon(
                    star <= rating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    size: 28,
                    color: star <= rating
                        ? const Color(0xFFFFB400)
                        : AppColors.textSecondary.withValues(
                            alpha: 0.35,
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
