import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LabProfileRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> getLabProfile() async {
    return await _apiService.get<Map<String, dynamic>>(
      'lab-profile/me',
    );
  }

   Future<ApiResponse<Map<String, dynamic>>>
      getLabProfilePicture() async {
    return await _apiService.get<Map<String, dynamic>>(
      'profile-picture-lab',
    );
  }

  Future<ApiResponse<Map<String, dynamic>>>
    getMyFatoorahSupplierCode()
    async {
  return await _apiService.get<
      Map<String, dynamic>>(
    'lab/myfatoorah-code',
  );
}
}