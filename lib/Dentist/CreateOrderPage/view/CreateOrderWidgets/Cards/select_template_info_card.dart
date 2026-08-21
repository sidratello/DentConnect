import 'package:flutter/material.dart';

import 'package:template/Dentist/TemplatesPage/model/template_model.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../../core_dentist/theme/app_colors.dart';

class SelectedTemplateInfoCard extends StatelessWidget {
  final CaseTemplate template;

  const SelectedTemplateInfoCard({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: .04,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: .14,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 18),
          _buildInfoRow(
            icon: Icons.title_outlined,
            title: 'اسم القالب',
            value: template.title,
          ),
          _divider(),
          _buildInfoRow(
            icon: Icons.work_outline,
            title: 'نوع العمل',
            value: template.workType,
          ),
          _divider(),
          _buildInfoRow(
            icon: Icons.qr_code_scanner_outlined,
            title: 'الطبعة المفضلة',
            value: template.preferredImpression,
          ),
          _divider(),
          _buildRequiredImages(),
          _divider(),
          _buildInfoRow(
            icon: Icons.notes_outlined,
            title: 'ملاحظات القالب',
            value: template.notes.isNotEmpty
                ? template.notes.join(' • ')
                : 'لا توجد ملاحظات',
          ),
          _divider(),
          _buildBooleanRow(
            icon: Icons.priority_high_rounded,
            title: 'طلب مستعجل',
            value: template.isUrgent,
          ),
          _divider(),
          _buildBooleanRow(
            icon: Icons.build_outlined,
            title: 'يحتاج Try-In',
            value: template.needsTryIn,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(
              alpha: .09,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.description_outlined,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'معلومات القالب',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'معلومات للاطلاع والاستئناس فقط',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(
              alpha: .08,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'للاطلاع',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value.isNotEmpty ? value : 'غير محدد',
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRequiredImages() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.image_outlined,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'الصور المطلوبة',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 7),
              if (template.requiredImages.isEmpty)
                const Text(
                  'لا توجد صور محددة',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                )
              else
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: template.requiredImages
                      .map(
                        (image) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .06),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            image,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBooleanRow({
    required IconData icon,
    required String title,
    required bool value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: value
                ? Colors.green.withValues(alpha: .08)
                : Colors.grey.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value ? 'نعم' : 'لا',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: value ? Colors.green : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 1),
    );
  }
}
