import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/DoctorProfile/model/doctor_profile_model.dart';
import 'package:template/Dentist/HomePage/model/advertisement_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
import 'package:template/Dentist/NotificationsPage/model/app_notification_model.dart';
import 'package:template/Dentist/SearchLabsPage/model/search_lab_model.dart';
import 'package:template/core/storage_services.dart';
import 'package:template/core_dentist/api.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();
  static HomeController get to => Get.find<HomeController>();
  RxList labsIds = [].obs;
  RxList labsDetails = [].obs;
  var quickFilters = [];
  final RxBool isPreviewMode = false.obs;
  final RxInt selectedIndex = 0.obs;
  final selectedFilter = HomeFilter.none.obs;
  final selectedLocation = 'كل المواقع'.obs;
  RxBool isLoading = false.obs;
  final PageController adsPageController = PageController();
  final RxString searchText = ''.obs;
  final RxInt currentAdIndex = 0.obs;
  final RxnInt selectedLabId = RxnInt();
  final RxInt selectedType = 0.obs;
  final RxList<AppNotificationModel> notifications =
      <AppNotificationModel>[].obs;

  final RxBool isLoadingNotifications = false.obs;

  @override
  void onInit() {
    initPreviewMode();
    fetchAdvertisement();
    fetchLabsLabels();
    fetchDoctorProfile();
    fetchNotifications();
    super.onInit();
  }

  void initPreviewMode() async {
    String? token = await StorageService.to.getToken();
    String? accessMode = StorageService.to.read<String>('accessMode');
    isPreviewMode.value = accessMode == 'ReadOnly' || token == null;
  }

  void setPreviewMode(
    bool value,
  ) {
    isPreviewMode.value = value;
  }

  Future<void> selectFilter(HomeFilter filter) async {
    if (selectedFilter.value == filter || filter == HomeFilter.none) {
      selectedFilter.value = HomeFilter.none;

      labsDetails.clear();
      labsIds.clear();

      await fetchLabsLabels();
      return;
    }

    selectedFilter.value = filter;

    switch (filter) {
      case HomeFilter.location:
        await fetchLabsByLocation();
        break;

      case HomeFilter.none:
        break;
      case HomeFilter.topRated:
        await fetchLabsByRating();
        break;
      case HomeFilter.available:
        await fetchLabsByAvailability();
        break;
      case HomeFilter.mobileScanner:
        await fetchLabsByScanner();
        break;
      case HomeFilter.connected:
        await fetchLabsConnected();
        break;
      case HomeFilter.disconnected:
        await fetchLabsDisconnected();
        break;
    }
  }

  // apiServices

  Future<void> fetchLabsLabels() async {
    isLoading.value = true;
    List labs = [];

    var response = await apiService.get(
      'Labs/all',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        labs =
            (response.data as List).map((e) => LabModel.fromJson(e)).toList();
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } finally {
      labsIds.value = labs;
      labsDetails.value = labs;
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsByLocation() async {
    isLoading.value = true;

    try {
      var response = await apiService.get(
        'Ratings/filter-by-my-location',
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
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsByAvailability() async {
    isLoading.value = true;

    try {
      var response = await apiService.get(
        'Ratings/available-labs',
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
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsDisconnected() async {
    isLoading.value = true;

    try {
      var response = await apiService.get(
        'Labs/disconnected',
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
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsConnected() async {
    isLoading.value = true;

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
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsByRating() async {
    isLoading.value = true;

    try {
      var response = await apiService.get(
        'Ratings/ordered-by-rating',
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
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsByScanner() async {
    isLoading.value = true;

    try {
      var response = await apiService.get(
        'Ratings/with-scan-service',
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
      isLoading.value = false;
    }
  }

  RxList<AdvertisementModel> advertisements = <AdvertisementModel>[].obs;
  Future<void> fetchAdvertisement() async {
    isLoading.value = true;
    var response = await apiService.get(
      'Advertisement/dentists',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        advertisements.value = (response.data as List)
            .map((e) => AdvertisementModel.fromJson(e))
            .toList();
      } else {
        print('Failed to fetch advertisements: ${response.message}');
      }
    } finally {
      isLoading.value = false;
    }
  }

  final Rxn<DoctorProfileModel> doctorProfileModel = Rxn<DoctorProfileModel>();

  Future<void> fetchDoctorProfile() async {
    isLoading.value = true;

    try {
      final response = await apiService.get(
        'CaseOrders/dentist-personal-profile',
      );

      if (response.statusCode == 200) {
        print(response.data.toString());

        doctorProfileModel.value = DoctorProfileModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        print(
          'Failed to fetch doctor profile: ${response.message}',
        );
      }
    } catch (e) {
      print('Error fetching doctor profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchNotifications() async {
    isLoadingNotifications.value = true;

    try {
      final response = await apiService.get(
        'Notifications/doctor',
      );

      if (response.statusCode == 200) {
        final data = response.data as List;

        notifications.value = data
            .map(
              (item) => AppNotificationModel.fromJson(
                Map<String, dynamic>.from(item),
              ),
            )
            .toList();
      } else {
        notifications.clear();

        Get.snackbar(
          'خطأ',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'تعذر تحميل الإشعارات',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingNotifications.value = false;
    }
  }

  int get unreadNotificationsCount {
    return notifications.where((notification) => !notification.isRead).length;
  }

  Future<void> updateDoctorProfile({
    String? email,
    String? phone,
    String? cityPlace,
  }) async {
    isLoading.value = true;

    try {
      final response = await apiService.put(
        'CaseOrders/edit-personal-profile',
        data: {
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
          if (cityPlace != null) 'cityPlace': cityPlace,
        },
      );

      if (response.statusCode == 200) {
        await fetchDoctorProfile();

        Get.snackbar(
          'تم الحفظ',
          'تم تحديث بيانات الملف الشخصي بنجاح',
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
        'حدث خطأ أثناء تحديث بيانات الملف الشخصي',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  final Rxn<SearchLabModel> searchResult = Rxn<SearchLabModel>();
  RxList<Labs> searchLab = <Labs>[].obs;

  Future<bool> fetchLabSearchResult(String text) async {
    isLoading.value = true;

    var response = await apiService.post(
      'Search/labs',
      data: {
        'name': text,
      },
    );
    try {
      if (response.statusCode == 200) {
        final result = SearchLabModel.fromJson(response.data);
        searchLab.assignAll(result.labs ?? []);
        return true;
      } else {
        Get.snackbar(
          'خطأ',
          response.message,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendComplaintAdminRequest({
    required String title,
    required String description,
  }) async {
    try {
      final response = await apiService.post(
        'Complaints',
        data: {
          'Title': title,
          'Text': description,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الشكوى بنجاح',
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

  Future<void> sendComplaintLabRequest(
    int labId, {
    required String title,
    required String description,
  }) async {
    try {
      final response = await apiService.post(
        'Complaints/create/$labId',
        data: {
          'Title': title,
          'Text': description,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال الشكوى بنجاح',
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

enum HomeFilter {
  none,
  location,
  topRated,
  available,
  mobileScanner,
  connected,
  disconnected
}
