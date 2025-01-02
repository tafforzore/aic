class CardPrototype{
  int id;
  String image;
  bool? choice;
  List<dynamic>? schoolChoice;

  CardPrototype({
    required this.id,
    required this.image,
    this.choice,
    this.schoolChoice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'image': this.image,
      'choice': this.choice,
      'school_choice': this.schoolChoice,
    };
  }

  factory CardPrototype.fromMap(Map<String, dynamic> map) {
    return CardPrototype(
      id: map['id'] as int,
      image: map['image'] as String,
      choice: map['choice'] ?? false,
      schoolChoice: map['school_choice'] ?? [],
    );
  }
}