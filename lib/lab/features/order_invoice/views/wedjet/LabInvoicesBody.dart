import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/order_invoice/views/wedjet/AdInvoiceCard.dart';
import 'package:template/lab/features/order_invoice/views/wedjet/lab_invoices_header.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core/widgets/EmptyStateCard.dart';
import '../../controller/lab_invoices_controller.dart';

import 'order_invoice_card.dart';

import 'package:template/lab/features/order_invoice/views/wedjet/lab_invoices_tabs.dart';


class LabInvoicesBody
    extends StatelessWidget {
  const LabInvoicesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<
            LabInvoicesController>();

    return RefreshIndicator(
      onRefresh:
          controller.refreshInvoices,
      child: ListView(
        physics:
            const AlwaysScrollableScrollPhysics(),
        padding:
            const EdgeInsets.only(
          bottom: 30,
        ),
        children: [
          const LabInvoicesHeader(),

          const Padding(
            padding:
                EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child:
                LabInvoicesTabs(),
          ),

          const SizedBox(
            height: 16,
          ),

          Obx(
            () {
              if (controller
                  .isLoading.value) {
                return const Padding(
                  padding:
                      EdgeInsets.only(
                    top: 100,
                  ),
                  child:
                      AppLoadingIndicator(
                    size: 32,
                  ),
                );
              }

              if (controller
                  .isOrdersTab) {
                return _buildOrderInvoices(
                  controller,
                );
              }

              return _buildAdInvoices(
                controller,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInvoices(
    LabInvoicesController controller,
  ) {
    if (controller
        .orderInvoices.isEmpty) {
      return const Padding(
        padding:
            EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: EmptyStateCard(
          title:
              'لا توجد فواتير طلبات',
          subtitle:
              'ستظهر فواتير الطلبات المدفوعة هنا.',
          icon:
              Icons.receipt_long_outlined,
        ),
      );
    }

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: controller
            .orderInvoices
            .map(
          (invoice) => Padding(
            padding:
                const EdgeInsets.only(
              bottom: 14,
            ),
            child:
                OrderInvoiceCard(
              invoice: invoice,
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildAdInvoices(
    LabInvoicesController controller,
  ) {
    final invoices =
        controller.visibleAdInvoices;

    if (invoices.isEmpty) {
      return const Padding(
        padding:
            EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: EmptyStateCard(
          title:
              'لا توجد فواتير إعلانات',
          subtitle:
              'ستظهر فواتير الإعلانات المدفوعة هنا.',
          icon:
              Icons.campaign_outlined,
        ),
      );
    }

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: invoices
            .map(
          (invoice) => Padding(
            padding:
                const EdgeInsets.only(
              bottom: 14,
            ),
            child:
                AdInvoiceCard(
              invoice: invoice,
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}