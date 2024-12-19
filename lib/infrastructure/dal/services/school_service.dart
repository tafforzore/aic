import 'package:finalaic/domain/repositories/school_repository.dart';
import 'package:get/get.dart';
import '../../../domain/entity_response/etablissment_entity.dart';
import '../../../domain/entity_response/school_entity.dart';
import '../../network/dio_client.dart';

class SchoolService{
  SchoolRepository schoolRepository = Get.put<SchoolRepository>(
      SchoolRepository(Get.find<DioClient>()));

  Future<EtablissmentEntity> getAllEtablissementById() async {
    return await schoolRepository.getAllEtablissementById();
  }

  Future<ClassEntity> getAllClasseById({required String id}) async {
    return await schoolRepository.getAllClassById(id);
  }

  Future<StudentEntity> getAllStudentByClassById({required String id}) async {
    return await schoolRepository.getAllStudentByClassById(id);
  }
}