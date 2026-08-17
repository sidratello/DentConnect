import 'package:flutter/material.dart';
import 'package:template/Dentist/CasesPage/model/case_status.dart';
import 'package:template/core/utils/static.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final caseStatus = CaseStatus.getStatusFromString(status);
    final color = CaseStatus.getColor(caseStatus);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 8),
        vertical: Static.getheight(context, 4),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        caseStatus.name,
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w600,
          fontSize: Static.getwidth(context, 10),
          color: color,
        ),
      ),
    );
  }
}
