class CaseModel {
  List<CaseItem>? pending;
  List<CaseItem>? accepted;
  List<CaseItem>? requestInfo;
  List<CaseItem>? inDesign;
  List<CaseItem>? inProduction;
  List<CaseItem>? inColoring;
  List<CaseItem>? ready;
  List<CaseItem>? delivered;
  List<CaseItem>? waitingForClarification;
  List<CaseItem>? cancelled;

  CaseModel({
    this.pending,
    this.accepted,
    this.requestInfo,
    this.inDesign,
    this.inProduction,
    this.inColoring,
    this.ready,
    this.delivered,
    this.waitingForClarification,
    this.cancelled,
  });

  CaseModel.fromJson(Map<String, dynamic> json) {
    pending = _parseCaseItems(json['Pennding']);
    accepted = _parseCaseItems(json['Accepted']);
    requestInfo = _parseCaseItems(json['RequestInfo']); //
    inDesign = _parseCaseItems(json['InDesign']);
    inProduction = _parseCaseItems(json['InProduction']); //
    inColoring = _parseCaseItems(json['InColoring']);
    ready = _parseCaseItems(json['Ready']);
    delivered = _parseCaseItems(json['Delivered']);
    waitingForClarification = _parseCaseItems(json['WaitingForClarification']);
    cancelled = _parseCaseItems(json['Cancelled']);
  }

  static List<CaseItem> _parseCaseItems(dynamic value) {
    if (value == null || value is! List) {
      return [];
    }

    return value
        .map(
          (item) => CaseItem.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'Pennding': pending?.map((e) => e.toJson()).toList() ?? [],
      'Accepted': accepted?.map((e) => e.toJson()).toList() ?? [],
      'RequestInfo': requestInfo?.map((e) => e.toJson()).toList() ?? [],
      'InDesign': inDesign?.map((e) => e.toJson()).toList() ?? [],
      'InProduction': inProduction?.map((e) => e.toJson()).toList() ?? [],
      'InColoring': inColoring?.map((e) => e.toJson()).toList() ?? [],
      'Ready': ready?.map((e) => e.toJson()).toList() ?? [],
      'Delivered': delivered?.map((e) => e.toJson()).toList() ?? [],
      'WaitingForClarification':
          waitingForClarification?.map((e) => e.toJson()).toList() ?? [],
      'Cancelled': cancelled?.map((e) => e.toJson()).toList() ?? [],
    };
  }
}

class CaseItem {
  int? id;
  String? title;
  String? status;
  String? impressionStage;
  String? impressionType;
  String? shade;
  bool? isTemporary;
  bool? isUrgent;
  bool? hasAccessories;
  String? notes;
  List<String>? requiredImages;
  String? deliveryDate;
  String? createdAt;
  double? estimatedPrice;
  double? finalPrice;
  double? totalPriceToPay;
  bool? isPaid;
  Patient? patient;
  AssignedLab? assignedLab;
  List<OrderItems>? orderItems;
  List<CaseFile>? files;

  CaseItem({
    this.id,
    this.title,
    this.status,
    this.impressionStage,
    this.impressionType,
    this.shade,
    this.isTemporary,
    this.isUrgent,
    this.hasAccessories,
    this.notes,
    this.requiredImages,
    this.deliveryDate,
    this.createdAt,
    this.estimatedPrice,
    this.finalPrice,
    this.totalPriceToPay,
    this.isPaid,
    this.patient,
    this.assignedLab,
    this.orderItems,
    this.files,
  });

  CaseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    impressionStage = json['impressionStage'];
    impressionType = json['impressionType'];
    shade = json['shade'];
    isTemporary = json['isTemporary'];
    isUrgent = json['isUrgent'];
    hasAccessories = json['hasAccessories'];
    notes = json['notes'];

    if (json['requiredImages'] != null && json['requiredImages'] is List) {
      requiredImages = List<String>.from(
        json['requiredImages'],
      );
    }

    deliveryDate = json['deliveryDate'];
    createdAt = json['createdAt'];

    estimatedPrice = _toDouble(
      json['estimatedPrice'],
    );

    finalPrice = _toDouble(
      json['finalPrice'],
    );

    totalPriceToPay = _toDouble(
      json['totalPriceToPay'],
    );

    isPaid = json['isPaid'];

    // Patient
    patient = json['patient'] != null
        ? Patient.fromJson(
            json['patient'] as Map<String, dynamic>,
          )
        : null;

    // Assigned Lab
    assignedLab = json['assignedLab'] != null
        ? AssignedLab.fromJson(
            json['assignedLab'] as Map<String, dynamic>,
          )
        : null;

    // Order Items
    if (json['orderItems'] != null && json['orderItems'] is List) {
      orderItems = (json['orderItems'] as List)
          .map(
            (item) => OrderItems.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    // Files
    if (json['files'] != null && json['files'] is List) {
      files = (json['files'] as List)
          .map(
            (file) => CaseFile.fromJson(
              file as Map<String, dynamic>,
            ),
          )
          .toList();
    }
  }

  static double? _toDouble(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(
      value.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'impressionStage': impressionStage,
      'impressionType': impressionType,
      'shade': shade,
      'isTemporary': isTemporary,
      'isUrgent': isUrgent,
      'hasAccessories': hasAccessories,
      'notes': notes,
      'requiredImages': requiredImages,
      'deliveryDate': deliveryDate,
      'createdAt': createdAt,
      'estimatedPrice': estimatedPrice,
      'finalPrice': finalPrice,
      'totalPriceToPay': totalPriceToPay,
      'isPaid': isPaid,
      'patient': patient?.toJson(),
      'assignedLab': assignedLab?.toJson(),
      'orderItems': orderItems?.map((e) => e.toJson()).toList(),
      'files': files?.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseFile {
  int? id;
  String? url;

  CaseFile({
    this.id,
    this.url,
  });

  CaseFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}

class Patient {
  int? id;
  String? fullName;
  int? age;
  String? clinicalNotes;

  Patient({
    this.id,
    this.fullName,
    this.age,
    this.clinicalNotes,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    age = json['age'];
    clinicalNotes = json['clinicalNotes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'age': age,
      'clinicalNotes': clinicalNotes,
    };
  }
}

class AssignedLab {
  int? id;
  String? labName;
  String? phone;
  String? city;
  String? profilePictureUrl;

  AssignedLab({
    this.id,
    this.labName,
    this.phone,
    this.city,
    this.profilePictureUrl,
  });

  AssignedLab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['labName'];
    phone = json['phone'];
    city = json['city'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'labName': labName,
      'phone': phone,
      'city': city,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}

class OrderItems {
  int? id;
  String? compensationType;
  List<int>? toothNumbers;

  OrderItems({
    this.id,
    this.compensationType,
    this.toothNumbers,
  });

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compensationType = json['compensationType'];

    if (json['toothNumbers'] != null && json['toothNumbers'] is List) {
      toothNumbers = List<int>.from(
        json['toothNumbers'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'compensationType': compensationType,
      'toothNumbers': toothNumbers,
    };
  }
}
