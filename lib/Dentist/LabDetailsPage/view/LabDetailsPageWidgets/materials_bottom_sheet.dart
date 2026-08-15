import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

void showLabInfoBottomSheet(
  BuildContext context, {
  required List<String> specialties,
  required List<String> materials,
}) {
  Get.bottomSheet(
    Container(
      height: MediaQuery.of(context).size.height * .75,
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
        vertical: Static.getheight(context, 24),
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: Static.getwidth(context, 52),
              height: Static.getheight(context, 5),
              decoration: BoxDecoration(
                color: AppColors.boxGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          AppSpacing.height(context, 24),
          Center(
            child: Text(
              "المواد والاختصاصات",
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w700,
                fontSize: Static.getwidth(context, 22),
              ),
            ),
          ),
          AppSpacing.height(context, 28),
          _SectionTitle(
            title: "الاختصاصات",
            icon: Icons.medical_services_outlined,
          ),
          AppSpacing.height(context, 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: specialties.map((e) => _InfoChip(text: e)).toList(),
          ),
          AppSpacing.height(context, 28),
          Divider(color: AppColors.border),
          AppSpacing.height(context, 20),
          _SectionTitle(
            title: "المواد",
            icon: Icons.science_outlined,
          ),
          AppSpacing.height(context, 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: materials.map((e) => _InfoChip(text: e)).toList(),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
  );
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 22,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 18),
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;

  const _InfoChip({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 18),
        vertical: Static.getheight(context, 12),
      ),
      decoration: BoxDecoration(
        color: AppColors.boxGrey,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w600,
          fontSize: Static.getwidth(context, 14),
        ),
      ),
    );
  }
}
