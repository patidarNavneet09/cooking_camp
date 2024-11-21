class MyChildListingModel {
  int? totalPage;
  List<Items>? items;

  MyChildListingModel({this.totalPage, this.items});

  MyChildListingModel.fromJson(Map<String, dynamic> json) {
    totalPage = json['total_page'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_page'] = totalPage;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? parentId;
  String? name;
  String? role;
  String? kidImage;
  String? day;
  String? month;
  String? year;
  String? grade;
  String? username;
  String? password;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
        this.parentId,
        this.name,
        this.role,
        this.kidImage,
        this.day,
        this.month,
        this.year,
        this.grade,
        this.username,
        this.password,
        this.createdAt,
        this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    role = json['role'];
    kidImage = json['kid_image'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    grade = json['grade'];
    username = json['username'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['role'] = role;
    data['kid_image'] = kidImage;
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    data['grade'] = grade;
    data['username'] = username;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}