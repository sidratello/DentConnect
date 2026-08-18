import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template/core/api_response.dart';
import 'package:template/core/errors/failures.dart';
import 'package:template/core/global_interceptor.dart';



class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio _dio;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.3:44334/api/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Accept': 'application/json'},
      ),
    );
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
    return ApiResponse.error('حدث خطأ غير متوقع: ${e.toString()}');
  }
}

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return request<T>(path, method: 'GET', queryParameters: queryParameters);
  }

//   Future<ApiResponse<T>> post<T>(
//     String path, {
//     Map<String, dynamic>? data,
//     File? file,
//     String? fileKey,
//   }) async {
//     final bool hasFile = file != null;

//     if (hasFile) {
//       FormData formData;

//       if (data != null && data.isNotEmpty) {
//         formData = FormData();

//         data.forEach((key, value) {
//           if (value != null) {
//             formData.fields.add(MapEntry(key, value.toString()));
//           }
//         });
//       } else {
//         formData = FormData();
//       }

//       final key = fileKey ?? 'file';
//       if (key.isEmpty) {
//         throw ArgumentError("File key must not be empty.");
//       }

//       final fileName = file.path.split('/').last;
//       final filePart = await MultipartFile.fromFile(
//         file.path,
//         filename: fileName,
//       );
//       formData.files.add(MapEntry(key, filePart));

//       print(
//         '📦 Using FormData with ${formData.fields.length} fields and 1 file',
//       );

//       return request<T>(path, method: 'POST', data: formData);
//     } else {

//   FormData formData = FormData();

//   if (data != null) {
//     data.forEach((key, value) {
//       if (value != null) {
//         formData.fields.add(
//           MapEntry(key, value.toString()),
//         );
//       }
//     });
//   }

//   return request<T>(
//     path,
//     method: 'POST',
//     data: formData,
//   );
// }
//   }

Future<ApiResponse<T>> post<T>(
  String path, {
  Map<String, dynamic>? data,
  File? file,
  List<File>? files,
  String? fileKey,
}) async {
  if (file != null &&
      files != null &&
      files.isNotEmpty) {
    throw ArgumentError(
      'Use either file or files, not both.',
    );
  }

  final formData = FormData();

  if (data != null) {
    data.forEach((key, value) {
      if (value != null) {
        formData.fields.add(
          MapEntry(
            key,
            value.toString(),
          ),
        );
      }
    });
  }

  final hasFiles =
      file != null ||
      (files != null && files.isNotEmpty);

  if (hasFiles) {
    final key = fileKey ?? 'file';

    if (key.trim().isEmpty) {
      throw ArgumentError(
        'File key must not be empty.',
      );
    }

    if (file != null) {
      formData.files.add(
        MapEntry(
          key,
          await MultipartFile.fromFile(
            file.path,
            filename: _getFileName(file.path),
          ),
        ),
      );
    }

    if (files != null) {
      for (final currentFile in files) {
        formData.files.add(
          MapEntry(
            key,
            await MultipartFile.fromFile(
              currentFile.path,
              filename: _getFileName(
                currentFile.path,
              ),
            ),
          ),
        );
      }
    }
  }

  return request<T>(
    path,
    method: 'POST',
    data: formData,
  );
}

String _getFileName(String path) {
  return path
      .replaceAll('\\', '/')
      .split('/')
      .last;
}






Future<ApiResponse<T>> put<T>(
  String path, {
  Map<String, dynamic>? data,
  File? file,
  String? fileKey,
}) async {
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

  if (file != null) {
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
  }

  return request<T>(
    path,
    method: 'PUT',
    data: formData,
  );
}


Future<ApiResponse<T>> putWithFiles<T>(
  String path, {
  Map<String, dynamic>? data,
  required List<File> files,
  required String fileKey,
}) async {
  if (fileKey.trim().isEmpty) {
    throw ArgumentError(
      'File key must not be empty.',
    );
  }

  final formData = FormData();

  if (data != null) {
    data.forEach((key, value) {
      if (value != null) {
        formData.fields.add(
          MapEntry(
            key,
            value.toString(),
          ),
        );
      }
    });
  }

  for (final file in files) {
    formData.files.add(
      MapEntry(
        fileKey,
        await MultipartFile.fromFile(
          file.path,
          filename: _getFileName(file.path),
        ),
      ),
    );
  }

  return request<T>(
    path,
    method: 'PUT',
    data: formData,
  );
}

Future<ApiResponse<T>> delete<T>(
  String path, {
  Map<String, dynamic>? data,
  Map<String, dynamic>? queryParameters,
}) {
  return request<T>(
    path,
    method: 'DELETE',
    data: data,
    queryParameters: queryParameters,
  );
}


}
