import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/lab_feed_ad_model.dart';
import '../repository/lab_ad_feed_repository.dart';

class LabAdFeedController
    extends GetxController {
  final LabAdFeedRepository
      _repository;

  LabAdFeedController({
    required LabAdFeedRepository
        repository,
  }) : _repository =
            repository;

  final advertisements =
      <LabFeedAdModel>[].obs;

  final isLoading = false.obs;

  final errorMessage =
      RxnString();

  @override
  void onInit() {
    super.onInit();

    loadAdvertisements();
  }

  Future<void>
      loadAdvertisements() async {
    if (isLoading.value) {
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;

    try {
      final response =
          await _repository
              .getAdvertisements();

      if (!response.success ||
          response.data == null) {
        errorMessage.value =
            response.message;
        return;
      }

      advertisements.assignAll(
        response.data!.data,
      );
    } catch (error) {
      debugPrint(
        'Lab feed ads error: $error',
      );

      errorMessage.value =
          'حدث خطأ أثناء تحميل الإعلانات.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void>
      refreshAdvertisements() {
    return loadAdvertisements();
  }

  void goBack() {
    Get.back();
  }
}