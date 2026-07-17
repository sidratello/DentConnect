class PatientModel {
  final String name;

  final String clinicalNotes;

  final String xrayImage;

  final List<String> teethImages;

  const PatientModel({
    required this.name,
    required this.clinicalNotes,
    required this.xrayImage,
    required this.teethImages,
  });
}
