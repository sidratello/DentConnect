
import 'package:get/get.dart';


import 'package:template/lab/shared/models/lab_order_model.dart';
import '../repositry/case_orders_repo.dart';

class CaseOrdersController extends GetxController {
  final CaseOrdersRepo _repo = CaseOrdersRepo();

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




}