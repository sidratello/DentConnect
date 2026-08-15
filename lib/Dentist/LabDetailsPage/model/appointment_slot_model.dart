class AppointmentSlotModel {
  final int slotId;
  final DateTime date;
  final String time;
  final String period;

  AppointmentSlotModel({
    required this.slotId,
    required this.date,
    required this.time,
    required this.period,
  });

  factory AppointmentSlotModel.fromJson(Map<String, dynamic> json) {
    return AppointmentSlotModel(
      slotId: json['id'],
      date: DateTime.parse(json['appointmentDate']),
      time: json['appointmentTime'],
      period: json['timeFormatted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slotId': slotId,
      'date': date.toIso8601String(),
      'time': time,
      'period': period,
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
  String get dayName => arabicDays[date.weekday - 1];

  /// 9 أكتوبر 2026
  String get formattedDate =>
      '${date.day} ${arabicMonths[date.month - 1]} ${date.year}';

  /// 09:30 AM
  String get formattedTime => period;

  /// الجمعة، 9 أكتوبر 2026
  String get readableDate => '$dayName، $formattedDate';

  /// الجمعة، 9 أكتوبر 2026 • 09:30 AM
  String get fullDisplay => '$readableDate • $formattedTime';

  // String get dayName => DateFormat('EEEE', 'ar').format(date);
  // String get formattedDate => DateFormat('dd MMMM yyyy', 'ar').format(date);
  // /// Wednesday
  // // String get dayName => DateFormat('EEEE').format(date);
  // // /// 20 May 2026
  // // String get formattedDate => DateFormat('dd MMM yyyy').format(date);
  // /// 10:30 AM
  // String get formattedTime => '$time $period';
  // /// Wednesday, 20 May 2026
  // String get readableDate =>
  //     '$dayName, ${DateFormat('dd MMM yyyy').format(date)}';
  // /// Wednesday, 20 May 2026 • 10:30 AM
  // String get fullDisplay => '$readableDate • $formattedTime';
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
