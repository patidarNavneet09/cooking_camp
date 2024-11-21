class KidsRegisterModel {
  String? role;
  int? parentId;
  String? name;
  int? day;
  String? month;
  String? year;
  String? grade;
  String? username;
  String? password;
  String? fcmToken;
  String? deviceId;
  String? deviceType;
  int? kidId;


  KidsRegisterModel(
      {this.role,
        this.parentId,
        this.name,
        this.day,
        this.month,
        this.year,
        this.grade,
        this.username,
        this.password,
        this.fcmToken,
        this.deviceId,
        this.deviceType,
        this.kidId,
        });

  KidsRegisterModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    parentId = json['parent_id'];
    name = json['name'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    grade = json['grade'];
    username = json['username'];
    password = json['password'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    kidId = json['kid_id'];
    // firstName = json['first_name'];
    // lastName = json['Last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    data['grade'] = grade;
    data['username'] = username;
    data['password'] = password;
    data['fcm_token'] = fcmToken;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    data['kid_id'] = kidId;
    // data['first_name'] = firstName;
    // data['Last_name'] = lastName;
    return data;
  }
}