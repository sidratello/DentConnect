import 'dart:io';

import 'package:get/get.dart';
import 'package:template/Dentist/PatientPage/model/cases_patient_model.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';
import 'package:template/core_dentist/api.dart';

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
        }
      } else {
        patients.clear();
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
        if (response.data is Map<String, dynamic>) {
          cases.value = CasesPatientModel.fromJson(
            response.data as Map<String, dynamic>,
          );
        } else {
          cases.value = null;
        }
      } else {
        cases.value = null;
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

  Future<bool> updatePatientData(
    int patientId, {
    required String fullName,
    required String age,
    required String clinicalNotes,
    required String processedTeeth,
    List<File>? newPhotos,
    int? newPhotosType,
  }) async {
    try {
      final data = {
        'FullName': fullName,
        'Age': age,
        'ClinicalNotes': clinicalNotes,
        'ProcessedTeeth': processedTeeth,
        'NewPhotosType': newPhotosType,
      };

      final response = await apiService.putListFiles(
        'CaseOrders/patient/$patientId/update',
        data: data,
        fileKey: 'NewPhotos',
        files: newPhotos ?? [],
      );

      if (response.statusCode == 200) {
        return true;
      }

      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }
  }
}
