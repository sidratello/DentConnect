import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

class LogoutRepository {
  final ApiService apiService;

  LogoutRepository({
    required this.apiService,
  });

  Future<ApiResponse<Map<String, dynamic>>>
      logout({
    required String refreshToken,
  }) async {
    return await apiService.post<
        Map<String, dynamic>>(
      'auth/logout',
      data: {
        'refreshToken':
            refreshToken,
      },
    );
  }
}