import 'package:get/get.dart';
import 'package:template/core_dentist/api.dart';
import '../model/scanner_appointment_model.dart';

class ScannerAppointmentsController extends GetxController {
  final ApiService apiService = ApiService();

  final RxList<ScannerAppointmentModel> appointments =
      <ScannerAppointmentModel>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await apiService.get(
        'scan-visits/my-bookings',
      );

      if (response.statusCode == 200) {
        final data = response.data as List;

        appointments.value = data
            .map(
              (item) => ScannerAppointmentModel.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
