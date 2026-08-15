

import 'package:template/auth/model/login_response_model.dart';
import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';


class LoginRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<LoginResponseModel>> loginDentist({
    required String email,
    required String password,

  }) async {
  
    final response =   await _apiService.post<Map<String, dynamic>>(
     'Auth/login',
      data: {
 
        'Email': email,
        'Password': password,
 
      },

    );


      if (response.success && response.data != null) {
      return ApiResponse.success(
        data: LoginResponseModel.fromJson(response.data!),
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }
  }
