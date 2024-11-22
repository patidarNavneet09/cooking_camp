class RegisterIdentityModel {
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? image;
  String? updatedAt;
  String? createdAt;
  String? id;
  String? token;




  RegisterIdentityModel(
      {this.firstName,
        this.lastName,
        this.role,
        this.email,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token,
      });

  RegisterIdentityModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    email = json['email'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role'] = role;
    data['email'] = email;
    data['image'] = image;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}