class LoginModel {
  final String msg;
  final String refreshToken;

  LoginModel({
    required this.msg,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      msg: json['msg'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'refreshToken': refreshToken,
    };
  }
}
