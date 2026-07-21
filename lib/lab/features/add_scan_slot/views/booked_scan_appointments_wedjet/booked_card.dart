

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/add_scan_slot/views/booked_scan_appointments_wedjet/booked_time_chip.dart';


import '../../../../../../core/app_colors.dart';

import '../../model/scan_booking_model.dart';



class BookedAppointmentCard
    extends StatelessWidget {
  final ScanBookingModel booking;
  final VoidCallback onTap;

  const BookedAppointmentCard({
    super.key,
    required this.booking,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(
            0.65,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(
              0.05,
            ),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              const PositionedDirectional(
                top: 0,
                bottom: 0,
                start: 0,
                child: _SideIndicator(),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(
                  18,
                  15,
                  14,
                  14,
                ),
                child: Column(
                  children: [
                    _CardHeader(
                      booking: booking,
                    ),
                    const SizedBox(height: 15),
                    _DentistInformation(
                      booking: booking,
                    ),
                    const SizedBox(height: 14),
                    Divider(
                      height: 1,
                      color: AppColors.littleBlue
                          .withOpacity(0.55),
                    ),
                    const SizedBox(height: 12),
                    _DateAndDetailsAction(
                      date: booking.date,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final ScanBookingModel booking;

  const _CardHeader({
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _BookingStatusBadge(),
        const Spacer(),
        BookedAppointmentTimeChip(
          timeFormatted:
              booking.timeFormatted,
          period: booking.period,
        ),
      ],
    );
  }
}

class _BookingStatusBadge
    extends StatelessWidget {
  const _BookingStatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(
          0.08,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'محجوز',
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.primaryBlue,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _DentistInformation
    extends StatelessWidget {
  final ScanBookingModel booking;

  const _DentistInformation({
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(
              0.08,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.person_outline_rounded,
            color: AppColors.primaryBlue,
            size: 25,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                _safeValue(
                  booking.dentistName,
                ),
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,
                style: AppTextStyles
                    .ibmMedium18NeutralStyle
                    .copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _safeValue(
                  booking.clinicName,
                ),
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color: AppColors.normalText,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _safeValue(
    String? value,
  ) {
    final normalizedValue =
        value?.trim();

    if (normalizedValue == null ||
        normalizedValue.isEmpty) {
      return 'غير متوفر';
    }

    return normalizedValue;
  }
}

class _DateAndDetailsAction
    extends StatelessWidget {
  final DateTime? date;

  const _DateAndDetailsAction({
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(
              0.07,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.primaryBlue,
            size: 17,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            _formatDate(date),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles
                .ibmRegular14NeutralStyle
                .copyWith(
              color: AppColors.darkBlue,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'التفاصيل',
          style: AppTextStyles
              .ibmRegular14NeutralStyle
              .copyWith(
            color: AppColors.primaryBlue,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 4),
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryBlue,
            size: 14,
          ),
        ),
      ],
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return 'غير متوفر';
    }

    return DateFormat(
      'EEEE، d MMMM yyyy',
      'ar',
    ).format(date);
  }
}

class _SideIndicator extends StatelessWidget {
  const _SideIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius:
            BorderRadiusDirectional.only(
          topStart: Radius.circular(18),
          bottomStart: Radius.circular(18),
        ),
      ),
    );
  }
}