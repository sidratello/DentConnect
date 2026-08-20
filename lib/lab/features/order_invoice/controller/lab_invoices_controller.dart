import 'package:get/get.dart';

import 'package:template/lab/features/order_invoice/model/InvoiceItemModel.dart';
import 'package:template/lab/features/order_invoice/repositry/lab_invoices_repository.dart';

enum LabInvoicesTab {
  orders,
  ads,
}
class LabInvoicesController
    extends GetxController {
  final LabInvoicesRepository repository;

  LabInvoicesController({
    required this.repository,
  });

  final isLoading = false.obs;

  final orderInvoices =
      <OrderInvoiceModel>[].obs;

  final adInvoices =
      <AdInvoiceModel>[].obs;
final selectedTab =
    LabInvoicesTab.ads.obs;
  @override
  void onInit() {
    super.onInit();

    getInvoices();
  }

  Future<void> getInvoices() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;

      final response =
          await repository.getInvoices();

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
        );

        return;
      }

      final result =
          LabInvoicesResponse.fromJson(
        response.data!,
      );

      orderInvoices.assignAll(
        result.orderInvoices,
      );

      adInvoices.assignAll(
        result.adInvoices,
      );
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تحميل الفواتير',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshInvoices() async {
    await getInvoices();
  }
List<AdInvoiceModel>
    get visibleAdInvoices {
  return adInvoices
      .where(
        (invoice) =>
            invoice.price > 0,
      )
      .toList();
}

bool get isOrdersTab =>
    selectedTab.value ==
    LabInvoicesTab.orders;

bool get isAdsTab =>
    selectedTab.value ==
    LabInvoicesTab.ads;

void selectTab(
  LabInvoicesTab tab,
) {
  selectedTab.value = tab;
}
  void goBack() {
  Get.back();
}
}