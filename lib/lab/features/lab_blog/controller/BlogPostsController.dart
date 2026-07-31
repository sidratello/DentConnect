
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/api_response.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/widgets/custom_action_dialog.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';
import 'package:template/lab/features/lab_blog/repositry/post_repository.dart';
import 'package:template/lab/features/lab_blog/view/post_details_wedjet/post_details_dialog.dart';



class MyBlogPostsController extends GetxController {
  final PostRepository repository;

  MyBlogPostsController({
    required this.repository,
  });

  final posts = <BlogPostModel>[].obs;
final deletingPostId = RxnInt();
  final isLoading = false.obs;
  final isRefreshing = false.obs;

  // 0 = العامة
  // 1 = بانتظار الموافقة
  // 2 = المرفوضة
  final selectedTabIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();

    fetchPosts();
  }

  Future<void> fetchPosts({
    bool showLoading = true,
  }) async {
    if (showLoading) {
      isLoading.value = true;
    }

    try {
      final response = await _getPostsResponse();

      if (response == null) {
        return;
      }

      if (response.success) {
        posts.assignAll(
          response.data ?? [],
        );
        return;
      }

      _showError(
        response.message,
      );
    } catch (_) {
      _showError(
        'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.',
      );
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }

  Future<ApiResponse<List<BlogPostModel>>?> _getPostsResponse() {
    switch (selectedTabIndex.value) {
      case 0:
        return repository.getMyApprovedPosts();

      case 1:
        return repository.getMyPendingPosts();

      case 2:
        return repository.getMyRejectedPosts();

      default:
        return repository.getMyPendingPosts();
    }
  }

  Future<void> refreshPosts() async {
    isRefreshing.value = true;

    await fetchPosts(
      showLoading: false,
    );
  }

  void selectTab(int index) {
    if (index == selectedTabIndex.value) {
      return;
    }


    selectedTabIndex.value = index;

    posts.clear();

    fetchPosts();
  }

  void openCreateBlog() {
    Get.toNamed(
      AppRouter.createBlog,
    );
  }

  void showPostDetails(
    BlogPostModel post,
  ) {
    PostDetailsDialog.show(
      post: post,
    );
  }

  void _showError(
    String message,
  ) {
    Get.snackbar(
      'حدث خطأ',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade50,
      colorText: Colors.red.shade800,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.red,
      ),
    );
  }

 Future<void> deletePost(
    BlogPostModel post,
  ) async {
    if (deletingPostId.value != null) {
      return;
    }

    deletingPostId.value = post.postId;

    try {
      final response = await repository.deletePost(
        post.postId,
      );

      if (!response.success) {
        _showError(response.message);
        return;
      }

      posts.removeWhere(
        (item) => item.postId == post.postId,
      );
      Get.snackbar(
        'تم الحذف',
        response.message.isNotEmpty
            ? response.message
            : 'تم حذف المنشور بنجاح.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade50,
        colorText: Colors.green.shade800,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
        ),
      );
    } catch (_) {
      _showError(
        'حدث خطأ أثناء حذف المنشور، يرجى المحاولة مرة أخرى.',
      );
    } finally {
      deletingPostId.value = null;
    }
  }




void confirmDeletePost(
  BlogPostModel post,
) {
  CustomActionDialog.show<void>(
    title: 'حذف المنشور',
    barrierDismissible: false,
    content: Text(
      'هل أنت متأكد من حذف المنشور '
      '"${post.title}"؟\n'
      'لا يمكن التراجع عن هذه العملية.',
      textAlign: TextAlign.center,
    ),
    confirmButton: TextButton(
      onPressed: () {
        Get.back();

        deletePost(post);
      },
      child: const Text(
        'حذف',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
Future<void> openEditPost(
  BlogPostModel post,
) async {
  final result = await Get.toNamed(
    AppRouter.createBlog,
    arguments: post,
  );

  debugPrint('Edit result: $result');

  if (result == true) {
    await fetchPosts(
      showLoading: false,
    );

    Get.snackbar(
      'تم التعديل',
      'تم تعديل المنشور بنجاح وإعادته للمراجعة.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade50,
      colorText: Colors.green.shade800,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.green,
      ),
    );
  }
}
}