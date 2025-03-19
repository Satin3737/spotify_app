class LoginUserRequest {
  final String email;
  final String password;

  LoginUserRequest({
    required this.email,
    required this.password,
  });

  factory LoginUserRequest.fromJson(Map<String, dynamic> json) {
    return LoginUserRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
