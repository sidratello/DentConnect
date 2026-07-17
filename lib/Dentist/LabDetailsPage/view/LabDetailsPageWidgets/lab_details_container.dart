import 'package:flutter/material.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_availabillity_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_description.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_location.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_name_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_phone_number.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_rating_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_types.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../../../core/widgets/app_spacing.dart';

class LabDetailsContainer extends StatelessWidget {
  const LabDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: Static.getheight(context, 28),
        right: Static.getwidth(context, 24),
        left: Static.getwidth(context, 24),
        bottom: Static.getheight(context, 40),
      ),
      decoration: const BoxDecoration(
        color: AppColors.boxGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabDetailsNameRow(),
          AppSpacing.height(context, 14),
          const LabDetailsDescription(),
          AppSpacing.height(context, 20),
          const LabDetailsPhoneNumber(),
          AppSpacing.height(context, 20),
          const LabDetailsLocation(),
          AppSpacing.height(context, 20),
          const LabDetailsRatingRow(),
          AppSpacing.height(context, 20),
          const LabDetailsAvailabillityRow(),
          AppSpacing.height(context, 20),
          const LabDetailsTypes(),
        ],
      ),
    );
  }
}
