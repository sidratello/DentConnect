

import 'package:get/get.dart';
import 'package:template/lab/features/orderconection/model/order_conection_model.dart';
import 'package:template/lab/features/orderconection/repositry/order_connection_repo.dart';

enum OrderConnectionTab {
  connectedDoctors,
  connectionRequests,
}

class OrderConnectionController extends GetxController {
  final OrderConnectionRepo _repo = OrderConnectionRepo();

  final isLoading = false.obs;

  final requests = <OrderConnectionModel>[].obs;
  final allRequests = <OrderConnectionModel>[].obs;
 // تبويب طلبات الاتصال هو المختار عند فتح الشاشة
  final selectedTab = OrderConnectionTab.connectionRequests.obs;

final searchQuery = ''.obs;


  @override
  void onInit() {
    super.onInit();
    getRequests();
  }


  void changeTab(OrderConnectionTab tab) {
    selectedTab.value = tab;

    // مسح البحث عند الانتقال بين التبويبات
    searchQuery.value = '';

    if (tab == OrderConnectionTab.connectionRequests) {
      requests.assignAll(allRequests);
    }
  }
  Future<void> getRequests() async {
    isLoading.value = true;

    final response = await _repo.getRequests();

    isLoading.value = false;

    if (response.success && response.data != null) {
      allRequests.assignAll(response.data!);
      requests.assignAll(response.data!);
    }
  }

  void searchRequests(String value) {
    searchQuery.value = value.trim();

    final query = searchQuery.value.toLowerCase();

    if (query.isEmpty) {
      requests.assignAll(allRequests);
      return;
    }

    final result = allRequests.where((item) {
      final doctorName = item.dentist.name.toLowerCase();
      final addressPlace = item.dentist.addressPlace.toLowerCase();

      return doctorName.contains(query) ||
          addressPlace.contains(query);
    }).toList();

    requests.assignAll(result);
  }


Future<void> acceptRequest(int requestId) async {

  final response = await _repo.acceptRequest(requestId);

  if (response.success) {

    allRequests.removeWhere(
      (item) => item.id == requestId,
    );

    requests.removeWhere(
      (item) => item.id == requestId,
    );

    Get.snackbar(
      'تم',
      response.message ?? 'تمت الموافقة على الطلب',
    );

  } else {

    Get.snackbar(
      'خطأ',
      response.message,
    );
  }
}

Future<void> rejectRequest(int requestId) async {

  final response = await _repo.rejectRequest(requestId);

  if (response.success) {

    allRequests.removeWhere(
      (item) => item.id == requestId,
    );

    requests.removeWhere(
      (item) => item.id == requestId,
    );

    Get.snackbar(
      'تم',
      response.message ?? 'تم رفض الطلب',
    );

  } else {

    Get.snackbar(
      'خطأ',
      response.message,
    );
  }
}

  void goBack() {
    Get.back();
  }
}