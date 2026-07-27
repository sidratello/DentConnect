import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/monthly_calendar/model/calendar_day_details_model.dart';
import 'package:template/lab/features/monthly_calendar/view/wedjet_day_details/scan_visit_details_dialog.dart';
import 'package:template/lab/shared/wedjet/scan_appointment_card.dart';

class CalendarScanVisitsSection extends StatelessWidget {
  final List<CalendarScanVisitModel> visits;
  final DateTime date;
  const CalendarScanVisitsSection({
    super.key,
    required this.visits,
       required this.date,
  });

  @override
  Widget build(BuildContext context) {
    if (visits.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'حجوزات المسح (${visits.length})',
          textAlign: TextAlign.right,
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 12),

        ...visits.map(
          (visit) => ScanAppointmentCard(
            doctorName: visit.doctorName,
            doctorPhone: visit.doctorPhone,
        
            time: visit.formattedTime,
            period: visit.period,
      onTap: () {
              CalendarScanVisitDetailsDialog
                  .show(
                context: context,
                date: date,
                visit: visit,
              );
            },
          ),
        ),
      ],
    );
  }
}