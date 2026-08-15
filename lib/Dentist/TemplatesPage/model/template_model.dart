class CaseTemplate {
  final int id;
  final String title;
  final String workType;
  final List<String> materials;
  final String defaultShade;
  final String preferredImpression;
  final List<String> requiredImages;
  final int deliveryDays;
  final List<String> notes;
  final bool isUrgent;
  final bool needsTryIn;

  const CaseTemplate({
    required this.id,
    required this.title,
    required this.workType,
    required this.materials,
    required this.defaultShade,
    required this.preferredImpression,
    required this.requiredImages,
    required this.deliveryDays,
    required this.notes,
    required this.isUrgent,
    required this.needsTryIn,
  });

  factory CaseTemplate.fromJson(Map<String, dynamic> json) {
    return CaseTemplate(
      id: json['id'],
      title: json['title'],
      workType: json['workType'],
      materials: List<String>.from(json['materials']),
      defaultShade: json['defaultShade'],
      preferredImpression: json['preferredImpression'],
      requiredImages: List<String>.from(json['requiredImages']),
      deliveryDays: json['deliveryDays'],
      notes: List<String>.from(json['notes']),
      isUrgent: json['isUrgent'],
      needsTryIn: json['needsTryIn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'workType': workType,
      'materials': materials,
      'defaultShade': defaultShade,
      'preferredImpression': preferredImpression,
      'requiredImages': requiredImages,
      'deliveryDays': deliveryDays,
      'notes': notes,
      'isUrgent': isUrgent,
      'needsTryIn': needsTryIn,
    };
  }

  CaseTemplate copyWith({
    int? id,
    String? title,
    String? workType,
    List<String>? materials,
    String? defaultShade,
    String? preferredImpression,
    List<String>? requiredImages,
    int? deliveryDays,
    List<String>? notes,
    bool? isUrgent,
    bool? needsTryIn,
  }) {
    return CaseTemplate(
      id: id ?? this.id,
      title: title ?? this.title,
      workType: workType ?? this.workType,
      materials: materials ?? this.materials,
      defaultShade: defaultShade ?? this.defaultShade,
      preferredImpression: preferredImpression ?? this.preferredImpression,
      requiredImages: requiredImages ?? this.requiredImages,
      deliveryDays: deliveryDays ?? this.deliveryDays,
      notes: notes ?? this.notes,
      isUrgent: isUrgent ?? this.isUrgent,
      needsTryIn: needsTryIn ?? this.needsTryIn,
    );
  }
}
