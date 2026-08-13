import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_router.dart';
import 'package:template/lab/features/lab_ad_payment/repositry/ad_payment_repository.dart';

import '../model/lab_ad_model.dart';
import '../repository/lab_ads_repository.dart';

enum LabAdsTab {
  pendingPayment,
  active,
}

class LabAdsController
    extends GetxController {
  final LabAdsRepository
      _repository;

  final LabAdPaymentRepository
      _paymentRepository;

  LabAdsController({
    required LabAdsRepository
        repository,
    required LabAdPaymentRepository
        paymentRepository,
  })  : _repository =
            repository,
        _paymentRepository =
            paymentRepository;

  final payingAdId =
      RxnInt();

  final selectedTab =
      LabAdsTab
          .pendingPayment.obs;

  final pendingPaymentAds =
      <LabAdModel>[].obs;

  final activeAds =
      <LabAdModel>[].obs;

  final isLoadingPending =
      false.obs;

  final isLoadingActive =
      false.obs;

  final pendingError =
      RxnString();

  final activeError =
      RxnString();

  List<LabAdModel>
      get currentAds {
    switch (
        selectedTab.value) {
      case LabAdsTab
          .pendingPayment:
        return pendingPaymentAds;

      case LabAdsTab.active:
        return activeAds;
    }
  }

  bool get isCurrentTabLoading {
    switch (
        selectedTab.value) {
      case LabAdsTab
          .pendingPayment:
        return isLoadingPending
            .value;

      case LabAdsTab.active:
        return isLoadingActive
            .value;
    }
  }

  String? get currentError {
    switch (
        selectedTab.value) {
      case LabAdsTab
          .pendingPayment:
        return pendingError
            .value;

      case LabAdsTab.active:
        return activeError.value;
    }
  }

  int get pendingCount =>
      pendingPaymentAds.length;

  int get activeCount =>
      activeAds.length;

  bool get isPendingTab =>
      selectedTab.value ==
      LabAdsTab
          .pendingPayment;

  @override
  void onInit() {
    super.onInit();

    loadPendingPaymentAds();
    loadActiveAds();
  }

  void selectTab(
    LabAdsTab tab,
  ) {
    selectedTab.value = tab;

    if (tab ==
            LabAdsTab
                .pendingPayment &&
        pendingPaymentAds
            .isEmpty &&
        !isLoadingPending
            .value) {
      loadPendingPaymentAds();
    }

    if (tab ==
            LabAdsTab.active &&
        activeAds.isEmpty &&
        !isLoadingActive
            .value) {
      loadActiveAds();
    }
  }

  Future<void>
      loadPendingPaymentAds()
      async {
    if (isLoadingPending
        .value) {
      return;
    }

    isLoadingPending.value =
        true;

    pendingError.value =
        null;

    try {
      final response =
          await _repository
              .getPendingPaymentAds();

      if (!response.success ||
          response.data == null) {
        pendingError.value =
            response.message;
        return;
      }

      pendingPaymentAds
          .assignAll(
        response.data!.data,
      );
    } catch (error) {
      debugPrint(
        'Pending ads error: $error',
      );

      pendingError.value =
          'حدث خطأ أثناء تحميل الإعلانات.';
    } finally {
      isLoadingPending.value =
          false;
    }
  }

  Future<void>
      loadActiveAds() async {
    if (isLoadingActive
        .value) {
      return;
    }

    isLoadingActive.value =
        true;

    activeError.value =
        null;

    try {
      final response =
          await _repository
              .getActiveAds();

      if (!response.success ||
          response.data == null) {
        activeError.value =
            response.message;
        return;
      }

      activeAds.assignAll(
        response.data!.data,
      );
    } catch (error) {
      debugPrint(
        'Active ads error: $error',
      );

      activeError.value =
          'حدث خطأ أثناء تحميل الإعلانات.';
    } finally {
      isLoadingActive.value =
          false;
    }
  }

  Future<void>
      refreshCurrentTab() {
    if (isPendingTab) {
      return loadPendingPaymentAds();
    }

    return loadActiveAds();
  }

  Future<void>
      refreshAdsAfterPayment()
      async {
    await Future.wait([
      loadPendingPaymentAds(),
      loadActiveAds(),
    ]);
  }

  Future<void>
      openAdvertisementDetails(
    LabAdModel advertisement,
  ) async {
    final result =
        await Get.toNamed(
      AppRouter.labAdDetails,
      arguments: advertisement,
    );

    if (result ==
        'paymentSuccess') {
      await refreshAdsAfterPayment();
    }
  }

  Future<void>
      payAdvertisement(
    LabAdModel advertisement,
  ) async {
    if (payingAdId.value !=
        null) {
      return;
    }

    payingAdId.value =
        advertisement.id;

    try {
      final response =
          await _paymentRepository
              .createPaymentLink(
        advertisementId:
            advertisement.id,
        currency: 'USD',
      );

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition:
              SnackPosition.BOTTOM,
        );
        return;
      }
      final paymentLink =
    response.data!.paymentLink;
debugPrint(
  'PAY FROM LIST: '
  'adId=${advertisement.id}, '
  'url=$paymentLink',
);
      final result =
          await Get.toNamed(
        AppRouter.labAdPayment,
        arguments: {
          'url': response
              .data!
              .paymentLink,
          'advertisementId':
              advertisement.id,
        },
      );

      if (result ==
          'paymentSuccess') {
        await refreshAdsAfterPayment();
      }
    } finally {
      payingAdId.value =
          null;
    }
  }

  void goBack() {
    Get.back();
  }
}