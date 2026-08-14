
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/repositry/edit_profile_repo.dart' show updateLabProfile, addLabPrice, getCompensationTypesRepo, deleteLabPrice, updateLabPrice, addGalleryImageRepo, deleteGalleryImageRepo, uploadLabProfilePictureRepo, deleteLabProfilePictureRepo, getMyFatoorahSupplierCodeRepo, updateMyFatoorahSupplierCodeRepo;

import 'package:template/lab/features/profile/repositry/profile_repo.dart';

class EditLabProfileController extends GetxController {
    final formKey = GlobalKey<FormState>();
 final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final namePlaceController = TextEditingController();
final addressController = TextEditingController();
final cityController = TextEditingController();
final countryController = TextEditingController();
final descriptionController = TextEditingController();
final yearsController = TextEditingController();
  final isLoading = false.obs;
  final LabProfileRepo repo = LabProfileRepo();

final myFatoorahCodeController =
    TextEditingController();

final isMyFatoorahCodeLoading =
    false.obs;


final hasScanVisitService = false.obs;
void changeScanService(bool value) {
  hasScanVisitService.value = value;
}

final profilePictureUrl = ''.obs;
final selectedProfilePicture = Rxn<File>();
final isProfilePictureLoading = false.obs;

bool get hasProfilePicture {
  return selectedProfilePicture.value != null ||
      profilePictureUrl.value.trim().isNotEmpty;
}




 Future<void> pickAndUploadProfilePicture() async {
    if (isProfilePictureLoading.value) return;

    final bool hadPreviousPicture = hasProfilePicture;

    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1600,
      maxHeight: 1600,
    );

    if (pickedImage == null) return;

    final previousLocalImage = selectedProfilePicture.value;
    final previousNetworkUrl = profilePictureUrl.value;

    final selectedFile = File(pickedImage.path);

    selectedProfilePicture.value = selectedFile;
    isProfilePictureLoading.value = true;

    try {
      final response = await uploadLabProfilePictureRepo(
        image: selectedFile,
      );

      if (!response.success) {
        selectedProfilePicture.value = previousLocalImage;
        profilePictureUrl.value = previousNetworkUrl;

        Get.snackbar(
          'خطأ',
          response.message,
        );
        return;
      }
        final String returnedUrl =
          response.data?['profilePictureUrl']?.toString().trim() ?? '';

      if (returnedUrl.isNotEmpty) {
        profilePictureUrl.value = returnedUrl;
        selectedProfilePicture.value = null;
      }

      Get.snackbar(
        'تم',
        hadPreviousPicture
            ? 'تم تغيير صورة المختبر بنجاح'
            : 'تمت إضافة صورة المختبر بنجاح',
      );
    } catch (error) {
      selectedProfilePicture.value = previousLocalImage;
      profilePictureUrl.value = previousNetworkUrl;

      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء رفع صورة المختبر',
      );
    } finally {
      isProfilePictureLoading.value = false;
    }
  }






  // حذف صورة المختبر
  Future<void> deleteProfilePicture() async {
    if (isProfilePictureLoading.value || !hasProfilePicture) {
      return;
    }

    isProfilePictureLoading.value = true;

    try {
      final response = await deleteLabProfilePictureRepo();

      if (!response.success) {
        Get.snackbar(
          'خطأ',
          response.message,
        );
        return;
      }

      profilePictureUrl.value = '';
      selectedProfilePicture.value = null;

      Get.snackbar(
        'تم',
        'تم حذف صورة المختبر بنجاح',
      );
    } catch (error) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء حذف صورة المختبر',
      );
    } finally {
      isProfilePictureLoading.value = false;
    }
  }



  @override
  void onInit() {
    super.onInit();
    getCompensationTypes();
    getMyFatoorahSupplierCode();
final profile = Get.arguments as LabProfileModel;
hasScanVisitService.value = profile.hasScanVisitService;
nameController.text = profile.owner.name;
emailController.text = profile.owner.email;
phoneController.text = profile.owner.phone;
namePlaceController.text = profile.owner.namePlace;
addressController.text = profile.owner.addressPlace;
cityController.text = profile.owner.cityPlace;
countryController.text = profile.owner.countryPlace;
descriptionController.text = profile.description;
yearsController.text = profile.yearsOfExperience.toString();
selectedSpecialties.assignAll(profile.specialties);
selectedMaterials.assignAll(
  profile.materials.where((e) => e != '[]'),
);
if (profile.availability == 'Available') {
  availability.value = 0;
} else if (profile.availability == 'Busy') {
  availability.value = 1;
} else {
  availability.value = 2;
}
 }




final selectedMaterials = <String>[].obs;






final materialController = TextEditingController();

void addMaterial() {
  final material = materialController.text.trim();

 if (material.isEmpty) {
    materialController.clear();
    return;
  }


  if (selectedMaterials.contains(material)) {
    Get.snackbar('تنبيه', 'هذه المادة مضافة مسبقاً');
    return;
  }

  selectedMaterials.add(material);
  materialController.clear();
    selectedMaterials.refresh();
}

void removeMaterial(String material) {
  selectedMaterials.remove(material);
}




final selectedSpecialties = <String>[].obs;
void toggleSpecialty(String value) {
  if (selectedSpecialties.contains(value)) {
    selectedSpecialties.remove(value);
  } else {
    selectedSpecialties.add(value);
  }
}


final availability = 0.obs;
void changeAvailability(int value) {
  availability.value = value;
}




  Future<void> updateProfile() async {
      if (materialController.text.trim().isNotEmpty) {
    addMaterial();
  }
  print('materials sent: ${selectedMaterials.toList()}');
    isLoading.value = true;
final response = await updateLabProfile(
  name: nameController.text.trim(),
  email: emailController.text.trim(),
  phone: phoneController.text.trim(),
  namePlace: namePlaceController.text.trim(),
  addressPlace: addressController.text.trim(),
  cityPlace: cityController.text.trim(),
  countryPlace: countryController.text.trim(),
  description: descriptionController.text.trim(),
  yearsOfExperience: yearsController.text.trim(),
    specialties: selectedSpecialties,
   materials: selectedMaterials.toList(),
      availability: availability.value.toString(),
      hasScanVisitService: hasScanVisitService.value,
);

    isLoading.value = false;

   if (response.success) {
  final profileController = Get.find<LabProfileController>();

  await profileController.getProfile();

  Get.back();

  Get.snackbar('تم', 'تم تعديل الملف الشخصي بنجاح');
} else {
      Get.snackbar('خطأ', response.message);
    }
  }




final compensationTypeController = TextEditingController();
final unitPriceController = TextEditingController();
final notesController = TextEditingController();
final priceFormKey = GlobalKey<FormState>();

final compensationTypes = <String>[].obs;
final selectedCompensationType = RxnString();

Future<void> addPrice() async {
  if (!priceFormKey.currentState!.validate()) {
    return;
  }

  if (selectedCompensationType.value == null) {
    Get.snackbar('خطأ', 'اختر نوع التعويض');
    return;
  }

  final response = await addLabPrice(
    compensationType: selectedCompensationType.value!,
    unitPrice: unitPriceController.text.trim(),
    notes: notesController.text.trim(),
  );

  if (response.success) {
    unitPriceController.clear();
    notesController.clear();

    final profileController = Get.find<LabProfileController>();
    await profileController.getProfile();

    Get.snackbar('تم', 'تمت إضافة السعر بنجاح');
  } else {
    Get.snackbar('خطأ', response.message);
  }
}



Future<void> getCompensationTypes() async {
  final response = await getCompensationTypesRepo();

  if (response.success) {
    compensationTypes.value = List<String>.from(response.data ?? []);

    if (compensationTypes.isNotEmpty) {
      selectedCompensationType.value = compensationTypes.first;
    }
  } else {
    Get.snackbar('خطأ', response.message);
  }
}
Future<void> updatePrice({
  required int priceId,
  required String unitPrice,
}) async {
  final response = await updateLabPrice(
    priceId: priceId,
    unitPrice: unitPrice,
  );

  if (response.success) {
    final profileController = Get.find<LabProfileController>();
    await profileController.getProfile();

    Get.snackbar('تم', 'تم تعديل السعر بنجاح');
  } else {
    Get.snackbar('خطأ', response.message);
  }
}

Future<void> deletePrice(int priceId) async {
  final response = await deleteLabPrice(priceId: priceId);

  if (response.success) {
    final profileController = Get.find<LabProfileController>();
    await profileController.getProfile();

    Get.snackbar('تم', 'تم حذف السعر بنجاح');
  } else {
    Get.snackbar('خطأ', response.message);
  }
}


final ImagePicker picker = ImagePicker();

Future<void> addGalleryImage() async {
  final XFile? pickedImage = await picker.pickImage(
    source: ImageSource.gallery,
  );

  if (pickedImage == null) return;

  final response = await addGalleryImageRepo(
    image: File(pickedImage.path),
  );

  if (response.success) {
    final profileController = Get.find<LabProfileController>();
    await profileController.getProfile();

    Get.snackbar('تم', 'تمت إضافة الصورة بنجاح');
  } else {
    Get.snackbar('خطأ', response.message);
  }
}




Future<void> deleteGalleryImage(int imageId) async {
  final response = await deleteGalleryImageRepo(
    imageId: imageId,
  );

  if (response.success) {
    final profileController = Get.find<LabProfileController>();
    await profileController.getProfile();

    Get.snackbar('تم', 'تم حذف الصورة بنجاح');
  } else {
    Get.snackbar('خطأ', response.message);
  }
}



Future<void>
    getMyFatoorahSupplierCode()
    async {
  final response =
      await getMyFatoorahSupplierCodeRepo();

  if (!response.success ||
      response.data == null) {
    return;
  }

  myFatoorahCodeController.text =
      response
              .data?[
                  'myFatoorahSupplierCode']
              ?.toString() ??
          '';
}



Future<void>
    updateMyFatoorahSupplierCode()
    async {
  final code =
      myFatoorahCodeController.text
          .trim();

  if (code.isEmpty) {
    Get.snackbar(
      'تنبيه',
      'يرجى إدخال كود حساب المختبر',
    );
    return;
  }

  if (isMyFatoorahCodeLoading.value) {
    return;
  }

  isMyFatoorahCodeLoading.value =
      true;

  try {
    final response =
        await updateMyFatoorahSupplierCodeRepo(
      code: code,
    );

    if (!response.success) {
      Get.snackbar(
        'خطأ',
        response.message,
      );
      return;
    }

    final returnedCode =
        response
            .data?[
                'myFatoorahSupplierCode']
            ?.toString();

    if (returnedCode != null &&
        returnedCode.isNotEmpty) {
      myFatoorahCodeController.text =
          returnedCode;
    }

    if (Get.isRegistered<
        LabProfileController>()) {
      await Get.find<
              LabProfileController>()
          .getMyFatoorahSupplierCode();
    }


    

    Get.snackbar(
      'تم',
      'تم تحديث كود حساب المخبر بنجاح',
    );
  } finally {
    isMyFatoorahCodeLoading.value =
        false;
  }
}


  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    namePlaceController.dispose();
    addressController.dispose();
    yearsController.dispose();
    myFatoorahCodeController.dispose();
    super.onClose();
  }
}