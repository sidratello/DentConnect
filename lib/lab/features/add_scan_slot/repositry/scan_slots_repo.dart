
import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

import '../model/scan_booking_model.dart';
import '../model/scan_slot_model.dart';

class ScanSlotsRepo {
  final ApiService _apiService = ApiService();

  Future<ApiResponse<List<ScanSlotModel>>> getScanSlots() async {
    final response = await _apiService.get<List<dynamic>>(
      'lab/scan-slots',
    );

    if (response.success && response.data != null) {
      final slots = response.data!
          .whereType<Map<String, dynamic>>()
          .map(ScanSlotModel.fromJson)
          .toList();

      return ApiResponse.success(
        data: slots,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }



  Future<ApiResponse<List<ScanBookingModel>>> getBookings() async {
    final response = await _apiService.get<List<dynamic>>(
      'lab/scan-slots/bookings',
    );

    if (response.success && response.data != null) {
      final bookings = response.data!
          .whereType<Map<String, dynamic>>()
          .map(ScanBookingModel.fromJson)
          .toList();

      return ApiResponse.success(
        data: bookings,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

  Future<ApiResponse<int>> getBookingsCount() async {
    final response = await _apiService.get<Map<String, dynamic>>(
      'lab/scan-slots/bookings/count',
    );

    if (response.success && response.data != null) {
      return ApiResponse.success(
        data: response.data!['bookingsCount'] as int? ?? 0,
        message: response.message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }

Future<ApiResponse<ScanSlotModel>> updateScanSlot({
  required int slotId,
  required String date,
  required String time,
  required String period,
}) async {
  final response = await _apiService.put<Map<String, dynamic>>(
    'lab/scan-slots/$slotId',
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

  Future<ApiResponse<String>> deleteScanSlot({
    required int slotId,
  }) async {
    final response = await _apiService.delete<Map<String, dynamic>>(
      'lab/scan-slots/$slotId',
    );

    if (response.success) {
      final message =
          response.data?['message']?.toString() ??
          response.message;

      return ApiResponse.success(
        data: message,
        message: message,
        statusCode: response.statusCode,
      );
    }

    return ApiResponse.error(
      response.message,
      statusCode: response.statusCode,
    );
  }
}