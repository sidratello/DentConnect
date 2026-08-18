import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';
import 'package:template/lab/features/subscription/view/wedjet_subscription/subscription_required_dialog.dart';

class GlobalInterceptor extends dio.Interceptor {
    GlobalInterceptor() {
    debugPrintSynchronously(
      '🔥 GLOBAL INTERCEPTOR CREATED',
    );
  }
  static const String _divider =
      '----------------------------------------------------------------------';

  static final JsonEncoder _encoder = JsonEncoder.withIndent('  ');
  static bool _isHandling401 = false;
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
      debugPrintSynchronously(
    '🔥 GLOBAL INTERCEPTOR ON REQUEST',
  );
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
      debugPrintSynchronously(
    '🔥 GLOBAL INTERCEPTOR ON RESPONSE',
  );
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
      await _handle401();
    }

    handler.next(err);
  }
    Future<void> _handle401() async {
    if (_isHandling401) {
      return;
    }

    if (!Get.isRegistered<StorageService>()) {
      return;
    }

    final role =
        StorageService.to.read<String>(
      'role',
    );

    final userId =
        StorageService.to.read<int>(
      'userId',
    );

    final labId =
        StorageService.to.read<int>(
      'labId',
    );

    debugPrint(
      '401 USER INFO: '
      'role=$role, '
      'userId=$userId, '
      'labId=$labId',
    );

    // هذا الـ Dialog خاص بالمخبر
    if (role == 'Lab' &&
        userId != null &&
        labId != null) {
      _isHandling401 = true;

      // نعتبر الحساب بحاجة إلى دفع
      await StorageService.to.write(
        'status',
        'PendingPayment',
      );

  
      await StorageService.to.remove(
        'token',
      );

      await StorageService.to.remove(
        'refreshToken',
      );

      WidgetsBinding.instance
          .addPostFrameCallback(
        (_) {
          SubscriptionRequiredDialog.show(
            onRenew: () {
              Get.back();

              _isHandling401 = false;

              Get.toNamed(
                AppRouter.subscriptionPlans,
                arguments: {
                  'isPendingPayment': true,
                },
              );
            },
          ).whenComplete(
            () {
              _isHandling401 = false;
            },
          );
        },
      );

      return;
    }


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