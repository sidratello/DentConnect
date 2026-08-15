enum PostStatus {
  pending,
  approved,
  rejected,
}

class CommunityPostModel {
  final String doctorName;
  final String doctorImage;
  final String content;
  final List<String> images;
  final String createdAt;
  final PostStatus status;

  const CommunityPostModel({
    required this.doctorName,
    required this.doctorImage,
    required this.content,
    required this.images,
    required this.createdAt,
    required this.status,
  });
}
