class LoginRequestModel {
  String? email;
  String? username;
  String? password;
  String? fcmToken;
  String? deviceId;
  String? deviceType;

  LoginRequestModel(
      {this.email,
       this.username,
        this.password,
        this.fcmToken,
        this.deviceId,
        this.deviceType});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['fcm_token'] = fcmToken;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    return data;
  }
}