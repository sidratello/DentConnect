import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/repository/signup_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/core/app_router.dart';
class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  final isPasswordVisible = false.obs;
  final SignupRepo _repo = SignupRepo();
  final isLoading = false.obs;
final isPickingFile = false.obs;
 final Rxn<File> verificationDocument = Rxn<File>();
 final hasScanner = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final namePlaceController = TextEditingController();
  final addressPlaceController = TextEditingController();
  final cityPlaceController = TextEditingController();
  final countryPlaceController = TextEditingController();
late final String role;

bool get isLab => role == 'Lab';
bool get isDentist => role == 'Dentist';
@override
void onInit() {
  super.onInit();
  role = Get.arguments ?? 'Dentist';
}
  void toggleScanner(bool value) {
    hasScanner.value = value;
  }
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      
    }
  }
Future<void> pickVerificationDocument() async {
  if (isPickingFile.value) return;

  try {
    isPickingFile.value = true;

    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      verificationDocument.value = File(pickedFile.path);
    }
  } catch (e) {
    Get.snackbar('خطأ', 'لم يتم اختيار الملف');
  } finally {
    isPickingFile.value = false;
  }
}

Future<void> signup() async {
  if (isDentist) {
    await signupDentist();
  } else {
    await signupLab();
  }
}

   Future<void> signupDentist() async {
if (verificationDocument.value == null) {
    Get.snackbar(
      'تنبيه',
      'الرجاء رفع وثيقة الانتساب لنقابة الأطباء',
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

    isLoading.value = true;

    final response = await _repo.signupDentist(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
      namePlace: namePlaceController.text.trim(),
      addressPlace: addressPlaceController.text.trim(),
      cityPlace: cityPlaceController.text.trim(),
      countryPlace: countryPlaceController.text.trim(),
      verificationDocument: verificationDocument.value!,
    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        'تم بنجاح',
        'تم إنشاء الحساب وهو بانتظار التحقق',
        snackPosition: SnackPosition.BOTTOM,
      );

      print(response.data);
      Get.toNamed(
  AppRouter.OTPpage,
  arguments: emailController.text.trim(),
);
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


 Future<void> signupLab() async {
    isLoading.value = true;

    final response = await _repo.signupLab(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
      namePlace: namePlaceController.text.trim(),
      addressPlace: addressPlaceController.text.trim(),
      cityPlace: cityPlaceController.text.trim(),
      countryPlace: countryPlaceController.text.trim(),
      hasScanVisitService: hasScanner.value,
    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        'تم بنجاح',
         'تم إنشاء الحساب وهو بانتظار التحقق',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.toNamed(
  AppRouter.OTPpage,
  arguments: emailController.text.trim(),
);
    } else {
      Get.snackbar(
        'خطأ',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }






  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    pageController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    namePlaceController.dispose();
    addressPlaceController.dispose();
    cityPlaceController.dispose();
    countryPlaceController.dispose();

  super.onClose();
  }
}

