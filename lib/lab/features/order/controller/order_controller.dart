
import 'package:get/get.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';
import '../repositry/order_repo.dart';

enum OrderFilter { all, urgent, notUrgent }

class LabOrderController extends GetxController {
  final LabOrderRepo _repo = LabOrderRepo();

  final isLoading = false.obs;
  final allOrders = <LabOrderModel>[].obs;
  final orders = <LabOrderModel>[].obs;

  final selectedFilter = OrderFilter.all.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async {
    isLoading.value = true;

    final response = await _repo.getOrders();

    isLoading.value = false;

    if (response.success && response.data != null) {
      allOrders.assignAll(response.data!);
      applyFilter(OrderFilter.all);
    }
  }

  void applyFilter(OrderFilter filter) {
    selectedFilter.value = filter;

    if (filter == OrderFilter.all) {
      orders.assignAll(allOrders);
    } else if (filter == OrderFilter.urgent) {
      orders.assignAll(allOrders.where((e) => e.isUrgent));
    } else {
      orders.assignAll(allOrders.where((e) => !e.isUrgent));
    }
  }

  void goBack() {
    Get.back();
  }
}