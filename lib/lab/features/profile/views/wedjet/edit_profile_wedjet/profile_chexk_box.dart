import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

class ProfileCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  const ProfileCheckBox({
    required this.title,
      required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          width: 22.w,
          height: 22.h,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
             fillColor: WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryBlue;
      }
      return AppColors.white;
    },
  ),
          ),
        ),
        SizedBox(width: 4.w),
        Text(title),
      ],
    );
  }
}



class RadioItem extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const RadioItem({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
           fillColor: WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryBlue;
      }
      return AppColors.black54;
    },
  ),
        ),
        Text(title),
      ],
    );
  }
 }
// class SwitchRow extends StatelessWidget {
//   final String title;
//   final bool value;
//   final bool readOnly;
//   final ValueChanged<bool>? onChanged;

//   const SwitchRow({
//     super.key,
//     required this.title,
//     required this.value,
//     this.readOnly = false,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           title,
//           style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
//             fontWeight: FontWeight.w700,
//           ),
//         ),

//         SizedBox(width: 70.w),

//         AbsorbPointer(
//           absorbing: readOnly,
//           child: Switch(
//             value: value,
//             onChanged: onChanged ?? (_) {},
//             trackColor: WidgetStateProperty.resolveWith(
//   (states) {
//     if (states.contains(WidgetState.selected)) {
//       return AppColors.primaryBlue;
//     }
//     return const Color.fromARGB(255, 231, 223, 223);
//   },
// ),
//           ),
//         ),
//       ],
//     );
//   }
// }
class SwitchRow extends StatelessWidget {
  final String title;
  final bool value;
  final bool readOnly;
  final ValueChanged<bool>? onChanged;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  const SwitchRow({
    super.key,
    required this.title,
    required this.value,
    this.readOnly = false,
    this.onChanged,
        this.activeTrackColor,
    this.inactiveTrackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        AbsorbPointer(
          absorbing: readOnly,
          child: Switch(
            value: value,
            onChanged: onChanged ?? (_) {},
               activeColor: AppColors.white,

            // default color
            activeTrackColor:
                activeTrackColor ?? AppColors.primaryBlue,

            inactiveThumbColor: AppColors.white,

            inactiveTrackColor:
                inactiveTrackColor ?? AppColors.grey400,
          ),
        ),
      ],
    );
  }
}