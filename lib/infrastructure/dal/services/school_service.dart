import 'package:finalaic/domain/repositories/school_repository.dart';
import 'package:get/get.dart';
import '../../../domain/entity_response/etablissment_entity.dart';
import '../../network/dio_client.dart';

class SchoolService{
  SchoolRepository schoolRepository = Get.put<SchoolRepository>(
      SchoolRepository(Get.find<DioClient>()));

  Future<EtablissmentEntity> getAllSchoolById() async {
    return await schoolRepository.getAllSchoolById();
  }
}