import 'package:get/get.dart';
import 'package:template/lab/features/monthly_calendar/controller/calendar_day_details_controller.dart';

import 'package:template/lab/features/monthly_calendar/repository/monthly_calendar_repository.dart';
class CalendarDayDetailsBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        CalendarDayDetailsController>(
      () =>
          CalendarDayDetailsController(
        repository: Get.find<
            MonthlyCalendarRepository>(),
      ),
    );
  }
}