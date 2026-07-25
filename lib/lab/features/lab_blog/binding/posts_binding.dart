import 'package:get/get.dart';
import 'package:template/lab/features/lab_blog/controller/BlogPostsController.dart';
import 'package:template/lab/features/lab_blog/repositry/post_repository.dart';



class MyBlogPostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(
      () => PostRepository(),
    );

    Get.lazyPut<MyBlogPostsController>(
      () => MyBlogPostsController(
        repository:
            Get.find<PostRepository>(),
      ),
    );
  }
}