class RegisterModel {
  final String message;
  final bool status;
  final String phone;

  RegisterModel({
    required this.message,
    required this.status,
    required this.phone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'],
      status: json['status'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'phone': phone,
    };
  }
}
