import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LabProfileRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> getLabProfile() async {
    return await _apiService.get<Map<String, dynamic>>(
      'lab-profile/me',
    );
  }
}