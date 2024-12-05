import 'dart:io';

class Classe{
  String id;
  String nom_classe;
  File Liste_eleves;

//<editor-fold desc="Data Methods">
  Classe({
    required this.id,
    required this.nom_classe,
    required this.Liste_eleves,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Classe &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nom_classe == other.nom_classe &&
          Liste_eleves == other.Liste_eleves);

  @override
  int get hashCode => id.hashCode ^ nom_classe.hashCode ^ Liste_eleves.hashCode;

  @override
  String toString() {
    return 'Classe{' +
        ' id: $id,' +
        ' nom_classe: $nom_classe,' +
        ' Liste_eleves: $Liste_eleves,' +
        '}';
  }

  Classe copyWith({
    String? id,
    String? nom_classe,
    File? Liste_eleves,
  }) {
    return Classe(
      id: id ?? this.id,
      nom_classe: nom_classe ?? this.nom_classe,
      Liste_eleves: Liste_eleves ?? this.Liste_eleves,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nom_classe': this.nom_classe,
      'Liste_eleves': this.Liste_eleves,
    };
  }

  factory Classe.fromMap(Map<String, dynamic> map) {
    return Classe(
      id: map['id'] as String,
      nom_classe: map['nom_classe'] as String,
      Liste_eleves: map['Liste_eleves'] as File,
    );
  }

//</editor-fold>
}