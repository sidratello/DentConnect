import 'dart:io';

import 'package:intl/intl.dart';

import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';

import '../model/create_advertisement_response.dart';

class LabAdRepository {
  final ApiService _apiService;

  LabAdRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<
      ApiResponse<
          CreateAdvertisementResponse>>
      createAdvertisement({
    required String content,
    required DateTime expiresAt,
    required List<File> images,
  }) async {
    final response =
        await _apiService.post<
            Map<String, dynamic>>(
      'lab-ad/create',
      data: {
        'Content': content.trim(),
        'Target': 0,
        'ExpiresAt': DateFormat(
          'yyyy-MM-dd',
        ).format(expiresAt),
      },
      files: images,
      fileKey: 'ImageFiles',
    );

    if (!response.success ||
        response.data == null) {
      return ApiResponse.error(
        response.message,
        statusCode:
            response.statusCode,
      );
    }

    try {
      final result =
          CreateAdvertisementResponse
              .fromJson(
        response.data!,
      );

      return ApiResponse.success(
        data: result,
        message: result.message,
        statusCode:
            response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات الإعلان.',
        statusCode:
            response.statusCode,
      );
    }
  }
}