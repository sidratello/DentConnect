class LabComplaintModel {
  final int id;
  final String title;
  final String text;

  final String dentistName;
  final int dentistId;

  final DateTime? createdAtUtc;

  final String? reply;
  final DateTime? repliedAtUtc;

  const LabComplaintModel({
    required this.id,
    required this.title,
    required this.text,
    required this.dentistName,
    required this.dentistId,
    required this.createdAtUtc,
    required this.reply,
    required this.repliedAtUtc,
  });

  bool get isAnswered =>
      reply != null &&
      reply!.trim().isNotEmpty;

  factory LabComplaintModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LabComplaintModel(
      id: (json['id'] as num?)?.toInt() ?? 0,

      title:
          json['title']?.toString().trim() ??
              '',

      text:
          json['text']?.toString().trim() ??
              '',

      dentistName:
          json['dentistName']
                  ?.toString()
                  .trim() ??
              '',

      dentistId:
          (json['dentistId'] as num?)
                  ?.toInt() ??
              0,

      createdAtUtc: DateTime.tryParse(
        json['createdAtUtc']?.toString() ??
            '',
      ),

      reply: json['reply']
          ?.toString()
          .trim(),

      repliedAtUtc: DateTime.tryParse(
        json['repliedAtUtc']?.toString() ??
            '',
      ),
    );
  }
}