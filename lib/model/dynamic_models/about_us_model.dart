class AboutUsModel {
  String? id;
  String? title;
  String? image;
  String? description;
  String? colorCode;
  String? createdAt;
  String? updatedAt;

  AboutUsModel(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.colorCode,
        this.createdAt,
        this.updatedAt});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    colorCode = json['color_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['color_code'] = colorCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}