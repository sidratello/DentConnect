class ScanSlotModel {
  final int id;
  final DateTime? date;
  final String time;
  final String timeFormatted;
  final String period;
  final bool isBooked;
  final DateTime? createdAt;

  const ScanSlotModel({
    required this.id,
    required this.date,
    required this.time,
    required this.timeFormatted,
    required this.period,
    required this.isBooked,
    required this.createdAt,
  });

  factory ScanSlotModel.fromJson(Map<String, dynamic> json) {
    return ScanSlotModel(
      id: json['id'] as int? ?? 0,
      date: DateTime.tryParse(json['date']?.toString() ?? ''),
      time: json['time']?.toString() ?? '',
      timeFormatted: json['timeFormatted']?.toString() ?? '',
      period: json['period']?.toString() ?? '',
      isBooked: json['isBooked'] as bool? ?? false,
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),
    );
  }
}