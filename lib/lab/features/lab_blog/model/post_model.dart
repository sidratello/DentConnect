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
  });

  factory BlogPostModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BlogPostModel(
      postId: json['postId'] ?? 0,
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      authorId: json['authorId'] ?? 0,
      authorName: json['authorName']?.toString() ?? '',
      isSensitiveRedacted:
          json['isSensitiveRedacted'] ?? false,
      status: json['status']?.toString() ?? '',
      reviewMessage:
          json['reviewMessage']?.toString() ?? '',
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),
      attachments:
          (json['attachments'] as List<dynamic>? ?? [])
              .map(
                (item) => BlogPostAttachment.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              )
              .toList(),
    );
  }

  
  factory BlogPostModel.fromSearchJson(
    Map<String, dynamic> json, {
    required String postType,
  }) {
    return BlogPostModel(
      postId: _toInt(json['id']),
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      type: postType,
      authorId: _toInt(json['authorId']),
      authorName:
          json['authorName']?.toString() ?? '',
      isSensitiveRedacted: false,
      status: json['status']?.toString() ?? '',
      reviewMessage: '',
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),
      attachments: const [],
    );
  }

  bool get isDoctorPost =>
      type == 'CommunityDiscussionDoctor';

  bool get isLabPost =>
      type == 'CommunityDiscussionLab';

  bool get hasAttachments =>
      attachments.isNotEmpty;

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
      id: json['id'] ?? 0,
      path: json['path']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      uploadedAt: DateTime.tryParse(
        json['uploadedAt']?.toString() ?? '',
      ),
      blogPostId: json['blogPostId'] ?? 0,
    );
  }
}