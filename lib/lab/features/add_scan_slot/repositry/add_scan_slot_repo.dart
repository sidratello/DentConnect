import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

import '../model/scan_slot_model.dart';

class AddScanSlotRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<ScanSlotModel>> createScanSlot({
    required String date,
    required String time,
    required String period,
  }) async {
    final response = await _apiService.post<Map<String, dynamic>>(
      'lab/scan-slots',
      data: {
        'Date': date,
        'Time': time,
        'Period': period,
      },
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: ScanSlotModel.fromJson(response.data!),
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