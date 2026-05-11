import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:template/core/app_helper.dart';
import 'package:template/core/storage_services.dart';

class GlobalInterceptor extends dio.Interceptor {
  static const String _divider =
      '----------------------------------------------------------------------';

  static final JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    final token = AppHelper.token;

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = Get.locale?.languageCode ?? 'ar';

    options.extra['request_time'] = DateTime.now();

    if (kDebugMode) {
      debugPrint(_divider);
      debugPrint('🚀 REQUEST [${options.method}]');
      debugPrint('🔗 URL: ${options.uri}');
      debugPrint('👤 Headers: ${_pretty(options.headers)}');

      if (options.data != null) {
        debugPrint('📦 Data: ${_pretty(options.data)}');
      }

      debugPrint(_divider);
    }

    handler.next(options);
  }

  @override
  void onResponse(
    dio.Response response,
    dio.ResponseInterceptorHandler handler,
  ) {
    final requestTime =
        response.requestOptions.extra['request_time'] as DateTime?;

    final duration = requestTime == null
        ? Duration.zero
        : DateTime.now().difference(requestTime);

    final successMessage = _extractSuccessMessage(response.data);

    if (successMessage.isNotEmpty) {
      response.statusMessage = successMessage;
    }

    if (kDebugMode) {
      debugPrint(_divider);
      debugPrint('✅ RESPONSE [${response.statusCode}]');
      debugPrint('⏱ Duration: ${duration.inMilliseconds}ms');
      debugPrint('🔗 URL: ${response.requestOptions.uri}');

      if (successMessage.isNotEmpty) {
        debugPrint('🎉 Message: $successMessage');
      }

      debugPrint('📦 Data: ${_pretty(response.data)}');
      debugPrint(_divider);
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    dio.DioException err,
    dio.ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    if (kDebugMode) {
      debugPrint(_divider);
      debugPrint('❌ ERROR [$statusCode]');
      debugPrint('🔗 URL: ${err.requestOptions.uri}');
      debugPrint('Type: ${err.type}');
      debugPrint('Message: ${err.message}');
      debugPrint('Body: ${_pretty(err.response?.data)}');
      debugPrint(_divider);
    }

    if (statusCode == 401) {
      AppHelper.clear();

      if (Get.isRegistered<StorageService>()) {
        await StorageService.to.clearAll();
      }

      // Get.offAllNamed('/login');
    }

    handler.next(err);
  }

  static String _pretty(dynamic data) {
    try {
      if (data == null) return 'null';

      if (data is dio.FormData) {
        final fields = data.fields.map((e) => '${e.key}: ${e.value}').join('\n');

        final files =
            data.files.map((e) => '${e.key}: ${e.value.filename}').join('\n');

        return 'FormData\nFields:\n$fields\nFiles:\n$files';
      }

      return _encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  String _extractSuccessMessage(dynamic responseData) {
    if (responseData == null) return '';

    if (responseData is Map) {
      final successKeys = ['message', 'msg', 'success_message', 'success'];

      for (final key in successKeys) {
        final value = responseData[key];

        if (value is String) return value;
      }

      final data = responseData['data'];

      if (data is Map) {
        for (final key in successKeys) {
          final value = data[key];

          if (value is String) return value;
        }
      }
    }

    return '';
  }
}