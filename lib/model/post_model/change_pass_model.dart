class ChangePasswordModel {
  String? newPassword;
  String? newPasswordConfirmation;

  ChangePasswordModel({this.newPassword, this.newPasswordConfirmation});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    newPassword = json['new_password'];
    newPasswordConfirmation = json['new_password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['new_password'] = newPassword;
    data['new_password_confirmation'] = newPasswordConfirmation;
    return data;
  }
}