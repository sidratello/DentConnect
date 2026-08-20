import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/orderconection/model/connected_doctor_model.dart';



class ConnectedDoctorsRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<ConnectedDoctorModel>>>
      getConnectedDoctors() async {
    final response = await _apiService.get<List<dynamic>>(
      'lab-connected-doctors',
    );

    if (response.success && response.data != null) {
      final doctors = response.data!
          .whereType<Map<String, dynamic>>()
          .map(ConnectedDoctorModel.fromJson)
          .toList();

      return ApiResponse.success(
        data: doctors,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  Future<ApiResponse<dynamic>> disconnectDoctor(int connectionId) async {
    return _apiService.request<dynamic>(
      'lab-connected-doctors/$connectionId',
      method: 'DELETE',
    );
  }
}