class AdvertisementModel {
  int? id;
  String? title;
  String? content;
  int? userId;
  bool? isActive;
  String? createdAt;
  String? expiresAt;
  List<String>? images;

  AdvertisementModel(
      {this.id,
      this.title,
      this.content,
      this.userId,
      this.isActive,
      this.createdAt,
      this.expiresAt,
      this.images});

  AdvertisementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    userId = json['userId'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    expiresAt = json['expiresAt'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['userId'] = userId;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['expiresAt'] = expiresAt;
    data['images'] = images;
    return data;
  }
}
