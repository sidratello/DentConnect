import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';




class DoctorNotesSection extends StatelessWidget {
  final String notes;

  /// true => wraps with DetailsSectionCard
  /// false => returns only the content
  final bool withCard;

  const DoctorNotesSection({
    super.key,
    required this.notes,
    this.withCard = true,
  });

  @override
  Widget build(BuildContext context) {
    if (notes.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'ملاحظات الطلب',
          icon: Icons.chat_outlined,
        ),

        const SizedBox(height: 18),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: AppColors.littleBlue.withOpacity(.18),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.littleBlue.withOpacity(.55),
            ),
          ),
          child: Text(
            notes,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.textDark,
              height: 1.8,
            ),
          ),
        ),
      ],
    );

    if (withCard) {
      return DetailsSectionCard(
        child: content,
      );
    }

    return content;
  }
}