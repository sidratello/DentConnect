import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/InvoicesPage/controller/invoice_controller.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/empty_invoices.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/invoice_card.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../core_dentist/theme/app_colors.dart';

class PaidInvoicesView extends StatelessWidget {
  final InvoiceController controller;

  const PaidInvoicesView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoadingPaid.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (controller.paidInvoices.isEmpty) {
          return const EmptyInvoices(
            icon: Icons.verified_outlined,
            message: 'لا توجد فواتير مدفوعة',
          );
        }

        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: controller.fetchPaidInvoices,
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(
              Static.getwidth(context, 20),
              4,
              Static.getwidth(context, 20),
              24,
            ),
            itemCount: controller.paidInvoices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final invoice = controller.paidInvoices[index];

              return InvoiceCard(
                invoice: invoice,
              );
            },
          ),
        );
      },
    );
  }
}
