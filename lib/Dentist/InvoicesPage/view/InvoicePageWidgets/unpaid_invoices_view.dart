import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/InvoicesPage/controller/invoice_controller.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/empty_invoices.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/invoice_card.dart';

import 'package:template/core_dentist/utils/static.dart';
import '../../../../core_dentist/theme/app_colors.dart';

class UnpaidInvoicesView extends StatelessWidget {
  final InvoiceController controller;

  const UnpaidInvoicesView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoadingUnpaid.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (controller.unpaidInvoices.isEmpty) {
          return const EmptyInvoices(
            icon: Icons.receipt_long_outlined,
            message: 'لا توجد فواتير غير مدفوعة',
          );
        }

        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: controller.fetchUnpaidInvoices,
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(
              Static.getwidth(
                context,
                20,
              ),
              4,
              Static.getwidth(
                context,
                20,
              ),
              24,
            ),
            itemCount: controller.unpaidInvoices.length,
            separatorBuilder: (
              _,
              __,
            ) =>
                const SizedBox(
              height: 14,
            ),
            itemBuilder: (
              context,
              index,
            ) {
              final invoice = controller.unpaidInvoices[index];

              return InvoiceCard(
                invoice: invoice,
                onPay: () {
                  final orderId = invoice.id;

                  if (orderId == null) {
                    Get.snackbar(
                      'خطأ',
                      'معرف الطلبية غير موجود',
                      snackPosition: SnackPosition.BOTTOM,
                    );

                    return;
                  }

                  controller.payInvoice(
                    orderId,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
