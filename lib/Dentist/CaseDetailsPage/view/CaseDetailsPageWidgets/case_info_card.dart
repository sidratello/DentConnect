import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/info_row.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/Dentist/CasesPage/model/case_model.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

class CaseInfoCard extends StatelessWidget {
  final String patientName;
  final List<Items> orderItems;
  final String color;
  final String impressionType;
  final bool hasAccessory;

  const CaseInfoCard({
    super.key,
    required this.patientName,
    required this.orderItems,
    required this.color,
    required this.impressionType,
    required this.hasAccessory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(context, 20),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const SectionTitle(
            icon: Icons.medical_information_outlined,
            title: 'معلومات الحالة',
          ),

          AppSpacing.height(
            context,
            18,
          ),

          // --------------------------------------------------
          // Patient
          // --------------------------------------------------

          InfoRow(
            icon: Icons.person_outline,
            title: 'اسم المريض',
            value: patientName,
          ),

          const Divider(),

          // --------------------------------------------------
          // Compensation Items
          // --------------------------------------------------

          _buildOrderItems(context),

          const Divider(),

          // --------------------------------------------------
          // Color
          // --------------------------------------------------

          InfoRow(
            icon: Icons.palette_outlined,
            title: 'اللون',
            value: color,
          ),

          const Divider(),

          // --------------------------------------------------
          // Impression Type
          // --------------------------------------------------

          InfoRow(
            icon: Icons.qr_code_scanner_rounded,
            title: 'نوع الطبعة',
            value: impressionType,
          ),

          const Divider(),

          // --------------------------------------------------
          // Accessories
          // --------------------------------------------------

          InfoRow(
            icon: Icons.extension_outlined,
            title: 'يوجد إكسسوار',
            value: hasAccessory ? 'نعم' : 'لا',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Order Items
  // ============================================================

  Widget _buildOrderItems(
    BuildContext context,
  ) {
    if (orderItems.isEmpty) {
      return const InfoRow(
        icon: Icons.medical_services_outlined,
        title: 'التعويضات',
        value: 'لا يوجد',
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.medical_services_outlined,
                color: AppColors.primary,
                size: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'التعويضات',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ...orderItems.asMap().entries.map(
            (entry) {
              final int index = entry.key;
              final Items orderItem = entry.value;

              return _buildOrderItem(
                context,
                orderItem,
                index,
              );
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Single Order Item
  // ============================================================

  Widget _buildOrderItem(
    BuildContext context,
    Items orderItem,
    int index,
  ) {
    final String compensationType = orderItem.compensationType ?? 'غير محدد';

    final List<int> teeth = orderItem.toothNumbers ?? [];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(
        12,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: .05,
        ),
        borderRadius: BorderRadius.circular(
          14,
        ),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: .12,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------
          // Compensation Name
          // --------------------------------------------------

          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: .10,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  compensationType,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),

          // --------------------------------------------------
          // Teeth
          // --------------------------------------------------

          if (teeth.isNotEmpty) ...[
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.grid_view_rounded,
                  size: 17,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'الأسنان',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: teeth.map(
                (tooth) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primary.withValues(
                          alpha: .15,
                        ),
                      ),
                    ),
                    child: Text(
                      tooth.toString(),
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
