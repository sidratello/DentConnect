import 'package:get/get.dart';
import 'package:template/lab/features/lab_blog/controller/create_blog_controller.dart';
import 'package:template/lab/features/lab_blog/repositry/lab_blog_repository.dart';



class CreateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabBlogRepository>(
      () => LabBlogRepository(),
    );

    Get.lazyPut<CreateBlogController>(
      () => CreateBlogController(
        repository: Get.find<LabBlogRepository>(),
      ),
    );
  }
}