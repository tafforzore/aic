class User{
  String id;
  String username;
  String password;
  String email;
  String refresh;
  String access;

//<editor-fold desc="Data Methods">
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.access,
    required this.refresh
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          password == other.password &&
          email == other.email);

  @override
  int get hashCode =>
      id.hashCode ^ username.hashCode ^ password.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' username: $username,' +
        ' password: $password,' +
        ' email: $email,' +
        '}';
  }

  User copyWith({
    String? id,
    String? username,
    String? password,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      access: access ?? this.email,
      refresh: refresh?? this.refresh
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'username': this.username,
      'password': this.password,
      'email': this.email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      refresh: map['refresh'] as String,
      access: map['access'] as String,
    );
  }

//</editor-fold>
}