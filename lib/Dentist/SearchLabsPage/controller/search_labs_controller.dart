import 'package:get/get.dart';

class SearchLabsController extends GetxController {
  final searchText = ''.obs;
  final selectedRating = 0.0.obs;
  final onlyScanner = false.obs;
  final onlyAvailable = false.obs;
  final selectedCity = ''.obs;

  final cities = [
    'دمشق',
    'حلب',
    'حمص',
    'اللاذقية',
    'طرطوس',
  ];

  void resetFilters() {
    searchText.value = '';
    selectedRating.value = 0;
    onlyScanner.value = false;
    onlyAvailable.value = false;
    selectedCity.value = '';
  }
}
