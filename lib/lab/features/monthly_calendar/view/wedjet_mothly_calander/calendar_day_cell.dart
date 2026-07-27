import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/monthly_calendar/model/monthly_calendar_model.dart';

class CalendarDayCell
    extends StatelessWidget {
  final DateTime date;
  final CalendarDayModel? day;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  const CalendarDayCell({
    super.key,
    required this.date,
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(50),
        child: SizedBox(
          height: 67,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 180,
                ),
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppColors.primaryBlue
                      : Colors.transparent,
                  border: isToday &&
                          !isSelected
                      ? Border.all(
                          color: AppColors
                              .primaryBlue,
                        )
                      : null,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors
                                .primaryBlue
                                .withOpacity(.25),
                            blurRadius: 8,
                            offset:
                                const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  date.day.toString(),
                  style: AppTextStyles
                      .ibmRegular14NeutralStyle
                      .copyWith(
                    color: isSelected
                        ? AppColors.white
                        : AppColors.darkBlue,
                    fontWeight:
                        FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              _buildCounts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounts() {
    final ordersCount =
        day?.ordersCount ?? 0;

    final scanCount =
        day?.scanVisitsCount ?? 0;

    if (ordersCount == 0 &&
        scanCount == 0) {
      return const SizedBox(
        height: 18,
      );
    }

    return SizedBox(
      height: 18,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          if (ordersCount > 0)
            _CountBadge(
              count: ordersCount,
              foregroundColor:
                  AppColors.primaryBlue,
              backgroundColor:
                  AppColors.littleBlue,
            ),
          if (ordersCount > 0 &&
              scanCount > 0)
            const SizedBox(width: 3),
          if (scanCount > 0)
            _CountBadge(
              count: scanCount,
              foregroundColor:
                  AppColors.green,
              backgroundColor:
                  AppColors.green
                      .withOpacity(.16),
            ),
        ],
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  final int count;
  final Color foregroundColor;
  final Color backgroundColor;

  const _CountBadge({
    required this.count,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 17,
      ),
      height: 17,
      alignment: Alignment.center,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          fontFamily:
              'IBM Plex Sans Arabic',
          color: foregroundColor,
          fontSize: 10,
          height: 1,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}