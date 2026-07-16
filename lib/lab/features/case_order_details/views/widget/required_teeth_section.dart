import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class RequiredTeethSection extends StatelessWidget {
  final List<LabOrderItemModel> items;

  const RequiredTeethSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'الأسنان المطلوبة',
            icon: Icons.medical_services_outlined,
          ),
          const SizedBox(height: 18),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    item.compensationType,
                    style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'أرقام الأسنان',
                          style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          textDirection: TextDirection.rtl,
                          children: item.toothNumbers.map((tooth) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.littleBlue.withOpacity(.55),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Text(
                                tooth.toString(),
                                style: AppTextStyles.ibmRegular14NeutralStyle
                                    .copyWith(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 1,
                    height: 80,
                    color: AppColors.littleBlue.withOpacity(.7),
                  ),
                  const SizedBox(width: 18),
                  SizedBox(
                    width: 110,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 6,
                      children: item.toothNumbers.map((tooth) {
                        return Image.asset(
                          AppHelper.toothImage(tooth),
                          width: 42,
                          height: 48,
                          fit: BoxFit.contain,
                        );
                      }).toList(),
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