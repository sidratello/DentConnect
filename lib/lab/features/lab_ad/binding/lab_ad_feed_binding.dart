import 'package:get/get.dart';

import '../controller/lab_ad_feed_controller.dart';
import '../repository/lab_ad_feed_repository.dart';

class LabAdFeedBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<
        LabAdFeedRepository>(
      () =>
          LabAdFeedRepository(),
    );

    Get.lazyPut<
        LabAdFeedController>(
      () =>
          LabAdFeedController(
        repository:
            Get.find<
                LabAdFeedRepository>(),
      ),
    );
  }
}