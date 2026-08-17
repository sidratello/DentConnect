import 'package:get/get.dart';
import 'package:template/Dentist/PatientPage/model/cases_patient_model.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';
import 'package:template/core/api.dart';

class PatientController extends GetxController {
  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;
  final RxList<PatientModel> patients = <PatientModel>[].obs;
  final Rxn<CasesPatientModel> cases = Rxn<CasesPatientModel>();

  @override
  void onInit() {
    super.onInit();
    fetchPatientList();
  }

  Future<void> fetchPatientList() async {
    isLoading.value = true;
    try {
      final response = await apiService.get(
        'CaseOrders/patients',
      );

      if (response.statusCode == 200) {
        print(response.data.toString());

        if (response.data is List) {
          patients.value = (response.data as List)
              .map(
                (e) => PatientModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          patients.clear();

          print(
            'Unexpected response format: '
            '${response.data.runtimeType}',
          );
        }
      } else {
        patients.clear();

        print(
          'Failed to fetch patients: ${response.message}',
        );
      }
    } catch (e) {
      patients.clear();

      print(
        'Error fetching patients: $e',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCasesPatientList(int id) async {
    isLoading.value = true;

    try {
      final response = await apiService.get(
        'CaseOrders/patient/$id',
      );

      if (response.statusCode == 200) {
        print(response.data);

        if (response.data is Map<String, dynamic>) {
          cases.value = CasesPatientModel.fromJson(
            response.data as Map<String, dynamic>,
          );
        } else {
          cases.value = null;

          print(
            'Unexpected response format: '
            '${response.data.runtimeType}',
          );
        }
      } else {
        cases.value = null;

        print(
          'Failed to fetch patient cases: ${response.message}',
        );
      }
    } catch (e) {
      cases.value = null;

      print(
        'Error fetching patient cases: $e',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
