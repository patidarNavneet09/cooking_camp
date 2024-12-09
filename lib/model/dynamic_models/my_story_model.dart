class StoryModel {
  String? userId;
  String? title;
  String? description;
  String? image;
  String? updatedAt;
  String? createdAt;
  String? id;
  List<StoryImages>? storyImages;
  String? status;
  String? kidId;
  String? role;
  int? isFeatured;

  StoryModel(
      {this.userId,
        this.title,
        this.description,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.status,
        this.storyImages,this.kidId,this.role,this.isFeatured});

  StoryModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    status = json['status'];
    kidId = json['kid_id'];
    role = json['role'];
    isFeatured = json['is_featured'];
    if (json['story_images'] != null) {
      storyImages = <StoryImages>[];
      json['story_images'].forEach((v) {
        storyImages!.add(StoryImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['status'] = status;

    data['kid_id'] = kidId;
    data['role'] = role;
    data['is_featured'] = isFeatured;

    if (storyImages != null) {
      data['story_images'] = storyImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoryImages {
  String? id;
  String? storyId;
  String? images;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  StoryImages(
      {this.id,
        this.storyId,
        this.images,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  StoryImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storyId = json['story_id'];
    images = json['images'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['story_id'] = storyId;
    data['images'] = images;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}