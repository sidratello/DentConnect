import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class CustomDateField extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final IconData icon;

  const CustomDateField({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedDate,
    required this.onDateSelected,
    this.icon = Icons.calendar_month_outlined,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Theme.of(context).cardColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String text = selectedDate == null
        ? hint
        : DateFormat('dd/MM/yyyy').format(selectedDate!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: FontWeight.w600,
            fontSize: Static.getwidth(context, 14),
          ),
        ),
        SizedBox(
          height: Static.getheight(context, 8),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _pickDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 16),
              vertical: Static.getheight(context, 16),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: Static.getwidth(context, 12),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      color: selectedDate == null
                          ? Colors.grey
                          : AppColors.textPrimary,
                      fontSize: Static.getwidth(context, 14),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
