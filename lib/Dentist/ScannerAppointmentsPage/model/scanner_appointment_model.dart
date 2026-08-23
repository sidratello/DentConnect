class ScannerAppointmentModel {
  final int id;
  final int labId;
  final String labName;
  final String labAddress;
  final String labPhone;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String period;
  final DateTime createdAt;

  const ScannerAppointmentModel({
    required this.id,
    required this.labId,
    required this.labName,
    required this.labAddress,
    required this.labPhone,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.period,
    required this.createdAt,
  });

  factory ScannerAppointmentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ScannerAppointmentModel(
      id: json['id'] as int,
      labId: json['labId'] as int,
      labName: json['labName']?.toString() ?? '',
      labAddress: json['labAddress']?.toString() ?? '',
      labPhone: json['labPhone']?.toString() ?? '',
      appointmentDate: DateTime.parse(
        json['appointmentDate'].toString(),
      ),
      appointmentTime: json['appointmentTime']?.toString() ?? '',
      period: json['period']?.toString() ?? '',
      createdAt: DateTime.parse(
        json['createdAt'].toString(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'labId': labId,
      'labName': labName,
      'labAddress': labAddress,
      'labPhone': labPhone,
      'appointmentDate': appointmentDate.toIso8601String(),
      'appointmentTime': appointmentTime,
      'period': period,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String get formattedTime {
    if (appointmentTime.isEmpty) {
      return period;
    }

    final parts = appointmentTime.split(':');

    if (parts.length < 2) {
      return '$appointmentTime $period';
    }

    return '${parts[0]}:${parts[1]} $period';
  }

  String get formattedDate {
    return '${appointmentDate.day} '
        '${arabicMonths[appointmentDate.month - 1]} '
        '${appointmentDate.year}';
  }

  String get dayName {
    return arabicDays[appointmentDate.weekday - 1];
  }

  String get readableDate {
    return '$dayName، $formattedDate';
  }

  String get fullAppointmentDate {
    return '$readableDate • $formattedTime';
  }
}

const List<String> arabicDays = [
  'الاثنين',
  'الثلاثاء',
  'الأربعاء',
  'الخميس',
  'الجمعة',
  'السبت',
  'الأحد',
];

const List<String> arabicMonths = [
  'يناير',
  'فبراير',
  'مارس',
  'أبريل',
  'مايو',
  'يونيو',
  'يوليو',
  'أغسطس',
  'سبتمبر',
  'أكتوبر',
  'نوفمبر',
  'ديسمبر',
];
