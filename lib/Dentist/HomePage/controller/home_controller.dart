import 'package:get/get.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
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

  @override
  Future<void> onInit() async {
    await fetchLabsLabels();
    await fetchLabsDetails();
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
      await fetchLabsDetails();
      return;
    }

    selectedFilter.value = filter;

    switch (filter) {
      case HomeFilter.location:
        await fetchLabsByLocation();
        break;

      case HomeFilter.none:
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
    var response = await apiService.get(
      'Labs/all',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        labsIds.value = response.data
            .map(
              (e) => LabModel.fromJson(e).id,
            )
            .toList();
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLabsDetails() async {
    isLoading.value = true;
    List nn = [];
    for (int id in labsIds) {
      var response = await apiService.get(
        'Ratings/lab-profile/$id',
      );
      try {
        if (response.statusCode == 200) {
          print(response.data.toString());
          nn.add(LabModel.fromJson(response.data));
        } else {
          print('Failed to fetch labs: ${response.message}');
        }
      } catch (e) {
        print('Error fetching lab details for ID $id: $e');
      }
    }
    labsDetails.addAll(nn);
    isLoading.value = false;
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
