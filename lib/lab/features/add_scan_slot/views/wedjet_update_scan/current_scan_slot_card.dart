import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import '../../model/scan_slot_model.dart';

class CurrentScanSlotCard extends StatelessWidget {
  final ScanSlotModel slot;

  const CurrentScanSlotCard({
    super.key,
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = slot.isBooked
        ? const Color(0xFF7C3AED)
        : AppColors.green;

    final statusBackground = slot.isBooked
        ? const Color(0xFFF3E8FF)
        : AppColors.green.withOpacity(.10);

    final slotDate = slot.date;

    final formattedDate = slotDate == null
        ? 'غير محدد'
        : '${slotDate.year}/'
            '${slotDate.month.toString().padLeft(2, '0')}/'
            '${slotDate.day.toString().padLeft(2, '0')}';

    final formattedTime = slot.timeFormatted.trim().isEmpty
        ? 'غير محدد'
        : slot.timeFormatted;

    final period = slot.period.trim().isEmpty
        ? 'غير محدد'
        : slot.period.toUpperCase();

    return DetailsSectionCard(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
              size: 45,
              color: AppColors.primaryBlue,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'الموعد الحالي',
                      style: AppTextStyles
                          .ibmMedium18NeutralStyle
                          .copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),

                          const SizedBox(width: 5),

                          Text(
                            slot.isBooked ? 'محجوز' : 'متاح',
                            style: AppTextStyles
                                .ibmRegular12DarkStyle
                                .copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  title: 'التاريخ',
                  value: formattedDate,
                ),

                const SizedBox(height: 8),

                _InfoRow(
                  icon: Icons.access_time_rounded,
                  title: 'الوقت',
                  value: formattedTime,
                ),

                const SizedBox(height: 8),

                _InfoRow(
                  icon: period == 'AM'
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round,
                  title: 'الفترة',
                  value: period,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.darkBlue,
        ),

        const SizedBox(width: 7),

        SizedBox(
          width: 55,
          child: Text(
            title,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.normalText,
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}