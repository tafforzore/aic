import 'dart:io';
import 'package:finalaic/infrastructure/dal/enum/etablissementenum.dart';
import '../../infrastructure/dal/dtos/etablissement_dto.dart';
import '../../infrastructure/dal/payload/request/register_request.dart';
import '../../infrastructure/network/dio_client.dart';
import '../entities/etablissement.dart';
import '../entities/school.dart';
import '../entities/student.dart';
import '../entity_response/etablissment_entity.dart';
import '../entity_response/school_entity.dart';

class SchoolRepository{
  final DioClient dioClient;
  SchoolRepository(this.dioClient);


  Future<EtablissmentEntity> getAllEtablissementById() async {
    final response = await dioClient.dio.get('/app/schools/');
    if (response.statusCode == HttpStatus.ok) {
      List<Etablissement> etablissments = [];

      for (var etablissement in response.data as List) {
        if (etablissement is Map<String, dynamic>) {
          etablissments.add(Etablissement.fromJson(etablissement));
        }
      }
      return EtablissmentEntity(etablissmentEnum: EtablissmentEnum.OK, etablissement: etablissments);
    } else if(response.statusCode == HttpStatus.badRequest){
      return EtablissmentEntity(etablissmentEnum: EtablissmentEnum.WRONG_DATA);
    } else if(response.statusCode == HttpStatus.notFound){
      return EtablissmentEntity(etablissmentEnum: EtablissmentEnum.NOT_FOUND);
    }else{
      return EtablissmentEntity(etablissmentEnum: EtablissmentEnum.SERVER_ERROR);
    }
  }

  Future<ClassEntity> getAllClassById(String id) async {
    final response = await dioClient.dio.get('/app/classes/',
        // queryParameters: {
        //   'id':int.parse(id)
        // }
    );
    if (response.statusCode == HttpStatus.ok) {
      List<Classe> classes = [];

      for (var classe in response.data as List) {
        if (classe is Map<String, dynamic>) {
          classes.add(Classe.fromJson(classe));
          print(classes);
        }
      }
      return ClassEntity(classeEnum: ClasseEnum.OK, classes: classes);
    } else if(response.statusCode == HttpStatus.badRequest){
      return ClassEntity(classeEnum: ClasseEnum.WRONG_DATA);
    } else if(response.statusCode == HttpStatus.notFound){
      return ClassEntity(classeEnum: ClasseEnum.NOT_FOUND);
    }else{
      return ClassEntity(classeEnum: ClasseEnum.SERVER_ERROR);
    }
  }

  Future<StudentEntity> getAllStudentByClassById(String id) async {
    final response = await dioClient.dio.get('/app/students/',
      // queryParameters: {
      //   'id':int.parse(id)
      // }
    );
    if (response.statusCode == HttpStatus.ok) {
      List<Student> students = [];

      for (var student in response.data as List) {
        if (student is Map<String, dynamic>) {
          students.add(Student.fromMap(student));
          print(students);
        }
      }
      return StudentEntity(studentEnum: StudentEnum.OK, students: students);
    } else if(response.statusCode == HttpStatus.badRequest){
      return StudentEntity(studentEnum: StudentEnum.WRONG_DATA);
    } else if(response.statusCode == HttpStatus.notFound){
      return StudentEntity(studentEnum: StudentEnum.NOT_FOUND);
    }else{
      return StudentEntity(studentEnum: StudentEnum.SERVER_ERROR);
    }
  }
}
