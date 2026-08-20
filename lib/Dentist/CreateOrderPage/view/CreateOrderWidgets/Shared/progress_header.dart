import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class ProgressHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  Color get activeColor => AppColors.primary;

  Color get inactiveColor => AppColors.border;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _step(
                context,
                title: "معلومات الطلب",
                isActive: currentStep >= 1,
                isCompleted: currentStep > 1,
              ),
            ),
            Container(
              height: 3,
              width: Static.getwidth(context, 60),
              color: currentStep == 2 ? activeColor : inactiveColor,
            ),
            Expanded(
              child: _step(
                context,
                title: "تفاصيل الطلب",
                isActive: currentStep == 2,
                isCompleted: false,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Static.getheight(context, 14),
        ),
        Text(
          "الخطوة $currentStep من $totalSteps",
          style: TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
            color: Colors.grey.shade600,
            fontSize: Static.getwidth(context, 12),
          ),
        ),
      ],
    );
  }

  Widget _step(
    BuildContext context, {
    required String title,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: Static.getwidth(context, 34),
          height: Static.getwidth(context, 34),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeColor : Colors.white,
            border: Border.all(
              color: isActive ? activeColor : inactiveColor,
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )
                : Container(),
          ),
        ),
        SizedBox(
          height: Static.getheight(context, 10),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "IBM Plex Sans Arabic",
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? AppColors.textPrimary : Colors.grey,
            fontSize: Static.getwidth(context, 13),
          ),
        ),
      ],
    );
  }
}
