import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/BlogDentists/controller/BlogPostsController.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pending_post_card.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pending_posts_header.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pennding_posts_empty.dart';
import 'package:template/Dentist/BlogDentists/view/pennding_post_wedjet/pennding_posts_tabs.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_details_status_card.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

class MyBlogDoctorPostsBody extends GetView<MyBlogDoctorPostsController> {
  const MyBlogDoctorPostsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyBlogDoctorPostsHeader(),
        const MyBlogDoctorPostsTabs(),
        Divider(
          height: 1,
          color: AppColors.littleBlue.withValues(alpha: .3),
        ),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const AppLoadingIndicator();
              }

              if (controller.posts.isEmpty) {
                return BlogDoctorPostsEmpty(
                  onCreatePressed: controller.openCreateBlog,
                );
              }

              return _buildPostsList();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPostsList() {
    final firstPost = controller.posts.first;

    return RefreshIndicator(
      color: AppColors.primaryBlue,
      onRefresh: controller.refreshPosts,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          18,
          14,
          18,
          30,
        ),
        children: [
          PostDoctorStatusCard(
            status: firstPost.status,
            reviewMessage: firstPost.reviewMessage,
          ),
          const SizedBox(height: 16),
          ...controller.posts.map(
            (post) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 14,
                ),
                child: BlogDoctorPostCard(
                  post: post,
                  onTap: () {
                    controller.showPostDetails(
                      post,
                    );
                  },
                  onEdit: () {
                    controller.openEditPost(post);
                  },
                  onDelete: () {
                    controller.confirmDeletePost(post);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
