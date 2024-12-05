class CreateStudentRequest{
  String matricule;
  String name;
  String date_of_birth;
  String grade;
  int classe;
  CreateStudentRequest(
      {required this.matricule, required this.name, required this.date_of_birth,required this.grade,required this.classe}
      );

  Map<String, dynamic> toMap() {
    return {
      'matricule': this.matricule,
      'name': this.name,
      'date_of_birth': this.date_of_birth,
      'grade': this.grade,
      'classe': this.classe,
    };
  }

  factory CreateStudentRequest.fromMap(Map<String, dynamic> map) {
    return CreateStudentRequest(
      matricule: map['matricule'] as String,
      name: map['name'] as String,
      date_of_birth: map['date_of_birth'] as String,
      classe: map['classe'] as int,
      grade: map['grade'] as String,
    );
  }

  @override
  String toString() {
    // return 'CreateStudentRequest{ username: $username, password: $password,}';
    return "";
  }
}