class Classe {
  final int? id;
  final String name;
  final int? school;

  Classe({
    this.id,
    required this.name,
    this.school,
  });

  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      id: json['id'] as int?,
      name: json['name'] as String,
      school: json['school'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'school': school,
    };
  }
}
