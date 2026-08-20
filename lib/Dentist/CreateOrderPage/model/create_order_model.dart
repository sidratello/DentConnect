class CreateOrderModel {
  // Step 1

  String? impressionType; // traditional | digital

  String? caseType; // trial | final

  int? templateId;

  String patientName;

  String shade;

  String material;

  int expectedDays;

  String templateNotes;

  // Step 2

  List<int> selectedTeeth;

  String restorationType;

  List<String> images;

  List<String> digitalFiles;

  bool hasAccessory;

  bool isUrgent;

  DateTime? sendDate;

  DateTime? deliveryDate;

  String notes;

  CreateOrderModel({
    this.impressionType,
    this.caseType,
    this.templateId,
    this.patientName = '',
    this.shade = '',
    this.material = '',
    this.expectedDays = 0,
    this.templateNotes = '',
    this.selectedTeeth = const [],
    this.restorationType = '',
    this.images = const [],
    this.digitalFiles = const [],
    this.hasAccessory = false,
    this.isUrgent = false,
    this.sendDate,
    this.deliveryDate,
    this.notes = '',
  });

  Map<String, dynamic> toJson() {
    return {
      "impressionType": impressionType,
      "caseType": caseType,
      "templateId": templateId,
      "patientName": patientName,
      "shade": shade,
      "material": material,
      "expectedDays": expectedDays,
      "templateNotes": templateNotes,
      "selectedTeeth": selectedTeeth,
      "restorationType": restorationType,
      "hasAccessory": hasAccessory,
      "isUrgent": isUrgent,
      "sendDate": sendDate?.toIso8601String(),
      "deliveryDate": deliveryDate?.toIso8601String(),
      "notes": notes,
    };
  }
}
