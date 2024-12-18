import 'dart:io';
import 'package:finalaic/infrastructure/dal/enum/etablissementenum.dart';
import '../../infrastructure/dal/dtos/etablissement_dto.dart';
import '../../infrastructure/dal/payload/request/register_request.dart';
import '../../infrastructure/network/dio_client.dart';
import '../entities/etablissement.dart';
import '../entity_response/etablissment_entity.dart';

class SchoolRepository{
  final DioClient dioClient;
  SchoolRepository(this.dioClient);


  Future<EtablissmentEntity> getAllSchoolById() async {
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
}
