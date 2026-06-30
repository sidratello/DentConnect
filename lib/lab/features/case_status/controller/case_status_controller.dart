import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
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

  String getArabicTitle(String status) {
    switch (status) {

      case 'Accepted':
        return 'مقبول';
      case 'RequestInfo':
        return 'طلب معلومات إضافية';
      case 'InDesign':
        return 'قيد التصميم';
      case 'InProduction':
        return 'قيد الإنتاج';
      case 'WaitingForClarification':
        return 'بانتظار توضيح';
      case 'Ready':
        return 'جاهز';
      case 'Delivered':
        return 'تم التسليم';
      case 'Cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }

  String getSubtitle(String status) {
    switch (status) {

      case 'Accepted':
        return 'طلبات تم قبولها';
      case 'RequestInfo':
        return 'طلبات تحتاج لمعلومات إضافية';
      case 'InDesign':
        return 'طلبات قيد التصميم';
      case 'InProduction':
        return 'طلبات قيد الإنتاج';
      case 'WaitingForClarification':
        return 'بانتظار توضيح من العميل';
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

  Color getLightColor(String status) {
    return getColor(status).withOpacity(0.10);
  }
}