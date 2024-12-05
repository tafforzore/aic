class Eleves{
  String id;
  String nom;
  String matricule;
  String prenom;
  String age;
  String photos;

//<editor-fold desc="Data Methods">
  Eleves({
    required this.id,
    required this.nom,
    required this.matricule,
    required this.prenom,
    required this.age,
    required this.photos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Eleves &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nom == other.nom &&
          matricule == other.matricule &&
          prenom == other.prenom &&
          age == other.age &&
          photos == other.photos);

  @override
  int get hashCode =>
      id.hashCode ^
      nom.hashCode ^
      matricule.hashCode ^
      prenom.hashCode ^
      age.hashCode ^
      photos.hashCode;

  @override
  String toString() {
    return 'Eleves{' +
        ' id: $id,' +
        ' nom: $nom,' +
        ' matricule: $matricule,' +
        ' prenom: $prenom,' +
        ' age: $age,' +
        ' photos: $photos,' +
        '}';
  }

  Eleves copyWith({
    String? id,
    String? nom,
    String? matricule,
    String? prenom,
    String? age,
    String? photos,
  }) {
    return Eleves(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      matricule: matricule ?? this.matricule,
      prenom: prenom ?? this.prenom,
      age: age ?? this.age,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nom': this.nom,
      'matricule': this.matricule,
      'prenom': this.prenom,
      'age': this.age,
      'photos': this.photos,
    };
  }

  factory Eleves.fromMap(Map<String, dynamic> map) {
    return Eleves(
      id: map['id'] as String,
      nom: map['nom'] as String,
      matricule: map['matricule'] as String,
      prenom: map['prenom'] as String,
      age: map['age'] as String,
      photos: map['photos'] as String,
    );
  }

//</editor-fold>
}