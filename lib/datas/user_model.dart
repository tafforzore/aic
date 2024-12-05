class User {
  String? nom;
  String? phone;
  int? age;

  User({this.nom, this.phone, this.age});

  User.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    phone = json['phone'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nom'] = nom;
    data['phone'] = phone;
    data['age'] = age;
    return data;
  }
}
