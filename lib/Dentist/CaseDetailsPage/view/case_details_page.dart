import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_images_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_notes_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_order_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_status_card.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

class CaseDetailsPage extends StatelessWidget {
  final CaseDetailsModel details;

  const CaseDetailsPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        elevation: 0,
        surfaceTintColor: AppColors.surfaceTintColor,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
        title: Center(
          child: Text(
            'تفاصيل الحالة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacing.height(context, 24),
                CaseStatusCard(
                  patientName: details.patientName,
                  caseNumber: details.caseNumber,
                  status: details.status,
                  isUrgent: details.isUrgent,
                ),
                AppSpacing.height(context, 18),
                CaseImagesCard(
                  images: details.images,
                ),
                AppSpacing.height(context, 18),
                CaseInfoCard(
                  patientName: details.patientName,
                  teethNumbers: details.teethNumbers,
                  restorationType: details.restorationType,
                  color: details.color,
                  impressionType: details.impressionType,
                  hasAccessory: details.hasAccessory,
                  templateName: details.hasTemplate ? details.templateName : '',
                ),
                AppSpacing.height(context, 18),
                CaseNotesCard(
                  description: details.shortDescription,
                  notes: details.notes,
                ),
                AppSpacing.height(context, 18),
                CaseOrderInfoCard(
                  sentDate: details.sentDate,
                  deliveryDate: details.deliveryDate,
                  rating: details.doctorRating,
                  price: details.price == null
                      ? ''
                      : details.price!.toStringAsFixed(0),
                ),
                AppSpacing.height(context, 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
