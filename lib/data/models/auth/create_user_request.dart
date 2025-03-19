class CreateUserRequest {
  final String name;
  final String email;
  final String password;

  CreateUserRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) {
    return CreateUserRequest(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
