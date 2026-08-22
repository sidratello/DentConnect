import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/create_blog_controller.dart';
import 'package:template/Dentist/BlogDentists/repositry/lab_blog_repository.dart';

class CreateDoctorBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabDoctorBlogRepository>(
      () => LabDoctorBlogRepository(),
    );

    Get.lazyPut<CreateDoctorBlogController>(
      () => CreateDoctorBlogController(
        repository: Get.find<LabDoctorBlogRepository>(),
      ),
    );
  }
}
