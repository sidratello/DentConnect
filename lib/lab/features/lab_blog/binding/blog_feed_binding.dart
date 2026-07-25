import 'package:get/get.dart';
import 'package:template/lab/features/lab_blog/repositry/blog_feed_repository.dart';

import '../controller/blog_feed_controller.dart';


class BlogFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogFeedRepository>(
      () => BlogFeedRepository(),
    );

    Get.lazyPut<BlogFeedController>(
      () => BlogFeedController(
        repository:
            Get.find<BlogFeedRepository>(),
      ),
    );
  }
}