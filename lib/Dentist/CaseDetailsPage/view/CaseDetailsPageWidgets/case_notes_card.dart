import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class CaseNotesCard extends StatelessWidget {
  final String description;
  final String notes;

  const CaseNotesCard({
    super.key,
    required this.description,
    required this.notes,
  });

  Widget _buildTextBox(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w600,
            fontSize: Static.getwidth(context, 14),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        AppSpacing.height(context, 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            Static.getwidth(context, 16),
          ),
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            value.isEmpty ? 'لا يوجد' : value,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 14),
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            icon: Icons.notes_rounded,
            title: 'الوصف والملاحظات',
          ),
          AppSpacing.height(context, 20),
          _buildTextBox(
            context,
            title: 'الوصف المختصر',
            value: description,
          ),
          AppSpacing.height(context, 20),
          _buildTextBox(
            context,
            title: 'ملاحظات الطلبية',
            value: notes,
          ),
        ],
      ),
    );
  }
}
