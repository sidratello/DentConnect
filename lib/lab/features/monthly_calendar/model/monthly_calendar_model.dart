


class MonthlyCalendarModel {
  final int year;
  final int month;
  final List<CalendarDayModel> days;

  const MonthlyCalendarModel({
    required this.year,
    required this.month,
    required this.days,
  });

  factory MonthlyCalendarModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawDays = json['days'];

    return MonthlyCalendarModel(
      year: _parseInt(json['year']),
      month: _parseInt(json['month']),
      days: rawDays is List
          ? rawDays
              .whereType<Map>()
              .map(
                (item) => CalendarDayModel.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              )
              .toList()
          : const [],
    );
  }

  int get totalOrders {
    return days.fold(
      0,
      (total, day) {
        return total + day.ordersCount;
      },
    );
  }

  int get totalScanVisits {
    return days.fold(
      0,
      (total, day) {
        return total + day.scanVisitsCount;
      },
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}
class CalendarDayModel {
  final DateTime date;
  final int ordersCount;
  final int scanVisitsCount;

  const CalendarDayModel({
    required this.date,
    required this.ordersCount,
    required this.scanVisitsCount,
  });

  factory CalendarDayModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalendarDayModel(
      date: DateTime.tryParse(
            json['date']?.toString() ?? '',
          ) ??
          DateTime.now(),
      ordersCount: _parseInt(
        json['ordersCount'],
      ),
      scanVisitsCount: _parseInt(
        json['scanVisitsCount'],
      ),
    );
  }

  int get totalCount {
    return ordersCount + scanVisitsCount;
  }

  bool get hasOrders {
    return ordersCount > 0;
  }

  bool get hasScanVisits {
    return scanVisitsCount > 0;
  }

  bool get hasData {
    return totalCount > 0;
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}