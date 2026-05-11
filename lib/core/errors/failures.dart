import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    print('================ DioException ================');
    print('type: ${dioError.type}');

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهت مهلة الاتصال بالخادم، يرجى المحاولة مرة أخرى.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت مهلة إرسال الطلب، يرجى المحاولة مرة أخرى.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت مهلة استقبال البيانات من الخادم.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب.');

      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure('لا يوجد اتصال بالإنترنت.');
        }
        return ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');

      default:
        return ServerFailure('حدث خطأ ما، يرجى المحاولة مرة أخرى.');
    }
  }

   factory ServerFailure.fromResponse(
    int? statusCode,
    dynamic response,
  ) {
    String? backendMessage;

    // Response مثل:
    // "Verification document must be 5MB or less."
    if (response is String && response.trim().isNotEmpty) {
      backendMessage = response;
    }

    // Response مثل:
    // { "errors": { "Password": ["..."] } }
    else if (response is Map<String, dynamic>) {
      if (response["message"] != null) {
        backendMessage = response["message"].toString();
      } else if (response["errors"] is Map) {
        final errors = response["errors"] as Map;
        final messages = <String>[];

        errors.forEach((key, value) {
          if (value is List) {
            messages.addAll(value.map((e) => e.toString()));
          } else {
            messages.add(value.toString());
          }
        });

        if (messages.isNotEmpty) {
          backendMessage = messages.join('\n');
        }
      } else if (response["title"] != null) {
        backendMessage = response["title"].toString();
      }
    }

    if (backendMessage != null && backendMessage.trim().isNotEmpty) {
      return ServerFailure(_mapBackendMessageToArabic(backendMessage));
    }

    switch (statusCode) {
      case 400:
        return ServerFailure('البيانات المدخلة غير صحيحة.');
      case 401:
        return ServerFailure('يرجى تسجيل الدخول أولاً.');
      case 403:
        return ServerFailure('ليس لديك صلاحية لتنفيذ هذا الطلب.');
      case 404:
        return ServerFailure('الطلب غير موجود، يرجى المحاولة لاحقًا.');
      case 409:
        return ServerFailure('يوجد تعارض في البيانات، يرجى التحقق والمحاولة مرة أخرى.');
      case 500:
        return ServerFailure('حدث خطأ في الخادم، يرجى المحاولة لاحقًا.');
      default:
        return ServerFailure('حدث خطأ ما، يرجى المحاولة مرة أخرى.');
    }
  }

  static String _mapBackendMessageToArabic(String message) {
    final lowerMessage = message.toLowerCase();



if (lowerMessage.contains('user not found')) {
  return 'المستخدم غير موجود.';
}

if (lowerMessage.contains('otp is still valid')) {
  return 'رمز التحقق الحالي مازال صالحًا.';
}
 // OTP errors


  if (lowerMessage.contains('account is already verified')) {
    return 'تم تأكيد الحساب مسبقًا.';
  }

  if (lowerMessage.contains('invalid otp')) {
    return 'رمز التحقق غير صحيح.';
  }

  if (lowerMessage.contains('otp already used')) {
    return 'تم استخدام رمز التحقق مسبقًا.';
  }

  if (lowerMessage.contains('otp expired')) {
    return 'انتهت صلاحية رمز التحقق.';
  }

    if (lowerMessage.contains('verification document is required')) {
      return 'يرجى رفع وثيقة الانتساب.';
    }

    if (lowerMessage.contains('verification document must be 5mb or less')) {
      return 'حجم وثيقة التحقق يجب ألا يتجاوز 5 ميغابايت.';
    }

    if (lowerMessage.contains('verification document must be an image')) {
      return 'يجب أن تكون وثيقة التحقق صورة بصيغة JPG أو PNG.';
    }

    if (lowerMessage.contains('phone must contain only digits')) {
      return 'رقم الهاتف يجب أن يحتوي فقط على أرقام أو مسافات أو + أو - وأن يكون بين 7 و 30 رقماً.';
    }

    if (lowerMessage.contains('password') &&
        lowerMessage.contains('minimum length')) {
      return 'كلمة المرور يجب أن تحتوي على 6 أحرف على الأقل.';
    }

    if (lowerMessage.contains('email already exists')) {
      return 'البريد الإلكتروني مستخدم سابقاً.';
    }

    if (lowerMessage.contains('name')) {
      return 'الاسم غير صالح.';
    }

    return 'حدث خطأ، يرجى التحقق من البيانات المدخلة.';
  }}