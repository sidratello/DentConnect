import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/repositry/blog_feed_repository.dart';
import 'package:template/Dentist/BlogDentists/controller/blog_feed_controller.dart';

class BlogDoctorFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogFeedDoctorRepository>(
      () => BlogFeedDoctorRepository(),
    );

    Get.lazyPut<BlogFeedDoctorController>(
      () => BlogFeedDoctorController(
        repository: Get.find<BlogFeedDoctorRepository>(),
      ),
    );
  }
}
