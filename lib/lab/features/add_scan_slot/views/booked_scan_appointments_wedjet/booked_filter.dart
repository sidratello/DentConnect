import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_colors.dart';
import '../../controller/booked_scan_appointments_controller.dart';


import '../../../../../../core/app_text_styles.dart';

class BookedAppointmentsFilterBar
    extends GetView<
        BookedScanAppointmentsController> {
  const BookedAppointmentsFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: _FilterChip(
              title: 'جميع المواعيد',
              icon:
                  Icons.format_list_bulleted_rounded,
              selected:
                  controller.selectedFilter.value ==
                      BookedAppointmentsFilter.all,
              onTap: () {
                controller.changeFilter(
                  BookedAppointmentsFilter.all,
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _FilterChip(
              title: 'مواعيد اليوم',
              icon:
                  Icons.today_outlined,
              selected:
                  controller.selectedFilter.value ==
                      BookedAppointmentsFilter.today,
              onTap: () {
                controller.changeFilter(
                  BookedAppointmentsFilter.today,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 200),
      height: 46,
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primaryBlue
            : AppColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: selected
              ? AppColors.primaryBlue
              : AppColors.littleBlue.withOpacity(
                  0.75,
                ),
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColors.primaryBlue.withOpacity(
                    0.16,
                  ),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius:
              BorderRadius.circular(13),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: selected
                      ? AppColors.white
                      : AppColors.primaryBlue,
                ),

                const SizedBox(width: 7),

                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: AppTextStyles
                        .ibmRegular14NeutralStyle
                        .copyWith(
                      color: selected
                          ? AppColors.white
                          : AppColors.darkBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}