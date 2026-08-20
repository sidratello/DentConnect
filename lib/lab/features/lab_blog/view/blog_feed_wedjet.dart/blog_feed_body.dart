import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/lab/features/lab_blog/controller/blog_feed_controller.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_feed_empty.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_feed_header.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_feed_search.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/blog_feed_tabs.dart';
import 'package:template/lab/features/lab_blog/view/blog_feed_wedjet.dart/BlogPostAceptedCard.dart';

class BlogFeedBody extends GetView<BlogFeedController> {
  const BlogFeedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isLoading =
            controller.isLoading.value ||
            controller.isSearching.value;

        final posts = controller.visiblePosts;

        return RefreshIndicator(
          color: AppColors.primaryBlue,
          onRefresh: controller.refreshPosts,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: BlogFeedHeader(),
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),

              const SliverToBoxAdapter(
                child: BlogFeedSearch(),
              ),

              const SliverToBoxAdapter(
                child: BlogFeedTabs(),
              ),

              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.littleBlue.withOpacity(.30),
                ),
              ),

              if (isLoading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: AppLoadingIndicator(),
                  ),
                )
              else if (posts.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      80,
                      24,
                      24,
                    ),
                    child: BlogFeedEmptyState(
                      hasSearchQuery:
                          controller.hasSearchQuery,
                      selectedTab:
                          controller.selectedTab.value,
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    18,
                    16,
                    18,
                    40,
                  ),
                  sliver: SliverList.separated(
                    itemCount: posts.length,
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      return BlogPostAceptedCard(
                        post: post,
                        onTap: () {
                          controller.openPostDetails(
                            post,
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}