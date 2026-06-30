import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import '../model/case_order_model.dart';
import '../repositry/case_orders_repo.dart';

class CaseOrdersController extends GetxController {
  final CaseOrdersRepo _repo = CaseOrdersRepo();

  final isLoading = false.obs;
  final orders = <CaseOrderModel>[].obs;

  late final String status;
  late final String statusTitle;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>;
    status = args['status'];
    statusTitle = args['title'];

    getOrders();
  }

  Future<void> getOrders() async {
    isLoading.value = true;

    final response = await _repo.getOrdersByStatus(status);

    isLoading.value = false;

    if (response.success && response.data != null) {
      orders.value = response.data!;
    } else {
      Get.snackbar('خطأ', response.message);
    }
  }

  bool get showPaidStatus {
    return status != 'Cancelled' && status != 'RequestInfo';
  }
  Color get statusColor => getColor(status);

IconData get statusIcon => getIcon(status);

Color getColor(String status) {
  switch (status) {
    case 'Accepted':
      return AppColors.green;
    case 'RequestInfo':
      return const Color(0xFFE69500);
    case 'InDesign':
      return const Color(0xFF7C3AED);
    case 'InProduction':
      return const Color(0xFF0891B2);
    case 'WaitingForClarification':
      return AppColors.normalText;
    case 'Ready':
      return AppColors.primaryBlue;
    case 'Delivered':
      return AppColors.green;
    case 'Cancelled':
      return AppColors.red;
    default:
      return AppColors.darkBlue;
  }
}

IconData getIcon(String status) {
  switch (status) {
    case 'Accepted':
      return Icons.check_circle_outline_rounded;
    case 'RequestInfo':
      return Icons.info_outline_rounded;
    case 'InDesign':
      return Icons.draw_outlined;
    case 'InProduction':
      return Icons.factory_outlined;
    case 'WaitingForClarification':
      return Icons.hourglass_empty_rounded;
    case 'Ready':
      return Icons.local_shipping_outlined;
    case 'Delivered':
      return Icons.done_all_rounded;
    case 'Cancelled':
      return Icons.cancel_outlined;
    default:
      return Icons.circle_outlined;
  }
}
}