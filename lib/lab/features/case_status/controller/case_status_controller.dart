import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_helper.dart';
import '../model/case_status_model.dart';
import '../repositry/case_status_repo.dart';

class CaseStatusController extends GetxController {
  final CaseStatusRepo _repo = CaseStatusRepo();

  final isLoading = false.obs;
  final statuses = <CaseStatusModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getStatuses();
  }

Future<void> getStatuses() async {
  isLoading.value = true;

  final allStatusesResponse = await _repo.getAllStatuses();
  final countsResponse = await _repo.getStatusCounts();

  isLoading.value = false;

  if (!allStatusesResponse.success) {
    Get.snackbar('خطأ', allStatusesResponse.message);
    return;
  }

  if (!countsResponse.success) {
    Get.snackbar('خطأ', countsResponse.message);
    return;
  }

  final countsMap = {
    for (final item in countsResponse.data ?? <CaseStatusCountModel>[])
      item.status: item.count,
  };

statuses.value = (allStatusesResponse.data ?? <String>[])
    .where((status) => status != 'Pennding')
    .map((status) {
      return CaseStatusModel(
        status: status,
        count: countsMap[status] ?? 0,
      );
    }).toList();
}
String getArabicTitle(String status) => AppHelper.getArabicTitle(status);

IconData getIcon(String status) => AppHelper.getIcon(status);

Color getColor(String status) => AppHelper.getColor(status);

Color getLightColor(String status) => AppHelper.getLightColor(status);


  String getSubtitle(String status) {
    switch (status) {

      case 'Accepted':
        return 'طلبات تم قبولها';
      case 'RequestInfo':
        return 'طلبات تحتاج لمعلومات إضافية';
      case 'InDesign':
        return 'طلبات قيد التصميم';

case 'InColoring':
  return 'طلبات قيد التلوين';
      case 'InProduction':
        return 'طلبات قيد الإنتاج';
      case 'WaitingForClarification':
        return 'بانتظار توضيح من الطبيب';
      case 'Ready':
        return 'طلبات جاهزة للاستلام';
      case 'Delivered':
        return 'طلبات تم تسليمها';
      case 'Cancelled':
        return 'طلبات تم إلغاؤها';
      default:
        return '';
    }
  }


}