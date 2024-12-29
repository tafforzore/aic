// class Etablissement{
//   String nom_etab ;
//   String annee_academique ;
//   String devise ;
//   String logo ;
//
//   Etablissement(this.nom_etab, this.annee_academique, this.devise, this.logo);
// }


class Etablissement{
  final int id;
  final String name;
  final String devise;
  final String phone;
  final String? contact;
  final String? logo;
  String? academicYear;
  final String? cachet;
  final String? signaturePrincipale;
  int? user;

  Etablissement({
    required this.phone,
    required this.id,
    required this.name,
    required this.devise,
    required this.contact,
    this.logo,
    this.academicYear,
    this.cachet,
    this.signaturePrincipale,
    this.user,
  });

  factory Etablissement.fromJson(Map<String, dynamic> json) {
    return Etablissement(
      id: json['id'],
      name: json['name'],
      devise: json['devise']??'',
      contact: json['contact'],
      logo: json['logo_url']??'',
      phone: json['phone'],
      academicYear: json['academic_year'],
      cachet: json['cachet'],
      signaturePrincipale: json['signature_principale'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'devise': devise,
      'contact': contact,
      'logo_url': logo,
      'academic_year': academicYear,
      'cachet': cachet,
      'signature_principale': signaturePrincipale,
      'user': user,
    };
  }
}
