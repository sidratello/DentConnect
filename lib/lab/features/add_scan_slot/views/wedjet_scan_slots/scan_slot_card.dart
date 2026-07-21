import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../model/scan_slot_model.dart';

class ScanSlotCard extends StatelessWidget {
  final ScanSlotModel slot;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onBookingDetails;

  const ScanSlotCard({
    super.key,
    required this.slot,
    required this.onEdit,
    required this.onDelete,
    required this.onBookingDetails,
  });

  @override
  Widget build(BuildContext context) {
    final booked = slot.isBooked;

    final statusColor = booked
        ? const Color(0xFF7C3AED)
        : AppColors.green;

    final statusBackground = booked
        ? const Color(0xFFF3E8FF)
        : AppColors.green.withOpacity(0.10);

    return Container(
      constraints: const BoxConstraints(
        minHeight: 105,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.grey200,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 13,
                ),
                child: Row(
                  children: [
                    _TimeSection(slot: slot),

                

                    Expanded(
                      child: _StatusSection(
                        booked: booked,
                        statusColor: statusColor,
                        statusBackground:
                            statusBackground,
                      ),
                    ),

                    const SizedBox(width: 8),

                    _ActionsSection(
                      booked: booked,
                      onEdit: onEdit,
                      onDelete: onDelete,
                      onBookingDetails:
                          onBookingDetails,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSection extends StatelessWidget {
  final ScanSlotModel slot;

  const _TimeSection({
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    final onlyTime = _extractTime(
      slot.timeFormatted,
    );

    return SizedBox(
      width: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            onlyTime,
            textDirection: TextDirection.ltr,
            style:
                AppTextStyles.ibmBold22NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontSize: 24,
              height: 1,
            ),
          ),
     
    
 
  
        ],
      ),
    );
  }

  String _extractTime(String value) {
    final match = RegExp(
      r'\d{1,2}:\d{2}',
    ).firstMatch(value);

    return match?.group(0) ?? value;
  }
}

class _StatusSection extends StatelessWidget {
  final bool booked;
  final Color statusColor;
  final Color statusBackground;

  const _StatusSection({
    required this.booked,
    required this.statusColor,
    required this.statusBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: statusBackground,
            borderRadius: BorderRadius.circular(8),
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
                booked ? 'محجوز' : 'متاح',
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
        const SizedBox(height: 5),
        Text(
          booked
              ? 'تم حجز هذا الموعد'
              : 'الموعد متاح للحجز',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              AppTextStyles.ibmRegular12DarkStyle.copyWith(
            color: AppColors.normalText,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _ActionsSection extends StatelessWidget {
  final bool booked;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onBookingDetails;

  const _ActionsSection({
    required this.booked,
    required this.onEdit,
    required this.onDelete,
    required this.onBookingDetails,
  });

  @override
  Widget build(BuildContext context) {
    if (booked) {
      return SizedBox(
        width: 105,
        child: AppButton(
          title: 'عرض الحجز',
          type: AppButtonType.outlined,
          height: 39,
          borderRadius: 10,
          borderColor: const Color(0xFF8B5CF6),
          textColor: const Color(0xFF7C3AED),
          backgroundColor:
              const Color(0xFFF8F5FF),
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.visibility_outlined,
            size: 17,
            color: Color(0xFF7C3AED),
          ),
          textStyle: AppTextStyles
              .ibmRegular12DarkStyle
              .copyWith(
            color: const Color(0xFF7C3AED),
            fontWeight: FontWeight.w700,
          ),
          onTap: onBookingDetails,
        ),
      );
    }

    return SizedBox(
      width: 116,
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              title: 'حذف',
              type: AppButtonType.outlined,
              height: 39,
              borderRadius: 9,
              borderColor:
                  AppColors.lightRed.withOpacity(0.65),
              textColor: AppColors.lightRed,
              padding: EdgeInsets.zero,
      
              textStyle: AppTextStyles
                  .ibmRegular12DarkStyle
                  .copyWith(
                color: AppColors.lightRed,
                fontWeight: FontWeight.w700,
              ),
              onTap: onDelete,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: AppButton(
              title: 'تعديل',
              type: AppButtonType.outlined,
              height: 39,
              borderRadius: 9,
              borderColor: AppColors.primaryBlue,
              textColor: AppColors.primaryBlue,
              padding: EdgeInsets.zero,
     
              textStyle: AppTextStyles
                  .ibmRegular12DarkStyle
                  .copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w700,
              ),
              onTap: onEdit,
            ),
          ),
        ],
      ),
    );
  }
}