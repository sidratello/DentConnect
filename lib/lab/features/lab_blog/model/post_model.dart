class BlogPostModel {
  final int postId;
  final String title;
  final String content;
  final String type;
  final int authorId;
  final String authorName;
  final bool isSensitiveRedacted;
  final String status;
  final String reviewMessage;
  final DateTime? createdAt;
  final List<BlogPostAttachment> attachments;
  final String authorProfilePictureUrl;

  const BlogPostModel({
    required this.postId,
    required this.title,
    required this.content,
    required this.type,
    required this.authorId,
    required this.authorName,
    required this.isSensitiveRedacted,
    required this.status,
    required this.reviewMessage,
    required this.createdAt,
    required this.attachments,
    required this.authorProfilePictureUrl,
  });

  factory BlogPostModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BlogPostModel(
      postId: _toInt(
        json['postId'] ?? json['id'],
      ),
      title:
          json['title']?.toString() ?? '',
      content:
          json['content']?.toString() ?? '',
      type:
          json['type']?.toString() ?? '',
      authorId:
          _toInt(json['authorId']),
      authorName:
          json['authorName']?.toString() ?? '',
      authorProfilePictureUrl:
          json['authorProfilePictureUrl']
                  ?.toString()
                  .trim() ??
              '',
      isSensitiveRedacted:
          json['isSensitiveRedacted'] == true,
      status:
          json['status']?.toString() ?? '',
      reviewMessage:
          json['reviewMessage']
                  ?.toString() ??
              '',
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),
      attachments: _parseAttachments(
        json['attachments'],
      ),
    );
  }

  factory BlogPostModel.fromSearchJson(
    Map<String, dynamic> json, {
    required String postType,
  }) {
    return BlogPostModel(
      postId: _toInt(
        json['id'] ?? json['postId'],
      ),
      title:
          json['title']?.toString() ?? '',
      content:
          json['content']?.toString() ?? '',
      type: postType,
      authorId:
          _toInt(json['authorId']),
      authorName:
          json['authorName']?.toString() ?? '',
      authorProfilePictureUrl:
          json['authorProfilePictureUrl']
                  ?.toString()
                  .trim() ??
              '',
      isSensitiveRedacted:
          json['isSensitiveRedacted'] == true,
      status:
          json['status']?.toString() ?? '',
      reviewMessage:
          json['reviewMessage']
                  ?.toString() ??
              '',
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),

      // صور المنشور في نتيجة البحث
      attachments: _parseAttachments(
        json['attachments'],
      ),
    );
  }

  static List<BlogPostAttachment>
      _parseAttachments(
    dynamic value,
  ) {
    if (value is! List) {
      return <BlogPostAttachment>[];
    }

    return value
        .whereType<Map>()
        .map(
          (item) =>
              BlogPostAttachment.fromJson(
            Map<String, dynamic>.from(
              item,
            ),
          ),
        )
        .toList();
  }

  bool get isDoctorPost =>
      type == 'CommunityDiscussionDoctor';

  bool get isLabPost =>
      type == 'CommunityDiscussionLab';

  bool get hasAttachments =>
      attachments.isNotEmpty;

  bool get hasAuthorProfilePicture =>
      authorProfilePictureUrl
          .trim()
          .isNotEmpty;

  BlogPostAttachment? get firstAttachment {
    if (attachments.isEmpty) {
      return null;
    }

    return attachments.first;
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

class BlogPostAttachment {
  final int id;
  final String path;
  final String type;
  final DateTime? uploadedAt;
  final int blogPostId;

  const BlogPostAttachment({
    required this.id,
    required this.path,
    required this.type,
    required this.uploadedAt,
    required this.blogPostId,
  });

  factory BlogPostAttachment.fromJson(
    Map<String, dynamic> json,
  ) {
    return BlogPostAttachment(
      id: _toInt(json['id']),
      path:
          json['path']?.toString() ?? '',
      type:
          json['type']?.toString() ?? '',
      uploadedAt: DateTime.tryParse(
        json['uploadedAt']?.toString() ?? '',
      ),

      // نتيجة البحث قد لا تحتوي على blogPostId
      blogPostId:
          _toInt(json['blogPostId']),
    );
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