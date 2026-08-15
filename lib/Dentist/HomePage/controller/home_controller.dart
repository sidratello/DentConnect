import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/model/advertisement_model.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
import 'package:template/Dentist/SearchLabsPage/model/search_lab_model.dart';
import 'package:template/core/api.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();

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

  @override
  void onInit() {
    fetchAdvertisement();
    fetchLabsLabels();
    super.onInit();
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

  Future<void> sendFollowRequest(int labId) async {
    try {
      var response = await apiService.post(
        'Connections/follow/$labId',
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'تم الإرسال',
          'تم إرسال طلب المتابعة بنجاح',
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
