import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class ResetPasswordRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    return await _apiService.post<Map<String, dynamic>>(
      'Auth/reset-password',
      data: {
        'email': email,
        'code': code,
        'newPassword': newPassword,
      },
    );
  }
}