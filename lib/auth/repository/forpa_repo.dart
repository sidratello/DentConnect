import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class ForgetPasswordRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> forgotPassword({
    required String email,
  }) async {
    return await _apiService.post<Map<String, dynamic>>(
      'Auth/forgot-password',
      data: {
        'email': email,
      },
    );
  }
}