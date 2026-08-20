import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class ScanAppointmentCard
    extends StatelessWidget {
  final String doctorName;
  final String doctorPhone;

  final String time;
  final String period;
  final VoidCallback? onTap;

  const ScanAppointmentCard({
    super.key,
    required this.doctorName,
    required this.doctorPhone,
  
    required this.time,
    required this.period,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.littleBlue
                .withOpacity(.7),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue
                  .withOpacity(.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius:
                BorderRadius.circular(18),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              child: Row(
                children: [
                  _CalendarIcon(),

                  const SizedBox(width: 14),

                  Expanded(
                    child: _DoctorInformation(
                      doctorName: doctorName,
                      doctorPhone:
                          doctorPhone,
                  
                    ),
                  ),

                  const SizedBox(width: 10),

                  _AppointmentTime(
                    time: time,
                    period: period,
                  ),

                  const SizedBox(width: 12),

                  const _NavigationArrow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CalendarIcon
    extends StatelessWidget {
  const _CalendarIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.green
            .withOpacity(.08),
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.green,
        size: 28,
      ),
    );
  }
}

class _DoctorInformation
    extends StatelessWidget {
  final String doctorName;
  final String doctorPhone;


  const _DoctorInformation({
    required this.doctorName,
    required this.doctorPhone,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primaryBlue,
              size: 20,
            ),

            const SizedBox(width: 6),

            Expanded(
              child: Text(
                _safeValue(doctorName),
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,
                style: AppTextStyles
                    .ibmMedium18NeutralStyle
                    .copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        Row(
          children: [
            const Icon(
              Icons.phone_outlined,
              color: AppColors.normalText,
              size: 18,
            ),

            const SizedBox(width: 6),

            Expanded(
              child: Text(
                _safeValue(doctorPhone),
                maxLines: 1,
             
                textDirection:
                    ui.TextDirection.ltr,
                textAlign: TextAlign.right,
                style: AppTextStyles
                    .ibmRegular14NeutralStyle
                    .copyWith(
                  color:
                      AppColors.normalText,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),

  
      ],
    );
  }

  String _safeValue(String value) {
    final normalizedValue =
        value.trim();

    return normalizedValue.isEmpty
        ? 'غير متوفر'
        : normalizedValue;
  }
}

class _AppointmentTime
    extends StatelessWidget {
  final String time;
  final String period;

  const _AppointmentTime({
    required this.time,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _safeTime(time),
            style: AppTextStyles
                .ibmMedium18NeutralStyle
                .copyWith(
              color: AppColors.darkBlue,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(width: 7),

          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.green
                  .withOpacity(.12),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Text(
              period.toUpperCase(),
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.green,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _safeTime(String value) {
    final normalizedValue =
        value.trim();

    return normalizedValue.isEmpty
        ? '--:--'
        : normalizedValue;
  }
}

class _NavigationArrow
    extends StatelessWidget {
  const _NavigationArrow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue
            .withOpacity(.05),
        shape: BoxShape.circle,
      ),
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.darkBlue,
          size: 17,
        ),
      ),
    );
  }
}