class ParentRegisterModel {
  String? role;
  String? firstName;
  String? lastName;
  // String? image;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? fcmToken;
  String? deviceId;
  String? deviceType;

  ParentRegisterModel(
      {this.role,
        this.firstName,
        this.lastName,
        // this.image,
        this.email,
        this.password,
        this.passwordConfirmation,
        this.fcmToken,
        this.deviceId,
        this.deviceType});

  ParentRegisterModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    // image = json['Image'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    // data['Image'] = image;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['fcm_token'] = fcmToken;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    return data;
  }
}