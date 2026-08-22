import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/repositry/blog_feed_repository.dart';
import 'package:template/core/app_router.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

enum BlogDoctorFeedTab {
  doctors,
  labs,
}

class BlogFeedDoctorController extends GetxController {
  final BlogFeedDoctorRepository repository;

  BlogFeedDoctorController({
    required this.repository,
  });

  final posts = <BlogPostModel>[].obs;

  final searchResults = <BlogPostModel>[].obs;

  final isLoading = false.obs;
  final isSearching = false.obs;

  final selectedTab = BlogDoctorFeedTab.doctors.obs;

  final searchQuery = ''.obs;

  final searchController = TextEditingController();

  Timer? _searchDebounce;

  bool get hasSearchQuery => searchQuery.value.trim().isNotEmpty;

  List<BlogPostModel> get visiblePosts {
    final source = hasSearchQuery ? searchResults : posts;

    if (selectedTab.value == BlogDoctorFeedTab.doctors) {
      return source
          .where(
            (post) => post.isDoctorPost,
          )
          .toList();
    }

    return source
        .where(
          (post) => post.isLabPost,
        )
        .toList();
  }

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

    final response = selectedTab.value == BlogDoctorFeedTab.doctors
        ? await repository.getDoctorPosts()
        : await repository.getLabPosts();

    if (showLoading) {
      isLoading.value = false;
    }

    if (!response.success || response.data == null) {
      Get.snackbar(
        'تعذر تحميل المنشورات',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    posts.assignAll(response.data!);
  }

  Future<void> selectTab(
    BlogDoctorFeedTab tab,
  ) async {
    if (selectedTab.value == tab) {
      return;
    }

    selectedTab.value = tab;

    if (hasSearchQuery) {
      return;
    }

    posts.clear();

    await fetchPosts();
  }

  void onSearchChanged(
    String value,
  ) {
    searchQuery.value = value;

    _searchDebounce?.cancel();

    final query = value.trim();

    if (query.isEmpty) {
      searchResults.clear();
      isSearching.value = false;
      return;
    }

    _searchDebounce = Timer(
      const Duration(
        milliseconds: 500,
      ),
      () {
        searchPosts(query);
      },
    );
  }

  Future<void> searchPosts(
    String query,
  ) async {
    isSearching.value = true;

    final response = await repository.searchPosts(
      query,
    );

    isSearching.value = false;

    if (!response.success || response.data == null) {
      Get.snackbar(
        'تعذر البحث',
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final convertedPosts = response.data!.posts.map(
      (post) {
        return BlogPostModel.fromJson(
          {
            'postId': post.id,
            'title': post.title,
            'content': post.content,
            'type': post.type,
            'authorId': post.author.id,
            'authorName': post.author.name,
            'authorProfilePictureUrl': post.author.profilePictureUrl,
            'isSensitiveRedacted': false,
            'status': 'Approved',
            'reviewMessage': '',
            'createdAt': post.createdAt?.toIso8601String(),
            'attachments': post.attachments
                .map(
                  (attachment) => {
                    'id': attachment.id,
                    'path': attachment.path,
                    'type': attachment.type,
                    'blogPostId': post.id,
                  },
                )
                .toList(),
          },
        );
      },
    ).toList();

    searchResults.assignAll(
      convertedPosts,
    );
  }

  void clearSearch() {
    _searchDebounce?.cancel();

    searchController.clear();
    searchQuery.value = '';
    searchResults.clear();
    isSearching.value = false;
  }

  Future<void> refreshPosts() async {
    if (hasSearchQuery) {
      await searchPosts(
        searchQuery.value.trim(),
      );

      return;
    }

    await fetchPosts(
      showLoading: false,
    );
  }

  void openPostDetails(
    BlogPostModel post,
  ) {
    Get.toNamed(
      AppRouter.blogPostDetails,
      arguments: post,
    );
  }

  void openAddPost() {
    Get.toNamed(
      AppRouter.createdoctorBlog,
    );
  }

  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    _searchDebounce?.cancel();
    searchController.dispose();

    super.onClose();
  }
}
