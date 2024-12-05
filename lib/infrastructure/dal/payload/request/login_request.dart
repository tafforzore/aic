class LoginRequest{
  String username;
  String password;
  LoginRequest({required this.username,  required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() {
    return 'UserRequest{ username: $username, password: $password,}';
  }

}