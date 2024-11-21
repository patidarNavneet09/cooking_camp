class UpdateParentProfileModel {
  String? firstName;
  String? lastName;

  UpdateParentProfileModel(
      {
        this.firstName,
        this.lastName
       });

  UpdateParentProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}