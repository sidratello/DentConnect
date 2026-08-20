import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_images_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_notes_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_order_info_card.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/case_status_card.dart';
import 'package:template/Dentist/CasesPage/controller/case_controller.dart';
import 'package:template/Dentist/CasesPage/model/case_model.dart';
import 'package:template/Dentist/CasesPage/view/CasePageWidgets/case_info_card_cases.dart';

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
    final controller = Get.find<CaseController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,

      // --------------------------------------------------
      // App Bar
      // --------------------------------------------------

      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        elevation: 0,
        surfaceTintColor: AppColors.surfaceTintColor,
        automaticallyImplyLeading: false,
        actions: const [
          AppbarVectorBlack(),
        ],
        title: Center(
          child: Text(
            'تفاصيل الحالة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(
                context,
                22,
              ),
            ),
          ),
        ),
      ),

      // --------------------------------------------------
      // Body
      // --------------------------------------------------

      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(
                context,
                16,
              ),
            ),
            child: Column(
              children: [
                AppSpacing.height(
                  context,
                  24,
                ),

                // --------------------------------------------------
                // Status
                // --------------------------------------------------

                CaseStatusCard(
                  patientName: item?.patient?.fullName ?? '',
                  caseNumber: item?.id?.toString() ?? '',
                  status: item?.status ?? '',
                  isUrgent: item?.isUrgent ?? false,
                ),

                AppSpacing.height(
                  context,
                  18,
                ),

                // --------------------------------------------------
                // Images
                // --------------------------------------------------

                CaseImagesCard(
                  images: item?.requiredImages ?? [],
                ),

                AppSpacing.height(
                  context,
                  18,
                ),

                // --------------------------------------------------
                // Case Information
                // --------------------------------------------------

                CaseInfoCard(
                  patientName: item?.patient?.fullName ?? '',
                  orderItems: item?.orderItems ?? [],
                  color: item?.shade ?? '',
                  impressionType: item?.impressionType ?? '',
                  hasAccessory: item?.hasAccessories ?? false,
                ),

                AppSpacing.height(
                  context,
                  18,
                ),

                // --------------------------------------------------
                // Notes
                // --------------------------------------------------

                CaseNotesCard(
                  description: item?.title ?? '',
                  notes: item?.notes ?? '',
                ),

                AppSpacing.height(
                  context,
                  18,
                ),

                // --------------------------------------------------
                // Order Information
                // --------------------------------------------------

                CaseOrderInfoCard(
                  sentDate: item?.createdAt?.split('T').first ?? '',
                  deliveryDate: item?.deliveryDate?.split('T').first ?? '',
                  price: item?.estimatedPrice == null
                      ? ''
                      : item!.estimatedPrice!.toStringAsFixed(0),
                ),

                // --------------------------------------------------
                // Request Info
                // --------------------------------------------------

                if (item?.status == 'RequestInfo') ...[
                  AppSpacing.height(
                    context,
                    18,
                  ),
                  _buildRequestInfoSection(
                    context,
                    controller,
                  ),
                ],

                // --------------------------------------------------
                // Ready / Payment
                // --------------------------------------------------

                if (item?.status == 'Ready') ...[
                  AppSpacing.height(
                    context,
                    18,
                  ),
                  _buildPaymentButton(
                    context,
                  ),
                ],

                AppSpacing.height(
                  context,
                  30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Request Info
  // ============================================================

  Widget _buildRequestInfoSection(
    BuildContext context,
    CaseController controller,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          18,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: 0.15,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 12,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius: BorderRadius.circular(
                    13,
                  ),
                ),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مطلوب معلومات إضافية',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'يرجى إضافة المعلومات المطلوبة لإرسالها إلى المخبر',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 18,
          ),

          // Text Field
          TextField(
            onChanged: controller.setClarificationText,
            minLines: 4,
            maxLines: 6,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: 'اكتب المعلومات أو التوضيحات المطلوبة...',
              hintStyle: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: const Color(0xffF8FAFC),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  14,
                ),
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(
                    alpha: 0.12,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  14,
                ),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.4,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 14,
          ),

          // Send Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: controller.clarificationText.value.trim().isEmpty
                    ? null
                    : () => _sendClarification(
                          controller,
                          item?.id,
                        ),
                icon: const Icon(
                  Icons.send_rounded,
                  size: 19,
                ),
                label: const Text(
                  'إرسال المعلومات',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withValues(
                    alpha: .3,
                  ),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white70,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Payment
  // ============================================================

  Widget _buildPaymentButton(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          16,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: 0.15,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 12,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius: BorderRadius.circular(
                    13,
                  ),
                ),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الحالة جاهزة',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'يمكنك الآن الانتقال إلى الدفع',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _goToPayment,
              icon: const Icon(
                Icons.payment_rounded,
                size: 20,
              ),
              label: const Text(
                'الانتقال إلى الدفع',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Send Clarification
  // ============================================================

  Future<void> _sendClarification(
    CaseController controller,
    int? orderId,
  ) async {
    if (orderId == null) {
      Get.snackbar(
        'خطأ',
        'تعذر تحديد رقم الحالة',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final String text = controller.clarificationText.value.trim();

    if (text.isEmpty) {
      Get.snackbar(
        'تنبيه',
        'يرجى كتابة المعلومات المطلوبة أولاً',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final bool success = await controller.createNotes(
      orderId,
      text: text,
    );

    if (success) {
      controller.clarificationText.value = '';

      await controller.fetchCases();

      Get.back();
    }
  }

  // ============================================================
  // Payment Navigation
  // ============================================================

  void _goToPayment() {
    // ضعي هنا واجهة الدفع لاحقاً
    //
    // Get.to(
    //   () => PaymentPage(
    //     orderId: item?.id,
    //   ),
    // );
  }
}
