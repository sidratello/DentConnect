import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_images_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_notes_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_order_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_status_card.dart';
import 'package:template/Dentist/CasesPage/model/case_model.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

class CaseDetailsForDoctorPage extends StatelessWidget {
  final CaseItem? item;

  const CaseDetailsForDoctorPage({
    super.key,
    required this.item,
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
                  patientName: item?.patient?.fullName ?? '',
                  caseNumber: item?.id.toString() ?? '',
                  status: item?.status ?? '',
                  isUrgent: item?.isUrgent ?? false,
                ),
                AppSpacing.height(context, 18),
                CaseImagesCard(
                  images: item?.requiredImages ?? [],
                ),
                AppSpacing.height(context, 18),
                CaseInfoCard(
                  patientName: item?.patient?.fullName ?? '',
                  teethNumbers: item?.orderItems
                          ?.map((item) => item.toothNumbers)
                          .join(', ') ??
                      '',
                  restorationType: item?.orderItems?.first != null
                      ? item!.orderItems!.first.compensationType ?? ''
                      : '',
                  color: item?.shade ?? '',
                  impressionType: item?.impressionType ?? '',
                  hasAccessory: item?.hasAccessories ?? false,
                ),
                AppSpacing.height(context, 18),
                CaseNotesCard(
                  description: item?.title ?? '',
                  notes: item?.notes ?? '',
                ),
                AppSpacing.height(context, 18),
                CaseOrderInfoCard(
                  sentDate: item?.createdAt?.split('T').first ?? '',
                  deliveryDate: item?.deliveryDate?.split('T').first ?? '',
                  price: item?.estimatedPrice == null
                      ? ''
                      : item!.estimatedPrice!.toStringAsFixed(0),
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
