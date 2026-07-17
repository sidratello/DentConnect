import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/info_row.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class CaseInfoCard extends StatelessWidget {
  final String patientName;
  final String teethNumbers;
  final String restorationType;
  final String color;
  final String impressionType;
  final bool hasAccessory;
  final String templateName;

  const CaseInfoCard({
    super.key,
    required this.patientName,
    required this.teethNumbers,
    required this.restorationType,
    required this.color,
    required this.impressionType,
    required this.hasAccessory,
    required this.templateName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(context, 20),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const SectionTitle(
            icon: Icons.medical_information_outlined,
            title: 'معلومات الحالة',
          ),
          AppSpacing.height(context, 18),
          InfoRow(
            icon: Icons.person_outline,
            title: 'اسم المريض',
            value: patientName,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.grid_view_rounded,
            title: 'الأسنان المشغولة',
            value: teethNumbers,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.architecture_rounded,
            title: 'نوع التعويض',
            value: restorationType,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.palette_outlined,
            title: 'اللون',
            value: color,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.qr_code_scanner_rounded,
            title: 'نوع الطبعة',
            value: impressionType,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.layers_outlined,
            title: 'القالب المستخدم',
            value: templateName.isEmpty ? 'لا يوجد' : templateName,
          ),
          const Divider(),
          InfoRow(
            icon: Icons.extension_outlined,
            title: 'يوجد إكسسوار',
            value: hasAccessory ? 'نعم' : 'لا',
          ),
        ],
      ),
    );
  }
}
