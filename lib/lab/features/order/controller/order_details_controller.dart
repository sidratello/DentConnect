import 'package:get/get.dart';
import 'package:template/lab/features/order/repositry/order_repo.dart';
import '../../order/model/order_model.dart';

class OrderDetailsController extends GetxController {
  late final LabOrderModel order;
  final LabOrderRepo _repo = LabOrderRepo();
final isAcceptLoading = false.obs;
final isRejectLoading = false.obs;
final isRequestInfoLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    order = Get.arguments as LabOrderModel;
  }

  void goBack() {
    Get.back();
  }


  Future<void> acceptOrder() async {
    isAcceptLoading.value = true;

    final response = await _repo.acceptOrder(order.orderId);

    isAcceptLoading.value = false;

if (response.success) {
  Get.back(result: {
    'success': true,
    'message': response.message ?? 'تم قبول الطلب',
  });
}else {
      Get.snackbar(
        'خطأ',
        response.message,
      );
    }
  }

Future<void> rejectOrder(String reason) async {
  if (reason.trim().isEmpty) {
    Get.snackbar('تنبيه', 'يرجى كتابة سبب الرفض');
    return;
  }

  isRejectLoading.value = true;

  final response = await _repo.rejectOrder(
    orderId: order.orderId,
    reason: reason.trim(),
  );

  isRejectLoading.value = false;


if (response.success) {
  Get.back(); // close dialog

  Future.delayed(const Duration(milliseconds: 100), () {
    Get.back(result: {
      'success': true,
      'message': response.message ?? 'تم رفض الطلب',
    });
  });
}

else {
    Get.snackbar(
      'خطأ',
      response.message,
    );
  }}

Future<void> requestMoreInfo(String message) async {
  if (message.trim().isEmpty) {
    Get.snackbar('تنبيه', 'يرجى كتابة المعلومات الاضافية التي تريدها');
    return;
  }

  isRequestInfoLoading.value = true;

  final response = await _repo.requestMoreInfo(
    orderId: order.orderId,
    message: message.trim(),
  );

  isRequestInfoLoading.value = false;

if (response.success) {
  Get.back(); // close dialog

  Future.delayed(const Duration(milliseconds: 100), () {
    Get.back(result: {
      'success': true,
      'message': response.message ?? 'تم طلب معلومات إضافية',
    });
  });
}else {
    Get.snackbar(
      'خطأ',
      response.message,
    );
  }
}
}