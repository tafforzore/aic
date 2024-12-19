import '../../infrastructure/dal/enum/etablissementenum.dart';
import '../entities/school.dart';

class ClassEntity{
  final ClasseEnum classeEnum;
  List<Classe>? classes;

  ClassEntity({
    required this.classeEnum,
    this.classes,
  });
}