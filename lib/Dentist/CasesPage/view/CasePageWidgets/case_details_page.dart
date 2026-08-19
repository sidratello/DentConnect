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

class CaseDetailsForDoctorPage extends StatefulWidget {
  final CaseItem? item;

  const CaseDetailsForDoctorPage({
    super.key,
    required this.item,
  });

  @override
  State<CaseDetailsForDoctorPage> createState() =>
      _CaseDetailsForDoctorPageState();
}

class _CaseDetailsForDoctorPageState extends State<CaseDetailsForDoctorPage> {
  late final TextEditingController clarificationController;

  @override
  void initState() {
    super.initState();

    clarificationController = TextEditingController();
  }

  @override
  void dispose() {
    clarificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CaseItem? item = widget.item;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,

      // ==========================================================
      // APP BAR
      // ==========================================================

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
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 16),
            ),
            child: Column(
              children: [
                AppSpacing.height(context, 24),

                // ==================================================
                // CASE STATUS
                // ==================================================

                CaseStatusCard(
                  patientName: item?.patient?.fullName ?? '',
                  caseNumber: item?.id?.toString() ?? '',
                  status: item?.status ?? '',
                  isUrgent: item?.isUrgent ?? false,
                ),

                AppSpacing.height(context, 18),

                // ==================================================
                // CASE IMAGES
                // ==================================================

                CaseImagesCard(
                  images: item?.requiredImages ?? [],
                ),

                AppSpacing.height(context, 18),

                // ==================================================
                // CASE INFO
                // ==================================================

                CaseInfoCard(
                  patientName: item?.patient?.fullName ?? '',
                  teethNumbers: item?.orderItems
                          ?.map(
                            (orderItem) => orderItem.toothNumbers,
                          )
                          .join(', ') ??
                      '',
                  restorationType: item?.orderItems?.isNotEmpty == true
                      ? item!.orderItems!.first.compensationType ?? ''
                      : '',
                  color: item?.shade ?? '',
                  impressionType: item?.impressionType ?? '',
                  hasAccessory: item?.hasAccessories ?? false,
                ),

                AppSpacing.height(context, 18),

                // ==================================================
                // NOTES
                // ==================================================

                CaseNotesCard(
                  description: item?.title ?? '',
                  notes: item?.notes ?? '',
                ),

                AppSpacing.height(context, 18),

                // ==================================================
                // ORDER INFO
                // ==================================================

                CaseOrderInfoCard(
                  sentDate: item?.createdAt?.split('T').first ?? '',
                  deliveryDate: item?.deliveryDate?.split('T').first ?? '',
                  price: item?.estimatedPrice == null
                      ? ''
                      : item!.estimatedPrice!.toStringAsFixed(0),
                ),

                // ==================================================
                // REQUEST INFO
                // ==================================================

                if (item?.status == 'RequestInfo') ...[
                  AppSpacing.height(context, 18),
                  _buildRequestInfoSection(context),
                ],

                // ==================================================
                // PAYMENT
                // ==================================================

                if (item?.status == 'Ready') ...[
                  AppSpacing.height(context, 18),
                  _buildPaymentButton(context),
                ],

                AppSpacing.height(context, 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // REQUEST INFO SECTION
  // ==============================================================

  Widget _buildRequestInfoSection(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------------
          // Header
          // --------------------------------------------------------

          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
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
                    const SizedBox(height: 4),
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

          const SizedBox(height: 18),

          // --------------------------------------------------------
          // Text Field
          // --------------------------------------------------------

          TextField(
            controller: clarificationController,
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
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(
                    alpha: 0.12,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.4,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // --------------------------------------------------------
          // Send Button
          // --------------------------------------------------------

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _sendClarification,
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
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // PAYMENT BUTTON
  // ==============================================================

  Widget _buildPaymentButton(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 16),
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
            offset: const Offset(0, 4),
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
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
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
                    SizedBox(height: 4),
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
          const SizedBox(height: 14),
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
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // SEND CLARIFICATION
  // ==============================================================

  void _sendClarification() {
    final String text = clarificationController.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى كتابة المعلومات المطلوبة أولاً',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
            ),
          ),
        ),
      );

      return;
    }

    // TODO:
    // استدعاء API إرسال المعلومات للمخبر
    //
    // مثال:
    //
    // controller.sendClarification(
    //   widget.item!.id!,
    //   text,
    // );

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم إرسال المعلومات بنجاح',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // GO TO PAYMENT
  // ==============================================================

  void _goToPayment() {
    // Get.toNamed(
    //   AppRouter.paymentPage,
    //   arguments: widget.item,
    // );
  }
}
