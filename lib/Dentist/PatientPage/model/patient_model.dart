class PatientModel {
  int? patientId;
  int? caseOrderId;
  String? fullName;
  int? age;
  String? clinicalNotes;
  List<String>? processedTeeth;
  String? photos;
  List<UploadedFiles>? uploadedFiles;

  PatientModel(
      {this.patientId,
      this.caseOrderId,
      this.fullName,
      this.age,
      this.clinicalNotes,
      this.processedTeeth,
      this.photos,
      this.uploadedFiles});

  PatientModel.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    caseOrderId = json['caseOrderId'];
    fullName = json['fullName'];
    age = json['age'];
    clinicalNotes = json['clinicalNotes'];
    processedTeeth = json['processedTeeth'].cast<String>();
    photos = json['photos'];
    if (json['uploadedFiles'] != null) {
      uploadedFiles = <UploadedFiles>[];
      json['uploadedFiles'].forEach((v) {
        uploadedFiles!.add(UploadedFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['caseOrderId'] = caseOrderId;
    data['fullName'] = fullName;
    data['age'] = age;
    data['clinicalNotes'] = clinicalNotes;
    data['processedTeeth'] = processedTeeth;
    data['photos'] = photos;
    if (uploadedFiles != null) {
      data['uploadedFiles'] = uploadedFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UploadedFiles {
  int? fileId;
  String? path;
  String? fileType;

  UploadedFiles({this.fileId, this.path, this.fileType});

  UploadedFiles.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    path = json['path'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileId'] = fileId;
    data['path'] = path;
    data['fileType'] = fileType;
    return data;
  }
}
