import 'package:flutter/material.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_details_model.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_availabillity_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_description.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_location.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_name_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_phone_number.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_rating_row.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_details_types.dart';
import 'package:template/Dentist/LabDetailsPage/view/LabDetailsPageWidgets/lab_materials_and_specializations.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../../core_dentist/widgets/app_spacing.dart';

class LabDetailsContainer extends StatelessWidget {
  final LabDetailsModel labModel;

  const LabDetailsContainer({super.key, required this.labModel});

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
          LabDetailsDescription(description: labModel.description ?? ''),
          AppSpacing.height(context, 20),
          LabDetailsPhoneNumber(phoneNumber: labModel.phone ?? ''),
          AppSpacing.height(context, 20),
          LabDetailsLocation(address: labModel.address ?? ''),
          AppSpacing.height(context, 20),
          LabDetailsRatingRow(
              yearsOfExperience: labModel.yearsOfExperience != null
                  ? labModel.yearsOfExperience.toString()
                  : '-',
              rating: labModel.ratingSummary!.averageOverall != null
                  ? labModel.ratingSummary!.averageOverall.toString()
                  : '-'),
          AppSpacing.height(context, 20),
          const LabDetailsAvailabillityRow(),
          AppSpacing.height(context, 20),
          const LabMaterialsAndSpecializations(),
          AppSpacing.height(context, 20),
          const LabDetailsTypes(),
        ],
      ),
    );
  }
}
