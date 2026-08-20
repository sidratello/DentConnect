class CaseStatusModel {
  final String status;
  final int count;

  CaseStatusModel({
    required this.status,
    required this.count,
  });
}

class CaseStatusCountModel {
  final String status;
  final int count;

  CaseStatusCountModel({
    required this.status,
    required this.count,
  });

  factory CaseStatusCountModel.fromJson(Map<String, dynamic> json) {
    return CaseStatusCountModel(
      status: json['status'] ?? '',
      count: json['count'] ?? 0,
    );
  }
}