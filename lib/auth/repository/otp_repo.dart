

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';


class OtpRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required String email,
    required String code,

  }) async {
    return await _apiService.post<Map<String, dynamic>>(
      'Auth/verify-otp',
      data: {
 
        'Email': email,
        'Code': code,
      },

    );
  }


    Future<ApiResponse<Map<String, dynamic>>> resendOtp({
    required String email,
  }) async {
    return await _apiService.post<Map<String, dynamic>>(
      'Auth/resend-otp',
      data: {
        'email': email,
      },
    );
  }
}