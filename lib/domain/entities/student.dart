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
      'classe_id': this.classe,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      matricule: map['matricule'] ?? 'undefined',
      firstName: map['firstName'] ?? 'undefined',
      lastName: map['lastName'] ?? 'undefined',
      date_of_birth: map['date_of_birth'] ?? 'undefined',
      sexe: map['sexe'] ?? 'masculin',
      image_url: map['image_url'] ?? '',
      photos: map['photos'] ?? 'https://via.placeholder.com/400x400.png',
      // card_file: map['card_file'] as String,
      classe: map['classe_id'] ?? 1,
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
