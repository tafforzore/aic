class Student{
  final int id;
  final String matricule;
  final String firstName;
  final String lastName;
  final String date_of_birth;
  final String? sexe;
  String? image_url;
  final String? photos;
  // final String? card_file;
  int? classe;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'matricule': this.matricule,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'date_of_birth': this.date_of_birth,
      'sexe': this.sexe,
      'image_url': this.image_url,
      'photos': this.photos,
      // 'card_file': this.card_file,
      'classe': this.classe,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      matricule: map['matricule'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      date_of_birth: map['date_of_birth'] as String,
      sexe: map['sexe'] as String,
      image_url: map['image_url'] as String,
      photos: map['photos'] as String,
      // card_file: map['card_file'] as String,
      classe: map['classe'] as int,
    );
  }

  Student({
    required this.id,
    required this.matricule,
    required this.firstName,
    required this.lastName,
    required this.date_of_birth,
    this.sexe,
    this.image_url,
    this.photos,
    // this.card_file,
    this.classe,
  });
}
