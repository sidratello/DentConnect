import 'package:get/get.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

import '../repositry/doctor_orders_repo.dart';

class DoctorOrdersController extends GetxController {
  final DoctorOrdersRepo _repo = DoctorOrdersRepo();

  final isLoading = false.obs;
  final orders = <LabOrderModel>[].obs;

  late final int doctorId;
  String doctorName = '';

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    if (arguments is Map) {
      doctorId = arguments['doctorId'] as int;
      doctorName = arguments['doctorName']?.toString() ?? '';
    } else {
      doctorId = arguments as int;
    }

    getDoctorOrders();
  }

  Future<void> getDoctorOrders() async {
    isLoading.value = true;

    final response = await _repo.getDoctorOrders(doctorId);

    isLoading.value = false;

    if (response.success && response.data != null) {
      orders.assignAll(response.data!);
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
      );
    }
  }


  Future<void> openOrderDetails(
  LabOrderModel order,
) async {
  final result = await Get.toNamed(
    order.status == 'Pennding'
        ? AppRouter.orderDetails
        : AppRouter.caseOrderDetails,
    arguments: order,
  );

  if (result is LabOrderModel) {
    handleUpdatedOrder(result);
  }
}

void handleUpdatedOrder(
  LabOrderModel updatedOrder,
) {
  final index = orders.indexWhere(
    (item) =>
        item.orderId ==
        updatedOrder.orderId,
  );

  if (index == -1) {
    return;
  }

  orders[index] = updatedOrder;
}
}