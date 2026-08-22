class DoctorBlogSearchResponse {
  final int count;
  final List<DoctorBlogSearchPost> posts;

  const DoctorBlogSearchResponse({
    required this.count,
    required this.posts,
  });

  factory DoctorBlogSearchResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorBlogSearchResponse(
      count: (json['count'] as num?)?.toInt() ?? 0,

      posts: (json['posts'] as List?)
              ?.map(
                (item) =>
                    DoctorBlogSearchPost.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              )
              .toList() ??
          [],
    );
  }

  factory DoctorBlogSearchResponse.empty() {
    return const DoctorBlogSearchResponse(
      count: 0,
      posts: [],
    );
  }
}


class DoctorBlogSearchPost {
  final int id;
  final String title;
  final String content;
  final String type;
  final DateTime? createdAt;
  final DoctorBlogSearchAuthor author;
  final List<DoctorBlogSearchAttachment> attachments;

  const DoctorBlogSearchPost({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.author,
    required this.attachments,
    this.createdAt,
  });

  factory DoctorBlogSearchPost.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorBlogSearchPost(
      id: (json['id'] as num?)?.toInt() ?? 0,

      title: json['title']?.toString() ?? '',

      content: json['content']?.toString() ?? '',

      type: json['type']?.toString() ?? '',

      createdAt: DateTime.tryParse(
        json['createdAt']?.toString() ?? '',
      ),

      author: DoctorBlogSearchAuthor.fromJson(
        Map<String, dynamic>.from(
          json['author'] ?? {},
        ),
      ),

      attachments: (json['attachments'] as List?)
              ?.map(
                (item) =>
                    DoctorBlogSearchAttachment.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              )
              .toList() ??
          [],
    );
  }
}


class DoctorBlogSearchAuthor {
  final int id;
  final String name;
  final String namePlace;
  final String? profilePictureUrl;
  final String role;

  const DoctorBlogSearchAuthor({
    required this.id,
    required this.name,
    required this.namePlace,
    required this.role,
    this.profilePictureUrl,
  });

  factory DoctorBlogSearchAuthor.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorBlogSearchAuthor(
      id: (json['id'] as num?)?.toInt() ?? 0,

      name: json['name']?.toString() ?? '',

      namePlace: json['namePlace']?.toString() ?? '',

      profilePictureUrl:
          json['profilePictureUrl']?.toString(),

      role: json['role']?.toString() ?? '',
    );
  }
}


class DoctorBlogSearchAttachment {
  final int id;
  final String path;
  final String? type;

  const DoctorBlogSearchAttachment({
    required this.id,
    required this.path,
    this.type,
  });

  factory DoctorBlogSearchAttachment.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorBlogSearchAttachment(
      id: (json['id'] as num?)?.toInt() ?? 0,

      path: json['path']?.toString() ?? '',

      type: json['type']?.toString(),
    );
  }
}