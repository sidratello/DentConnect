import 'package:get/get.dart';

import 'package:template/core_dentist/api.dart';

import '../model/invoice_model.dart';

class InvoiceController extends GetxController {
  final ApiService apiService = ApiService();

  final RxBool isLoadingPaid = false.obs;
  final RxBool isLoadingUnpaid = false.obs;

  final RxList<InvoiceModel> paidInvoices = <InvoiceModel>[].obs;
  final RxList<InvoiceModel> unpaidInvoices = <InvoiceModel>[].obs;

  static const String paidEndpoint = 'Invoices/paid/orders';
  static const String unpaidEndpoint = 'Invoices/unpaid/orders';

  @override
  void onInit() {
    super.onInit();

    fetchPaidInvoices();
    fetchUnpaidInvoices();
  }

  // ============================
  // Paid
  // ============================

  Future<void> fetchPaidInvoices() async {
    isLoadingPaid.value = true;

    try {
      final response = await apiService.get(
        paidEndpoint,
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map<String, dynamic> && data['data'] is List) {
          paidInvoices.value = (data['data'] as List)
              .map(
                (item) => InvoiceModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          paidInvoices.clear();
        }
      } else {
        paidInvoices.clear();

        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      paidInvoices.clear();

      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء جلب الفواتير المدفوعة',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingPaid.value = false;
    }
  }

  // ============================
  // Unpaid
  // ============================

  Future<void> fetchUnpaidInvoices() async {
    isLoadingUnpaid.value = true;

    try {
      final response = await apiService.get(
        unpaidEndpoint,
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map<String, dynamic> && data['data'] is List) {
          unpaidInvoices.value = (data['data'] as List)
              .map(
                (item) => InvoiceModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          unpaidInvoices.clear();
        }
      } else {
        unpaidInvoices.clear();

        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      unpaidInvoices.clear();

      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء جلب الفواتير غير المدفوعة',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingUnpaid.value = false;
    }
  }

  // ============================
  // Refresh
  // ============================

  Future<void> refreshInvoices() async {
    await Future.wait([
      fetchPaidInvoices(),
      fetchUnpaidInvoices(),
    ]);
  }
}
