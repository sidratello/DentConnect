import 'package:flutter/material.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../model/patient_model.dart';

class PatientCard extends StatelessWidget {
  final PatientModel patient;
  final VoidCallback onTap;

  const PatientCard({
    super.key,
    required this.patient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          Static.getwidth(context, 16),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'assets/images/patient.jpg',
                width: Static.getwidth(context, 70),
                height: Static.getwidth(context, 70),
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.width(context, 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.fullName ?? 'لا يوجد اسم',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w800,
                      fontSize: Static.getwidth(context, 17),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  AppSpacing.height(context, 6),
                  Text(
                    patient.clinicalNotes ?? 'لا يوجد ملاحظات',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(context, 13),
                      height: 21 / 13,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: Static.getwidth(context, 18),
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
