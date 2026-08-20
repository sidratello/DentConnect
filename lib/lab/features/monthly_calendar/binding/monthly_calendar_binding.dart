import 'package:get/get.dart';

import 'package:template/lab/features/monthly_calendar/controller/monthly_calendar_controller.dart';
import 'package:template/lab/features/monthly_calendar/repository/monthly_calendar_repository.dart';

class MonthlyCalendarBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        MonthlyCalendarRepository>(
      () => MonthlyCalendarRepository(),
    );

    Get.lazyPut<
        MonthlyCalendarController>(
      () => MonthlyCalendarController(
        repository: Get.find<
            MonthlyCalendarRepository>(),
      ),
    );
  }
}