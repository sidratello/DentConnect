class CreateBlogModel {
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
  final List<BlogAttachment> attachments;

  const CreateBlogModel({
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

  factory CreateBlogModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateBlogModel(
      postId: _parseInt(json['postId']),
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      authorId: _parseInt(json['authorId']),
      authorName:
          json['authorName']?.toString() ?? '',
      isSensitiveRedacted:
          json['isSensitiveRedacted'] == true,
      status: json['status']?.toString() ?? '',
      reviewMessage:
          json['reviewMessage']?.toString() ?? '',
      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),
      attachments:
          (json['attachments'] as List<dynamic>? ?? [])
              .whereType<Map<String, dynamic>>()
              .map(BlogAttachment.fromJson)
              .toList(),
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}

class BlogAttachment {
  final int id;
  final String path;
  final String type;
  final DateTime? uploadedAt;
  final int blogPostId;

  const BlogAttachment({
    required this.id,
    required this.path,
    required this.type,
    required this.uploadedAt,
    required this.blogPostId,
  });

  factory BlogAttachment.fromJson(
    Map<String, dynamic> json,
  ) {
    return BlogAttachment(
      id: _parseInt(json['id']),
      path: json['path']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      uploadedAt: DateTime.tryParse(
        json['uploadedAt']?.toString() ?? '',
      ),
      blogPostId:
          _parseInt(json['blogPostId']),
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}