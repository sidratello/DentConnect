class ComplaintModel {
  final int id;
  final String destination;
  final String title;
  final String text;
  final int userId;
  final int? targetLabId;
  final DateTime? createdAtUtc;
  final String? reply;
  final DateTime? repliedAtUtc;
  final String? repliedBy;

  const ComplaintModel({
    required this.id,
    required this.destination,
    required this.title,
    required this.text,
    required this.userId,
    this.targetLabId,
    this.createdAtUtc,
    this.reply,
    this.repliedAtUtc,
    this.repliedBy,
  });

  factory ComplaintModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ComplaintModel(
      id: json['id'] as int,
      destination: json['destination']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      text: json['text']?.toString() ?? '',
      userId: json['userId'] as int,
      targetLabId: json['targetLabId'] as int?,
      createdAtUtc: json['createdAtUtc'] != null
          ? DateTime.tryParse(
              json['createdAtUtc'].toString(),
            )
          : null,
      reply: json['reply']?.toString(),
      repliedAtUtc: json['repliedAtUtc'] != null
          ? DateTime.tryParse(
              json['repliedAtUtc'].toString(),
            )
          : null,
      repliedBy: json['repliedBy']?.toString(),
    );
  }
}
