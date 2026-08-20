import 'package:get/get.dart';

import '../model/scan_slot_model.dart';
import '../repositry/add_scan_slot_repo.dart';
import 'scan_slot_form_controller.dart';

class AddScanSlotController
    extends ScanSlotFormController {
  final AddScanSlotRepo _repo =
      AddScanSlotRepo();

  final createdSlot =
      Rxn<ScanSlotModel>();

  Future<void> createScanSlot() async {
    if (!validateForm()) {
      return;
    }

    if (isLoading.value) {
      return;
    }

    isLoading.value = true;

    try {
      final response =
          await _repo.createScanSlot(
        date: apiDate,
        time: apiTime,
        period: selectedPeriod.value,
      );

      if (!response.success ||
          response.data == null) {
        Get.snackbar(
          'خطأ',
          response.message.isNotEmpty
              ? response.message
              : 'تعذر إضافة موعد المسح',
          snackPosition:
              SnackPosition.BOTTOM,
        );

        return;
      }

      createdSlot.value =
          response.data;

      Get.back(
        result: {
          'success': true,
          'message':
              response.message.isEmpty
                  ? 'تمت إضافة موعد المسح بنجاح'
                  : response.message,
          'slot': response.data,
        },
      );
    } catch (error) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء إضافة موعد المسح',
        snackPosition:
            SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}