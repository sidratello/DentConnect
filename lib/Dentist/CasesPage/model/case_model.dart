import 'case_status.dart';

class CaseModel {
  final int id;
  final String imagePath;
  final String compensationName;
  final String compensationDescription;
  final String price;
  final double rating;
  final CaseStatus status;
  final bool isRated;

  const CaseModel({
    required this.id,
    required this.imagePath,
    required this.compensationName,
    required this.compensationDescription,
    required this.price,
    required this.rating,
    required this.status,
    this.isRated = false,
  });
}
