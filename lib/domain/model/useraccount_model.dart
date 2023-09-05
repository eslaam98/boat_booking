class UserAccountModel {
  String? userId;
  String? username;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  String? userApprove;
  String? userVerfiycode;
  String? userTimecreate;
  String? userImage;

  UserAccountModel(
      {this.userId,
      this.username,
      this.userEmail,
      this.userPhone,
      this.userPassword,
      this.userApprove,
      this.userVerfiycode,
      this.userTimecreate,
      this.userImage});

  UserAccountModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userApprove = json['user_approve'];
    userVerfiycode = json['user_verfiycode'];
    userTimecreate = json['user_timecreate'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['username'] = username;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_password'] = userPassword;
    data['user_approve'] = userApprove;
    data['user_verfiycode'] = userVerfiycode;
    data['user_timecreate'] = userTimecreate;
    data['user_image'] = userImage;
    return data;
  }
}
