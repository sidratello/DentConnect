import 'package:get/get.dart';
import 'package:template/core/api.dart';

import '../model/complaint_model.dart';

class ComplaintsListController extends GetxController {
  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;

  final RxList<ComplaintModel> complaints = <ComplaintModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchComplaints();
  }

  Future<void> fetchComplaints() async {
    isLoading.value = true;

    try {
      final response = await apiService.get(
        'Complaints/my-complaints',
      );

      if (response.statusCode == 200) {
        if (response.data is List) {
          complaints.value = (response.data as List)
              .map(
                (e) => ComplaintModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          complaints.clear();
        }
      } else {
        complaints.clear();

        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      complaints.clear();

      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء جلب الشكاوى',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
