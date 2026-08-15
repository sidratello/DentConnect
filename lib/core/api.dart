import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:template/core/api_response.dart';
import 'package:template/core/errors/failures.dart';
import 'package:template/core/global_interceptor.dart';
import 'package:template/core/utils/static.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio _dio;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Static.ipconfig,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': '*/*'},
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(GlobalInterceptor());
  }

  Future<ApiResponse<T>> request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final finalOptions = (options ?? Options()).copyWith(
        method: method,
        headers: {...(options?.headers ?? {})},
      );

      final response = await _dio.request(
        path,
        options: finalOptions,
        data: data,
        queryParameters: queryParameters,
      );

      final message = response.statusMessage ?? 'تمت العملية بنجاح';

      return ApiResponse.success(
        data: response.data as T?,
        message: message,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);

      return ApiResponse.error(
        failure.errMessage,
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      // إرجاع رسالة خطأ واضحة تتضمن تفاصيل الخطأ غير المتوقع
      return ApiResponse.error('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return request<T>(path, method: 'GET', queryParameters: queryParameters);
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    File? file,
    String? fileKey,
  }) async {
    final bool hasFile = file != null;

    if (hasFile) {
      FormData formData;

      if (data != null && data.isNotEmpty) {
        formData = FormData();

        data.forEach((key, value) {
          if (value != null) {
            formData.fields.add(MapEntry(key, value.toString()));
          }
        });
      } else {
        formData = FormData();
      }

      final key = fileKey ?? 'file';
      if (key.isEmpty) {
        throw ArgumentError("File key must not be empty.");
      }

      final fileName = file.path.split('/').last;
      final filePart = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      );
      formData.files.add(MapEntry(key, filePart));

      print(
        '📦 Using FormData with ${formData.fields.length} fields and 1 file',
      );

      return request<T>(path, method: 'POST', data: formData);
    } else {
      FormData formData = FormData();

      if (data != null) {
        data.forEach((key, value) {
          if (value != null) {
            formData.fields.add(
              MapEntry(key, value.toString()),
            );
          }
        });
      }

      return request<T>(
        path,
        method: 'POST',
        data: formData,
      );
    }
  }
}
