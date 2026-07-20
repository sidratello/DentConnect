import 'package:get/get.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
import 'package:template/core/api.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();

  var labsIds = [];
  var labsDetails = [];
  var quickFilters = [];
  final RxBool isPreviewMode = false.obs;
  final topRated = false.obs;
  final location = false.obs;
  final available = false.obs;
  final mobileScanner = false.obs;
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

  void toggleTopRated() {
    topRated.toggle();
  }

  void toggleLocation() {
    location.toggle();
  }

  void toggleAvailable() {
    available.toggle();
  }

  void toggleMobileScanner() {
    mobileScanner.toggle();
  }

  void changeLocation(
    String location,
  ) {
    selectedLocation.value = location;
  }

  // apiServices

  Future<void> fetchLabsLabels() async {
    isLoading = true.obs;
    var response = await apiService.get(
      'Labs/all',
    );
    try {
      if (response.statusCode == 200) {
        print(response.data.toString());
        labsIds = response.data
            .map(
              (e) => LabModel.fromJson(e).id,
            )
            .toList();
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } finally {
      isLoading = false.obs;
    }
  }

  Future<void> fetchLabsDetails() async {
    isLoading = true.obs;

    for (int id in labsIds) {
      var response = await apiService.get(
        'Ratings/lab-profile/$id',
      );
      try {
        if (response.statusCode == 200) {
          print(response.data.toString());
          labsDetails.add(LabModel.fromJson(response.data));
        } else {
          print('Failed to fetch labs: ${response.message}');
        }
      } finally {
        isLoading = false.obs;
      }
    }
  }
}
