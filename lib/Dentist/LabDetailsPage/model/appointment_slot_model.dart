class AppointmentSlotModel {
  final int slotId;
  final DateTime date;
  final String time;
  final String period;

  const AppointmentSlotModel({
    required this.slotId,
    required this.date,
    required this.time,
    required this.period,
  });

  factory AppointmentSlotModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AppointmentSlotModel(
      slotId: json['id'] as int,
      date: DateTime.parse(
        json['appointmentDate'].toString(),
      ),
      time: json['appointmentTime'].toString(),
      period: json['timeFormatted'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': slotId,
      'appointmentDate': date.toIso8601String(),
      'appointmentTime': time,
      'timeFormatted': period,
    };
  }

  AppointmentSlotModel copyWith({
    int? slotId,
    DateTime? date,
    String? time,
    String? period,
  }) {
    return AppointmentSlotModel(
      slotId: slotId ?? this.slotId,
      date: date ?? this.date,
      time: time ?? this.time,
      period: period ?? this.period,
    );
  }

  /// اسم اليوم بالعربي
  String get dayName {
    return arabicDays[date.weekday - 1];
  }

  /// مثال: 6 أكتوبر 2026
  String get formattedDate {
    return '${date.day} '
        '${arabicMonths[date.month - 1]} '
        '${date.year}';
  }

  /// الوقت القادم من الـ API بصيغة 12 ساعة
  /// مثال: 12:15 PM
  String get formattedTime {
    return period;
  }

  /// مثال: الثلاثاء، 6 أكتوبر 2026
  String get readableDate {
    return '$dayName، $formattedDate';
  }

  /// مثال: الثلاثاء، 6 أكتوبر 2026 • 12:15 PM
  String get fullDisplay {
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
