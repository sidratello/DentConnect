class CaseDetailsModel {
  final String patientName;
  final List<String> images;
  final String teethNumbers;
  final String restorationType;
  final String color;
  final String impressionType;
  final String shortDescription;
  final double? doctorRating;
  final double? price;
  final bool hasTemplate;
  final String templateName;
  final bool hasAccessory;
  final bool isUrgent;
  final String sentDate;
  final String deliveryDate;
  final String notes;
  final String status;
  final String caseNumber;

  const CaseDetailsModel({
    required this.patientName,
    required this.images,
    required this.teethNumbers,
    required this.restorationType,
    required this.color,
    required this.impressionType,
    required this.shortDescription,
    required this.doctorRating,
    required this.price,
    required this.hasTemplate,
    required this.templateName,
    required this.hasAccessory,
    required this.isUrgent,
    required this.sentDate,
    required this.deliveryDate,
    required this.notes,
    required this.status,
    required this.caseNumber,
  });
}
