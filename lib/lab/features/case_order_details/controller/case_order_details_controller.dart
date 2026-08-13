import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

import '../model/order_quote_model.dart';
import '../repositry/case_order_details_repo.dart';

class CaseOrderDetailsController extends GetxController {
  final CaseOrderDetailsRepo _repo = CaseOrderDetailsRepo();

  final finalPriceController = TextEditingController();

  final isLoading = false.obs;
  final isUpdatingPrice = false.obs;

  final order = Rxn<LabOrderModel>();
  final quote = Rxn<OrderQuoteModel>();

  late final int orderId;
final wasOrderUpdated = false.obs;
  @override
  void onInit() {
    super.onInit();

    final argument = Get.arguments;

    if (argument is LabOrderModel) {
      order.value = argument;
      orderId = argument.orderId;
    } else {
      orderId = argument as int;
    }

    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;

    final detailsResponse = await _repo.getOrderDetails(orderId);
    final quoteResponse = await _repo.getOrderQuote(orderId);

    isLoading.value = false;

    if (!detailsResponse.success) {
      Get.snackbar('خطأ', detailsResponse.message);
      return;
    }

    if (!quoteResponse.success) {
      Get.snackbar('خطأ', quoteResponse.message);
      return;
    }

    order.value = detailsResponse.data;
    quote.value = quoteResponse.data;

    finalPriceController.text =
        quote.value?.finalPrice?.toStringAsFixed(0) ?? '';
  }

  Future<void> updateFinalPrice(String value) async {
    final price = double.tryParse(value);

    if (price == null || price <= 0) {
      Get.snackbar('تنبيه', 'يرجى إدخال سعر صحيح');
      return;
    }

    if (quote.value?.isPaid == true) {
      Get.snackbar('تنبيه', 'لا يمكن تعديل السعر بعد الدفع');
      return;
    }

    isUpdatingPrice.value = true;

    final response = await _repo.updateFinalPrice(
      orderId: orderId,
      finalPrice: price,
    );

    isUpdatingPrice.value = false;

    if (response.success) {
      Get.snackbar('نجاح', response.message ?? 'تم تحديث السعر النهائي');
      await getData();
    } else {
      Get.snackbar('خطأ', response.message);
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '-';
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  String formatPrice(double? price) {
    if (price == null) return '-';
    return '${price.toStringAsFixed(2)} ل.س';
  }

  bool get hasStlFiles {
    return order.value?.impressionType == 'Digital' &&
        (order.value?.files.isNotEmpty ?? false);
  }
Future<void> openUpdateOrderStatus() async {
  final currentOrder = order.value;

  if (currentOrder == null) {
    return;
  }

  final result = await Get.toNamed(
    AppRouter.updateOrderStatus,
    arguments: currentOrder,
  );

  if (result is LabOrderModel) {
    order.value = result;
    wasOrderUpdated.value = true;
  }
}
void goBack() {
  final currentOrder = order.value;

  if (wasOrderUpdated.value &&
      currentOrder != null) {
    Get.back(
      result: currentOrder,
    );
    return;
  }

  Get.back();
}

  @override
  void onClose() {
    finalPriceController.dispose();
    super.onClose();
  }
}