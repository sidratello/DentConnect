import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/Dentist/CaseDetailsPage/model/case_details_model.dart';
import 'package:template/Dentist/CasesPage/controller/case_controller.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Pages/select_patient_page.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Teeth/teeth_selector.dart';
import 'package:template/Dentist/LabDetailsPage/controller/lab_controller.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
import 'package:template/Dentist/MainPage/view/main_page.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';
import 'package:template/Dentist/TemplatesPage/model/template_data.dart';
import 'package:template/Dentist/TemplatesPage/model/template_model.dart';
import 'package:template/core_dentist/api.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import '../model/create_order_model.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderController extends GetxController {
  ApiService apiService = ApiService();
  RxList labsDetails = [].obs;
  final ImagePicker _imagePicker = ImagePicker();

  final RxList<PatientModel> patients = <PatientModel>[].obs;

  final model = CreateOrderModel().obs;

  int? selectedPatientId;
  final selectedLabId = RxnInt();
  final RxnInt createdOrderId = RxnInt();
  final RxList<CaseTemplate> templates = TemplateData.templates.obs;

  final compensationTypeController = TextEditingController();

  final currentStep = 0.obs;

  final selectedTemplate = RxnInt();

  final isLoading = false.obs;

  final isLoadingPatient = false.obs;
  final isLoadingLabs = false.obs;

  //=============================
  // Text Controllers
  //=============================

  final patientNameController = TextEditingController();

  final patientAgeController = TextEditingController();

  final patientClinicalNotesController = TextEditingController();

  final shadeController = TextEditingController();

  final materialController = TextEditingController();

  final expectedDaysController = TextEditingController();

  final notesController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final Rxn<CaseTemplate> selectedTemplateData = Rxn<CaseTemplate>();

  //=============================
  // Step One
  //=============================

  @override
  void onInit() {
    fetchTemplates();
    fetchPatientList();
    fetchLabsConnected();
    super.onInit();
  }

  void selectImpression(String value) {
    model.update((m) {
      m!.impressionType = value;
    });
  }

  void selectPatient(int? value) {
    selectedPatientId = value;
  }

  void selectCaseType(String value) {
    model.update((m) {
      m!.caseType = value;
    });
  }

  CaseTemplate getTemplate(int id) {
    return templates.where((t) => t.id == id).first;
  }

  void selectTemplate(int id) {
    selectedTemplate.value = id;

    model.update((m) {
      m!.templateId = id;
    });
    CaseTemplate template = getTemplate(id);
    model.value.shade = template.defaultShade;
    model.value.material = template.materials.join(', ');
    model.value.expectedDays = template.deliveryDays;
    model.value.notes = template.notes.join(', ');

    shadeController.text = template.defaultShade;
    materialController.text = template.materials.join(', ');
    expectedDaysController.text = template.deliveryDays.toString();
    notesController.text = template.notes.join(', ');
  }

  void skipTemplate() {
    selectedTemplate.value = null;
    selectedTemplateData.value = null;

    model.update((m) {
      m!.templateId = null;
    });
  }

  //=============================

  void nextStep() {
    model.update((m) {
      m!.patientName = patientNameController.text;

      m.shade = shadeController.text;

      m.material = materialController.text;

      m.expectedDays = int.tryParse(expectedDaysController.text) ?? 0;

      m.templateNotes = notesController.text;
    });

    currentStep.value = 1;
  }

  void previousStep() {
    currentStep.value = 0;
  }

  //=============================
// Compensation & Teeth
//=============================

  int? selectedCompensationType;

  final RxList<String> selectedCompensationTeeth = <String>[].obs;

  void selectCompensationType(int type) {
    selectedCompensationType = type;
    selectedCompensationTeeth.clear();
  }

  void toggleCompensationTooth(String tooth) {
    if (selectedCompensationTeeth.contains(tooth)) {
      selectedCompensationTeeth.remove(tooth);
    } else {
      selectedCompensationTeeth.add(tooth);
    }
  }

  bool isCompensationToothSelected(String tooth) {
    return selectedCompensationTeeth.contains(tooth);
  }

  void clearCompensationSelection() {
    selectedCompensationType = null;
    selectedCompensationTeeth.clear();
  }

  final RxList<File> images = <File>[].obs;

  Future<void> pickImages() async {
    try {
      final List<XFile> pickedImages = await _imagePicker.pickMultiImage(
        imageQuality: 85,
      );

      if (pickedImages.isEmpty) {
        return;
      }

      for (final image in pickedImages) {
        final file = File(image.path);

        final alreadyExists = images.any(
          (existingImage) => existingImage.path == file.path,
        );

        if (!alreadyExists) {
          images.add(file);
        }
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الصور',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
    }
  }

  final RxList<File> files = <File>[].obs;
  final Rxn<File> selectedFile = Rxn<File>();

  Future<void> pickFile() async {
    try {
      final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'stl',
          'ply',
          'obj',
          'zip',
        ],
      );

      if (pickedFile == null) {
        return;
      }

      final String? path =
          pickedFile.count > 0 ? pickedFile.files.single.path : null;

      if (path == null) {
        Get.snackbar(
          'خطأ',
          'تعذر الوصول إلى الملف المحدد',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      selectedFile.value = File(path);
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الملف',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeFile() {
    selectedFile.value = null;
  }

  bool validateOrder() {
    if (selectedLabId.value == null) {
      _showValidationError('يرجى اختيار المخبر');
      return false;
    }

    final String title = titleController.text.trim();

    if (title.isEmpty) {
      _showValidationError('يرجى إدخال عنوان الطلب');
      return false;
    }

    if (title.length < 3) {
      _showValidationError(
        'عنوان الطلب يجب أن يحتوي على 3 أحرف على الأقل',
      );
      return false;
    }

    if (model.value.impressionType == null ||
        model.value.impressionType!.trim().isEmpty) {
      _showValidationError('يرجى اختيار نوع الطبعة');
      return false;
    }

    if (model.value.caseType == null || model.value.caseType!.trim().isEmpty) {
      _showValidationError('يرجى اختيار نوع الحالة');
      return false;
    }

    if (shadeController.text.trim().isEmpty) {
      _showValidationError('يرجى إدخال لون التعويض');
      return false;
    }

    if (materialController.text.trim().isEmpty) {
      _showValidationError('يرجى إدخال مادة التعويض');
      return false;
    }

    final String expectedDays = expectedDaysController.text.trim();

    if (expectedDays.isEmpty) {
      _showValidationError('يرجى إدخال عدد أيام التسليم المتوقعة');
      return false;
    }

    final int? days = int.tryParse(expectedDays);

    if (days == null || days <= 0) {
      _showValidationError(
        'يرجى إدخال عدد أيام صحيح وأكبر من الصفر',
      );
      return false;
    }

    if (images.isEmpty) {
      _showValidationError('يرجى إضافة صورة واحدة على الأقل للحالة');
      return false;
    }

    return true;
  }

  void _showValidationError(String message) {
    Get.snackbar(
      'بيانات ناقصة',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> submitOrder() async {
    if (!validateOrder()) {
      return;
    }
    model.update((m) {
      m?.shade = shadeController.text.trim();
      m?.material = materialController.text.trim();
      m?.expectedDays = int.tryParse(expectedDaysController.text.trim()) ?? 0;
      m?.notes = notesController.text.trim();
    });

    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        barrierDismissible: false,
      );

      final response = await apiService.postListFiles(
        'CaseOrders/initiate/$selectedLabId',
        data: {
          'Title': titleController.text.trim(),
          'Shade': model.value.shade,
          'IsTemporary': model.value.caseType != 'final',
          'ImpressionType': model.value.impressionType,
          'IsUrgent': model.value.isUrgent,
          'HasAccessories': model.value.hasAccessory,
          'DeliveryDate': model.value.deliveryDate,
          'ImpressionStage': model.value.caseType != 'final'
              ? 'PlasticImpression'
              : 'FinalImpression',
        },
        fileKey: 'RequiredImages',
        files: images,
      );

      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      if (response.statusCode == 200) {
        createdOrderId.value = response.data['orderId'];

        Get.snackbar(
          'تم إنشاء الطلب',
          'تم إنشاء الطلب بنجاح، يمكنك الآن إضافة باقي التفاصيل',
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.to(
          () => const SelectPatientPage(),
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetOrder() {
    model.value = CreateOrderModel();

    selectedPatientId = null;
    selectedLabId.value = null;
    createdOrderId.value = null;

    currentStep.value = 0;

    selectedTemplate.value = null;

    selectedCompensationType = null;
    selectedCompensationTeeth.clear();
    addedCompensation = false;

    images.clear();
    files.clear();
    selectedFile.value = null;

    patientNameController.clear();
    patientAgeController.clear();
    patientClinicalNotesController.clear();

    titleController.clear();

    shadeController.clear();
    materialController.clear();
    expectedDaysController.clear();
    notesController.clear();

    compensationTypeController.clear();

    patientImages.clear();
  }

  Future<bool> createOrder2(
    int orderId, {
    required int compensationType,
    required List<int> toothNumbers,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'CompensationType': compensationType,
        'notes': notesController.text.trim(),
      };

      for (int i = 0; i < toothNumbers.length; i++) {
        data['ToothNumbers[$i]'] = toothNumbers[i];
      }

      final response = await apiService.post(
        'CaseOrders/$orderId/add-item',
        data: data,
      );

      if (response.statusCode == 200) {
        return true;
      }

      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }
  }

  Future<bool> addCompensation({
    int? orderId,
  }) async {
    final int? targetOrderId = orderId ?? createdOrderId.value;

    if (targetOrderId == null) {
      Get.snackbar(
        'تنبيه',
        'لم يتم إنشاء الطلب بعد',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (selectedCompensationType == null) {
      Get.snackbar(
        'تنبيه',
        'يرجى اختيار نوع التعويض',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (selectedCompensationTeeth.isEmpty) {
      Get.snackbar(
        'تنبيه',
        'يرجى اختيار سن واحد على الأقل',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    final success = await createOrder2(
      targetOrderId,
      compensationType: selectedCompensationType!,
      toothNumbers: selectedCompensationTeeth.map(int.parse).toList(),
    );

    if (success) {
      Get.snackbar(
        'تمت الإضافة',
        'تمت إضافة التعويض بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      clearCompensationSelection();

      addedCompensation = true;

      return true;
    }

    return false;
  }

  Future<void> fetchPatientList() async {
    isLoadingPatient.value = true;
    try {
      final response = await apiService.get(
        'CaseOrders/patients',
      );

      if (response.statusCode == 200) {
        print(response.data.toString());

        if (response.data is List) {
          patients.value = (response.data as List)
              .map(
                (e) => PatientModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        } else {
          patients.clear();

          print(
            'Unexpected response format: '
            '${response.data.runtimeType}',
          );
        }
      } else {
        patients.clear();

        print(
          'Failed to fetch patients: ${response.message}',
        );
      }
    } catch (e) {
      patients.clear();

      print(
        'Error fetching patients: $e',
      );
    } finally {
      isLoadingPatient.value = false;
    }
  }

  Future<void> fetchLabsConnected() async {
    isLoadingLabs.value = true;

    try {
      var response = await apiService.get(
        'Labs/connected',
      );

      if (response.statusCode == 200) {
        labsDetails.clear();

        labsDetails.addAll(
          (response.data as List).map((e) => LabModel.fromJson(e)).toList(),
        );
      } else {
        print('Failed to fetch nearby labs: ${response.message}');
      }
    } catch (e) {
      print('Error fetching nearby labs: $e');
    } finally {
      isLoadingLabs.value = false;
    }
  }

  final storage = GetStorage();
  static const String deletedKey = 'deletedTemplates';
  static const String customKey = 'customTemplates';

  bool addedCompensation = false;

  void fetchTemplates() {
    final deletedIds = List<int>.from(
      storage.read(deletedKey) ?? [],
    );

    templates.assignAll(
      TemplateData.templates.where(
        (e) => !deletedIds.contains(e.id),
      ),
    );

    final customTemplates = storage.read(customKey);

    if (customTemplates != null) {
      templates.addAll(
        (customTemplates as List).map((e) => CaseTemplate.fromJson(e)).toList(),
      );
    }
  }

  Future<void> uploadFile() async {
    final file = selectedFile.value;
    if (file == null) {
      Get.snackbar(
        'تنبيه',
        'يرجى اختيار ملف أولاً',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final fileName = file.path.split(Platform.pathSeparator).last;
    final extension = fileName.split('.').last.toLowerCase();

    if (extension != 'stl') {
      Get.snackbar(
        'نوع ملف غير صالح',
        'يرجى اختيار ملف STL فقط',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        barrierDismissible: false,
      );

      final response = await apiService.post(
        'files/upload-stl/$createdOrderId',
        file: file,
        fileKey: 'file',
      );

      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الملف بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );

        await sendNotification();
        resetOrder();

        final caseController = Get.find<CaseController>();

        await caseController.fetchCases();

        Get.offAll(
          () => MainPage(),
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final RxList<File> patientImages = <File>[].obs;

  Future<void> pickImagesPatient() async {
    try {
      final List<XFile> pickedImages = await _imagePicker.pickMultiImage(
        imageQuality: 85,
      );

      if (pickedImages.isEmpty) {
        return;
      }

      for (final pickedImage in pickedImages) {
        final file = File(pickedImage.path);

        final alreadyExists = patientImages.any(
          (existingImage) => existingImage.path == file.path,
        );

        if (!alreadyExists) {
          patientImages.add(file);
        }
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الصور',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeImagePatient(int index) {
    if (index >= 0 && index < patientImages.length) {
      patientImages.removeAt(index);
    }
  }

  void pickPatient() async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        barrierDismissible: false,
      );
      final response = await apiService.post(
        'CaseOrders/$createdOrderId/bind-patient/$selectedPatientId',
        data: {},
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم اختيار المريضة',
          'تم إنشاء المريضة بنجاح، يمكنك الآن إضافة باقي التفاصيل',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.to(() => const TeethSelector());
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> addNewPatient(
    int caseId, {
    required String fullName,
    required String age,
    required String clinicalNotes,
    required String processedTeeth,
    required List<File> photos,
  }) async {
    try {
      final response = await apiService.postListFiles(
        'CaseOrders/$caseId/add-patient',
        data: {
          'FullName': fullName,
          'Age': age,
          'ClinicalNotes': clinicalNotes,
          'ProcessedTeeth': processedTeeth,
        },
        fileKey: 'Photos',
        files: photos,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إنشاء المريض بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.back();
        fetchPatientList();
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendNotification() async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        barrierDismissible: false,
      );
      final response = await apiService.post(
        'CaseOrders/$createdOrderId/send-notification-to-lab/$selectedLabId',
        data: {},
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الإشعار إلى المختبر بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
