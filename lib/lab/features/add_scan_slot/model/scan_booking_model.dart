class ScanBookingModel {
  final int bookingId;
  final int slotId;
  final DateTime? date;
  final String time;
  final String timeFormatted;
  final String period;

  final int dentistId;
  final String dentistName;
  final String dentistEmail;
  final String dentistPhone;

  final String clinicName;
  final String clinicAddress;
  final String clinicCity;
  final String clinicCountry;

  final DateTime? bookedAt;

  const ScanBookingModel({
    required this.bookingId,
    required this.slotId,
    required this.date,
    required this.time,
    required this.timeFormatted,
    required this.period,
    required this.dentistId,
    required this.dentistName,
    required this.dentistEmail,
    required this.dentistPhone,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicCity,
    required this.clinicCountry,
    required this.bookedAt,
  });

  factory ScanBookingModel.fromJson(Map<String, dynamic> json) {
    return ScanBookingModel(
      bookingId: json['bookingId'] as int? ?? 0,
      slotId: json['slotId'] as int? ?? 0,
      date: DateTime.tryParse(
        json['date']?.toString() ?? '',
      ),
      time: json['time']?.toString() ?? '',
      timeFormatted: json['timeFormatted']?.toString() ?? '',
      period: json['period']?.toString().toUpperCase() ?? 'AM',
      dentistId: json['dentistId'] as int? ?? 0,
      dentistName: json['dentistName']?.toString() ?? '',
      dentistEmail: json['dentistEmail']?.toString() ?? '',
      dentistPhone: json['dentistPhone']?.toString() ?? '',
      clinicName: json['clinicName']?.toString() ?? '',
      clinicAddress: json['clinicAddress']?.toString() ?? '',
      clinicCity: json['clinicCity']?.toString() ?? '',
      clinicCountry: json['clinicCountry']?.toString() ?? '',
      bookedAt: DateTime.tryParse(
        json['bookedAt']?.toString() ?? '',
      ),
    );
  }
}