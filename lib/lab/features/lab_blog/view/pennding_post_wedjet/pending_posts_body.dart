import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/lab/features/lab_blog/controller/BlogPostsController.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pending_post_card.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pending_posts_header.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pending_review_notice.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pennding_posts_empty.dart';
import 'package:template/lab/features/lab_blog/view/pennding_post_wedjet/pennding_posts_tabs.dart';



class MyBlogPostsBody
    extends GetView<MyBlogPostsController> {
  const MyBlogPostsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyBlogPostsHeader(),
        const MyBlogPostsTabs(),
        Divider(
          height: 1,
          color: AppColors.littleBlue.withOpacity(.3),
        ),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const AppLoadingIndicator();
              }

              if (controller.posts.isEmpty) {
                return BlogPostsEmpty(
                  onCreatePressed:
                      controller.openCreateBlog,
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
        physics:
            const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          18,
          14,
          18,
          30,
        ),
        children: [
          PostStatusCard(
            status: firstPost.status,
            reviewMessage:
                firstPost.reviewMessage,
          ),
          const SizedBox(height: 16),
          ...controller.posts.map(
            (post) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 14,
                ),
                child: BlogPostCard(
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