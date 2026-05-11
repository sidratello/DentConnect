import 'dart:io';

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';


class SignupRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<Map<String, dynamic>>> signupDentist({
    required String name,
    required String email,
    required String password,
    required String phone,
    String? namePlace,
    String? addressPlace,
    String? cityPlace,
    String? countryPlace,
    required File verificationDocument,
  }) async {
    return await _apiService.post<Map<String, dynamic>>(
      'Accounts/dentist',
      data: {
        'Name': name,
        'Email': email,
        'Password': password,
        'Phone': phone,
        'NamePlace': namePlace ?? '',
        'AddressPlace': addressPlace ?? '',
        'CityPlace': cityPlace ?? '',
        'CountryPlace': countryPlace ?? '',
      },
      file: verificationDocument,
      fileKey: 'VerificationDocument',
    );
  }
}