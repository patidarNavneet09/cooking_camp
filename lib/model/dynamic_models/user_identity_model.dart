class UserIdentityModel {
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
  String? updatedAt;
  String? createdAt;
  String? id;

  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? deletedAt;
  String? fcmToken;
  String? deviceId;
  String? deviceType;
  String? token;
  String? friendRequestStatus;


  UserIdentityModel(
      {this.parentId,
        this.name,
        this.role,
        this.kidImage,
        this.day,
        this.month,
        this.year,
        this.grade,
        this.username,
        this.password,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.image,
        this.deletedAt,
        this.fcmToken,
        this.deviceId,
        this.deviceType,
        this.token,
        this.friendRequestStatus
      });

  UserIdentityModel.fromJson(Map<String, dynamic> json) {
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
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];

    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
    deletedAt = json['deleted_at'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    token = json['token'];
    friendRequestStatus = json['friend_request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;

    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['image'] = image;
    data['deleted_at'] = deletedAt;
    data['fcm_token'] = fcmToken;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    data['token'] = token;
    data['friend_request_status'] = friendRequestStatus;
    return data;
  }
}