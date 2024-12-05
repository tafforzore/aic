class RegisterRequest{
  String username;
  String email;
  String password;
  RegisterRequest({required this.username, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
      'email': this.email,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }


}