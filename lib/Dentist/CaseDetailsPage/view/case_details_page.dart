import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_images_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_notes_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_order_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_status_card.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

class CaseDetailsPage extends StatelessWidget {
  final Orders? orders;

  const CaseDetailsPage({
    super.key,
    required this.orders,
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
                  patientName: orders?.patientName ?? '',
                  caseNumber: orders?.id.toString() ?? '',
                  status: orders?.status ?? '',
                  isUrgent: orders?.isUrgent ?? false,
                ),
                AppSpacing.height(context, 18),
                CaseImagesCard(
                  images: orders?.requiredImages ?? [],
                ),
                AppSpacing.height(context, 18),
                CaseInfoCard(
                  patientName: orders?.patientName ?? '',
                  orderItems: orders?.items ?? [],
                  color: orders?.shade ?? '',
                  impressionType: orders?.impressionType ?? '',
                  hasAccessory: orders?.hasAccessories ?? false,
                ),
                AppSpacing.height(context, 18),
                CaseNotesCard(
                  description: orders?.title ?? '',
                  notes: orders?.notes ?? '',
                ),
                AppSpacing.height(context, 18),
                CaseOrderInfoCard(
                  sentDate: orders?.createdAt?.split('T').first ?? '',
                  deliveryDate: orders?.deliveryDate?.split('T').first ?? '',
                  price: orders?.estimatedPrice == null
                      ? ''
                      : orders!.estimatedPrice!.toStringAsFixed(0),
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
