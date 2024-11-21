class ResetPasswordRequest {
  String? email;
  String? newPassword;
  String? newPasswordConfirmation;

  ResetPasswordRequest(
      {this.email, this.newPassword, this.newPasswordConfirmation});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    newPassword = json['new_password'];
    newPasswordConfirmation = json['new_password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['new_password'] = newPassword;
    data['new_password_confirmation'] = newPasswordConfirmation;
    return data;
  }
}
