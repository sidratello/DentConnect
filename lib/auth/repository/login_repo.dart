

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';


class LoginRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> loginDentist({
    required String email,
    required String password,

  }) async {
    return await _apiService.post<Map<String, dynamic>>(
     'Auth/login',
      data: {
 
        'Email': email,
        'Password': password,
 
      },

    );
  }
}