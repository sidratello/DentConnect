

import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogSearchResponse {
  final int totalResults;
  final String searchQuery;
  final List<BlogPostModel> posts;

  const BlogSearchResponse({
    required this.totalResults,
    required this.searchQuery,
    required this.posts,
  });

  factory BlogSearchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final categorizedPosts =
        json['categorizedPosts'];

    final posts = <BlogPostModel>[];

    if (categorizedPosts is Map) {
      posts.addAll(
        _parsePosts(
          categorizedPosts[
              'CommunityDiscussionDoctor'],
          postType:
              'CommunityDiscussionDoctor',
        ),
      );

      posts.addAll(
        _parsePosts(
          categorizedPosts[
              'CommunityDiscussionLab'],
          postType:
              'CommunityDiscussionLab',
        ),
      );
    }

    posts.sort(
      (first, second) {
        final firstDate =
            first.createdAt ??
                DateTime.fromMillisecondsSinceEpoch(
                  0,
                );

        final secondDate =
            second.createdAt ??
                DateTime.fromMillisecondsSinceEpoch(
                  0,
                );

        return secondDate.compareTo(firstDate);
      },
    );

    return BlogSearchResponse(
      totalResults:
          _toInt(json['totalResults']),
      searchQuery:
          json['searchQuery']?.toString() ?? '',
      posts: posts,
    );
  }

  static List<BlogPostModel> _parsePosts(
    dynamic value, {
    required String postType,
  }) {
    if (value is! List) {
      return [];
    }

    return value
        .whereType<Map>()
        .map(
          (item) =>
              BlogPostModel.fromSearchJson(
            Map<String, dynamic>.from(item),
            postType: postType,
          ),
        )
        .toList();
  }

  static int _toInt(dynamic value) {
    if (value is int) {
      return value;
    }

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}