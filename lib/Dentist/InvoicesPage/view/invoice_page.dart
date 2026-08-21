import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/paid_invoices_view.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/unpaid_invoices_view.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../core_dentist/theme/app_colors.dart';
import '../controller/invoice_controller.dart';

class InvoicesPage extends GetView<InvoiceController> {
  const InvoicesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'الفواتير',
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
        body: TopBackground(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Static.getwidth(
                      context,
                      20,
                    ),
                  ),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: .10),
                      ),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey.shade600,
                      labelStyle: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: const [
                        Tab(
                          text: 'غير مدفوعة',
                        ),
                        Tab(
                          text: 'مدفوعة',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    children: [
                      UnpaidInvoicesView(
                        controller: controller,
                      ),
                      PaidInvoicesView(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
