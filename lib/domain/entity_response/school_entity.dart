import '../../infrastructure/dal/enum/etablissementenum.dart';
import '../entities/school.dart';
import '../entities/student.dart';

class ClassEntity{
  final ClasseEnum classeEnum;
  List<Classe>? classes;

  ClassEntity({
    required this.classeEnum,
    this.classes,
  });
}


class StudentEntity{
  final StudentEnum studentEnum;
  List<Student>? students;

  StudentEntity({
    required this.studentEnum,
    this.students,
  });
}