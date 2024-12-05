class Carte{
  String carte;
  String photos;

//<editor-fold desc="Data Methods">
  Carte({
    required this.carte,
    required this.photos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Carte &&
          runtimeType == other.runtimeType &&
          carte == other.carte &&
          photos == other.photos);

  @override
  int get hashCode => carte.hashCode ^ photos.hashCode;

  @override
  String toString() {
    return 'Carte{' + ' carte: $carte,' + ' photos: $photos,' + '}';
  }

  Carte copyWith({
    String? carte,
    String? photos,
  }) {
    return Carte(
      carte: carte ?? this.carte,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carte': this.carte,
      'photos': this.photos,
    };
  }

  factory Carte.fromMap(Map<String, dynamic> map) {
    return Carte(
      carte: map['carte'] as String,
      photos: map['photos'] as String,
    );
  }

//</editor-fold>
}