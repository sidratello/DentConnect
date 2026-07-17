import 'package:get/get.dart';
import 'package:template/core/api.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();

  List<int> labsIds = [];
  final RxBool isPreviewMode = false.obs;
  final topRated = false.obs;
  final available = false.obs;
  final mobileScanner = false.obs;
  final selectedLocation = 'كل المواقع'.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchLabsLabels();
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
        labsIds = response.data
            .map(
              (e) => e.id,
            )
            .toList() as List<int>;
      } else {
        print('Failed to fetch labs: ${response.message}');
      }
    } finally {
      isLoading = false.obs;
    }
  }
}
