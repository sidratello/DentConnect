import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/BlogPostsController.dart';
import 'package:template/Dentist/BlogDentists/repositry/post_repository.dart';

class MyBlogDoctorPostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDoctorRepository>(
      () => PostDoctorRepository(),
    );

    Get.lazyPut<MyBlogDoctorPostsController>(
      () => MyBlogDoctorPostsController(
        repository: Get.find<PostDoctorRepository>(),
      ),
    );
  }
}
