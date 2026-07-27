import 'package:template/core/api.dart';
import 'package:template/core/api_response.dart';
import 'package:template/lab/features/monthly_calendar/model/calendar_day_details_model.dart';
import 'package:template/lab/features/monthly_calendar/model/monthly_calendar_model.dart';

class MonthlyCalendarRepository {
  final ApiService _apiService;

  MonthlyCalendarRepository({
    ApiService? apiService,
  }) : _apiService =
            apiService ?? ApiService();

  Future<ApiResponse<MonthlyCalendarModel>>
      getMonthlyCalendar({
    required int year,
    required int month,
  }) async {
    final response =
        await _apiService.get<Map<String, dynamic>>(
      'calendar/monthly',
      queryParameters: {
        'year': year,
        'month': month,
      },
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    if (response.data == null) {
      return ApiResponse.error(
        'لم يتم إرجاع بيانات التقويم.',
        statusCode: response.statusCode,
      );
    }

    try {
      final calendar =
          MonthlyCalendarModel.fromJson(
          response.data!,
      );

      return ApiResponse.success(
        data: calendar,
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة بيانات التقويم الشهري.',
        statusCode: response.statusCode,
      );
    }
  }




  Future<ApiResponse<CalendarDayDetailsModel>>
      getCalendarDayDetails({
    required DateTime date,
  }) async {
    final response =
        await _apiService.get<
            Map<String, dynamic>>(
      'calendar/day',
      queryParameters: {
        'date': _formatDate(date),
      },
    );

    if (!response.success) {
      return ApiResponse.error(
        response.message,
        statusCode: response.statusCode,
      );
    }

    if (response.data == null) {
      return ApiResponse.error(
        'لم يتم إرجاع تفاصيل اليوم.',
        statusCode: response.statusCode,
      );
    }

    try {
      final details =
          CalendarDayDetailsModel.fromJson(
          response.data!,
      );

      return ApiResponse.success(
        data: details,
        message: response.message,
        statusCode: response.statusCode,
      );
    } catch (_) {
      return ApiResponse.error(
        'تعذر قراءة تفاصيل اليوم.',
        statusCode: response.statusCode,
      );
    }
  }

  String _formatDate(DateTime date) {
    final month =
        date.month.toString().padLeft(
              2,
              '0',
            );

    final day =
        date.day.toString().padLeft(
              2,
              '0',
            );

    return '${date.year}-$month-$day';
  }




}