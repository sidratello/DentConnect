import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../model/invoice_model.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onPay;

  const InvoiceCard({
    super.key,
    required this.invoice,
    this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPaid = invoice.isPaid ?? false;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isPaid
              ? Colors.green.withValues(alpha: .15)
              : Colors.orange.withValues(alpha: .18),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(
              alpha: .04,
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
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: isPaid
                      ? Colors.green.withValues(alpha: .08)
                      : Colors.orange.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  isPaid
                      ? Icons.receipt_long_rounded
                      : Icons.receipt_long_outlined,
                  color: isPaid ? Colors.green : Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoice.title ?? 'فاتورة بدون عنوان',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'رقم الطلب #${invoice.id ?? '-'}',
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(
                isPaid: isPaid,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.business_outlined,
            title: 'المخبر',
            value: invoice.labName ?? 'غير محدد',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: Icons.person_outline,
            title: 'الطبيب',
            value: invoice.dentistName ?? 'غير محدد',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: Icons.medical_services_outlined,
            title: 'التعويضات',
            value: invoice.items == null || invoice.items!.isEmpty
                ? 'لا توجد'
                : invoice.items!.join(' • '),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: .05,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.payments_outlined,
                  color: AppColors.primary,
                  size: 21,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'المبلغ النهائي',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '${invoice.finalPrice?.toStringAsFixed(0) ?? '0'}',
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          if (isPaid && invoice.paidAt != null) ...[
            const SizedBox(height: 10),
            _InfoRow(
              icon: Icons.check_circle_outline,
              title: 'تاريخ الدفع',
              value: _formatDate(
                invoice.paidAt!,
              ),
            ),
          ],
          if (!isPaid) ...[
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: onPay,
                icon: const Icon(
                  Icons.payment_rounded,
                  size: 19,
                ),
                label: const Text(
                  'الدفع الآن',
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
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String _formatDate(String date) {
    final parsed = DateTime.tryParse(date);

    if (parsed == null) {
      return date;
    }

    return '${parsed.day.toString().padLeft(2, '0')}/'
        '${parsed.month.toString().padLeft(2, '0')}/'
        '${parsed.year}';
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isPaid;

  const _StatusBadge({
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isPaid
            ? Colors.green.withValues(alpha: .08)
            : Colors.orange.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        isPaid ? 'مدفوعة' : 'غير مدفوعة',
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: isPaid ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Text(
          '$title: ',
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
