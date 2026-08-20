import 'package:template/lab/shared/models/lab_order_model.dart';

class CalendarDayDetailsModel {
  final DateTime date;
  final List<LabOrderModel> orders;
  final List<CalendarScanVisitModel> scanVisits;

  const CalendarDayDetailsModel({
    required this.date,
    required this.orders,
    required this.scanVisits,
  });

  factory CalendarDayDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalendarDayDetailsModel(
      date: DateTime.tryParse(
            json['date']?.toString() ?? '',
          ) ??
          DateTime.now(),
      orders: (json['orders'] as List? ?? [])
          .whereType<Map>()
          .map(
            (item) => LabOrderModel.fromJson(
              Map<String, dynamic>.from(
                item,
              ),
            ),
          )
          .toList(),
      scanVisits:
          (json['scanVisits'] as List? ?? [])
              .whereType<Map>()
              .map(
                (item) =>
                    CalendarScanVisitModel.fromJson(
                  Map<String, dynamic>.from(
                    item,
                  ),
                ),
              )
              .toList(),
    );
  }

  int get totalOrders => orders.length;

  int get totalScanVisits =>
      scanVisits.length;

  bool get isEmpty =>
      orders.isEmpty &&
      scanVisits.isEmpty;
}

class CalendarScanVisitModel {
  final int id;
  final String time;
  final String period;
  final String doctorName;
  final String doctorPhone;
  final String doctorNamePlace;
  final String doctorAddressPlace;
  final String doctorCityPlace;
  final String doctorCountryPlace;

  const CalendarScanVisitModel({
    required this.id,
    required this.time,
    required this.period,
    required this.doctorName,
    required this.doctorPhone,
    required this.doctorNamePlace,
    required this.doctorAddressPlace,
    required this.doctorCityPlace,
    required this.doctorCountryPlace,
  });

  factory CalendarScanVisitModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalendarScanVisitModel(
      id: json['id'] ?? 0,
      time: (json['time'] ?? '').toString(),
      period:
          (json['period'] ?? '').toString(),
      doctorName:
          (json['doctorName'] ?? '')
              .toString(),
      doctorPhone:
          (json['doctorPhone'] ?? '')
              .toString(),
      doctorNamePlace:
          (json['doctorNamePlace'] ?? '')
              .toString(),
      doctorAddressPlace:
          (json['doctorAddressPlace'] ?? '')
              .toString(),
      doctorCityPlace:
          (json['doctorCityPlace'] ?? '')
              .toString(),
      doctorCountryPlace:
          (json['doctorCountryPlace'] ?? '')
              .toString(),
    );
  }

  String get formattedTime {
    final parts = time.split(':');

    if (parts.length < 2) {
      return time;
    }

    return '${parts[0]}:${parts[1]}';
  }

  String get placeName {
    final value =
        doctorNamePlace.trim();

    if (value.isEmpty) {
      return 'غير متوفر';
    }

    return value;
  }
}