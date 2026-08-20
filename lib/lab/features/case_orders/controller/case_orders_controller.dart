
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';


import 'package:template/lab/shared/models/lab_order_model.dart';
import '../repositry/case_orders_repo.dart';

class CaseOrdersController extends GetxController {
  final CaseOrdersRepo _repo = CaseOrdersRepo();
final wasAnyOrderUpdated = false.obs;
  final isLoading = false.obs;
  final orders = <LabOrderModel>[].obs;

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

Future<void> openOrderDetails(
  LabOrderModel selectedOrder,
) async {
  final result = await Get.toNamed(
    AppRouter.caseOrderDetails,
    arguments: selectedOrder,
  );

  if (result is LabOrderModel) {
    handleUpdatedOrder(result);
  }
}
void handleUpdatedOrder(
  LabOrderModel updatedOrder,
) {
  final existingIndex =
      orders.indexWhere(
    (item) =>
        item.orderId ==
        updatedOrder.orderId,
  );

  if (existingIndex == -1) {
    return;
  }

  wasAnyOrderUpdated.value = true;

  if (updatedOrder.status != status) {
    orders.removeAt(existingIndex);
    return;
  }

  orders[existingIndex] =
      updatedOrder;
}
void goBack() {
  if (wasAnyOrderUpdated.value) {
    Get.back(
      result: true,
    );
    return;
  }

  Get.back();
}

}