import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/info_badge.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class CaseStatusCard extends StatelessWidget {
  final String patientName;
  final String caseNumber;
  final String status;

  final bool isUrgent;

  const CaseStatusCard({
    super.key,
    required this.patientName,
    required this.caseNumber,
    required this.status,
    required this.isUrgent,
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
          Row(
            children: [
              CircleAvatar(
                radius: Static.getwidth(context, 26),
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.12),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              AppSpacing.width(context, 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w700,
                        fontSize: Static.getwidth(context, 18),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    AppSpacing.height(context, 4),
                    Text(
                      'رقم الحالة : $caseNumber',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 13),
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.height(context, 20),
          Row(
            children: [
              Expanded(
                child: InfoBadge(
                  icon: Icons.pending_actions,
                  title: status,
                  color: AppColors.statusInProgress,
                ),
              ),
              if (isUrgent) ...[
                AppSpacing.width(context, 10),
                const InfoBadge(
                  icon: Icons.bolt,
                  title: 'مستعجلة',
                  color: AppColors.lightRed,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
