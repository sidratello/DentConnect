import 'package:flutter/material.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_scan_slots/scan_slot_card.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_text_styles.dart';
import '../../model/scan_slot_model.dart';

class ScanPeriodSection extends StatelessWidget {
  final String title;
  final String period;
  final IconData icon;
  final List<ScanSlotModel> slots;

  final ValueChanged<ScanSlotModel> onEdit;
  final ValueChanged<ScanSlotModel> onDelete;
  final ValueChanged<ScanSlotModel> onBookingDetails;

  const ScanPeriodSection({
    super.key,
    required this.title,
    required this.period,
    required this.icon,
    required this.slots,
    required this.onEdit,
    required this.onDelete,
    required this.onBookingDetails,
  });
@override
Widget build(BuildContext context) {
  return DetailsSectionCard(
    padding: const EdgeInsets.fromLTRB(
      12,
      13,
      12,
      12,
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryBlue,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '$title ($period)',
                style: AppTextStyles
                    .ibmMedium18NeutralStyle
                    .copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          slots.length,
          (index) {
            final slot = slots[index];

            return Padding(
              padding: EdgeInsets.only(
                bottom:
                    index == slots.length - 1 ? 0 : 9,
              ),
              child: ScanSlotCard(
                slot: slot,
                onEdit: () => onEdit(slot),
                onDelete: () => onDelete(slot),
                onBookingDetails: () {
                  onBookingDetails(slot);
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}}