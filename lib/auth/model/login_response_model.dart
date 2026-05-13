class LoginResponseModel {
  final int userId;
  final int? labId;
  final String role;
  final String status;
  final String accessMode;
  final String? accessToken;
  final String? refreshToken;
  final String? message;

  LoginResponseModel({
    required this.userId,
    required this.labId,
    required this.role,
    required this.status,
    required this.accessMode,
    required this.accessToken,
    required this.refreshToken,
    required this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: json['userId'],
      labId: json['labId'],
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      accessMode: json['accessMode'] ?? '',
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      message: json['message'],
    );
  }
}