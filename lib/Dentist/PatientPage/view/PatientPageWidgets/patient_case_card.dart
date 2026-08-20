import 'package:flutter/material.dart';
import 'package:template/Dentist/PatientPage/model/cases_patient_model.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/info_item.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/status_badge.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class PatientCaseCard extends StatelessWidget {
  final Data caseItem;

  const PatientCaseCard({
    super.key,
    required this.caseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 14),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  caseItem.title ?? 'حالة بدون عنوان',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(context, 15),
                  ),
                ),
              ),
              SizedBox(
                width: Static.getwidth(context, 8),
              ),
              StatusBadge(
                status: caseItem.status ?? '',
              ),
            ],
          ),
          SizedBox(
            height: Static.getheight(context, 12),
          ),
          const Divider(height: 1),
          SizedBox(
            height: Static.getheight(context, 12),
          ),
          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.calendar_today_outlined,
                  title: 'تاريخ الطلب',
                  value: _formatDate(
                    caseItem.createdAt,
                  ),
                ),
              ),
              Expanded(
                child: InfoItem(
                  icon: Icons.event_available_outlined,
                  title: 'موعد التسليم',
                  value: _formatDate(
                    caseItem.deliveryDate,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Static.getheight(context, 12),
          ),
          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.business_outlined,
                  title: 'المخبر',
                  value: caseItem.labName ?? 'غير محدد',
                ),
              ),
              Expanded(
                child: InfoItem(
                  icon: Icons.payments_outlined,
                  title: 'السعر النهائي',
                  value: _formatPrice(
                    caseItem.finalPrice,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Static.getheight(context, 12),
          ),
          Row(
            children: [
              Expanded(
                child: InfoItem(
                  icon: Icons.layers_outlined,
                  title: 'نوع الطبعة',
                  value: _formatImpression(
                    caseItem.impressionType,
                  ),
                ),
              ),
              Expanded(
                child: InfoItem(
                  icon: Icons.palette_outlined,
                  title: 'اللون',
                  value: caseItem.shade ?? 'غير محدد',
                ),
              ),
            ],
          ),
          if (caseItem.isUrgent == true) ...[
            SizedBox(
              height: Static.getheight(context, 12),
            ),
            _buildUrgentBadge(context),
          ],
          if (caseItem.isTemporary == true) ...[
            SizedBox(
              height: Static.getheight(context, 8),
            ),
            _buildTemporaryBadge(context),
          ],
        ],
      ),
    );
  }

  Widget _buildUrgentBadge(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(
          context,
          7,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(
          alpha: 0.08,
        ),
        borderRadius: BorderRadius.circular(
          9,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.priority_high_rounded,
            color: AppColors.error,
            size: Static.getwidth(
              context,
              16,
            ),
          ),
          SizedBox(
            width: Static.getwidth(
              context,
              4,
            ),
          ),
          Text(
            'حالة مستعجلة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                11,
              ),
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemporaryBadge(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(
          context,
          7,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.08,
        ),
        borderRadius: BorderRadius.circular(
          9,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_outlined,
            color: AppColors.primary,
            size: Static.getwidth(
              context,
              16,
            ),
          ),
          SizedBox(
            width: Static.getwidth(
              context,
              4,
            ),
          ),
          Text(
            'تعويض مؤقت',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                11,
              ),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(
    String? date,
  ) {
    if (date == null || date.isEmpty) {
      return 'غير محدد';
    }
    return date.split('T').first;
  }

  static String _formatPrice(
    double? price,
  ) {
    if (price == null) {
      return 'غير محدد';
    }
    if (price == 0) {
      return '0';
    }
    return price.toStringAsFixed(0);
  }

  static String _formatImpression(
    String? impression,
  ) {
    switch (impression) {
      case 'Traditional':
        return 'تقليدية';

      case 'Digital':
        return 'رقمية';

      default:
        return impression ?? 'غير محدد';
    }
  }
}
