// class Etablissement_dto{
//   int id;
//   String nom_etab;
//   String devise;
//   String contact;
//   String logo;
//   String cachet;
//   String annee_academique;
//
// //<editor-fold desc="Data Methods">
//   Etablissement({
//     required this.id,
//     required this.nom_etab,
//     required this.devise,
//     required this.contact,
//     required this.logo,
//     required this.cachet,
//     required this.annee_academique,
//   });
//
//
//   @override
//   String toString() {
//     return 'Etablissement{' +
//         ' id: $id,' +
//         ' nom_etab: $nom_etab,' +
//         ' devise: $devise,' +
//         ' contact: $contact,' +
//         ' logo: $logo,' +
//         ' cachet: $cachet,' +
//         ' annee_academique: $annee_academique,' +
//         '}';
//   }
//
//   Etablissement copyWith({
//     int? id,
//     String? nom_etab,
//     String? devise,
//     String? contact,
//     String? logo,
//     String? cachet,
//     String? annee_academique,
//   }) {
//     return Etablissement(
//       id: id ?? this.id,
//       nom_etab: nom_etab ?? this.nom_etab,
//       devise: devise ?? this.devise,
//       contact: contact ?? this.contact,
//       logo: logo ?? this.logo,
//       cachet: cachet ?? this.cachet,
//       annee_academique: annee_academique ?? this.annee_academique,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': this.id,
//       'nom_etab': this.nom_etab,
//       'devise': this.devise,
//       'contact': this.contact,
//       'logo': this.logo,
//       'cachet': this.cachet,
//       'annee_academique': this.annee_academique,
//     };
//   }
//
//   factory Etablissement.fromMap(Map<String, dynamic> map) {
//     return Etablissement(
//       id: map['id'] as int,
//       nom_etab: map['nom_etab'] as String,
//       devise: map['devise'] as String,
//       contact: map['contact'] as String,
//       logo: map['logo'] as String,
//       cachet: map['cachet'] as String,
//       annee_academique: map['annee_academique'] as String,
//     );
//   }
//
// //</editor-fold>
// }