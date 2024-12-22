import 'package:finalaic/datas/local_storage/encrypted_storage.dart';
import 'package:finalaic/domain/entities/etablissement.dart';
import 'package:finalaic/infrastructure/dal/services/school_service.dart';
import 'package:get/get.dart';
import '../../../domain/entity_response/etablissment_entity.dart';
import '../../../infrastructure/dal/enum/etablissementenum.dart';
import '../../../infrastructure/navigation/routes.dart';

class EtablissementController extends GetxController {
  //TODO: Implement EtablissementController
  late EtablissmentEntity etablissmentEntity;
  late final etablissements;
  RxBool hide = true.obs;


  viewDetails(Etablissement etablissements){
  }

  void loadData() async {
    String? id = await Get.find<EncryptedStorage>().getId();
    if(id!.isNotEmpty){
      etablissmentEntity = await SchoolService().getAllEtablissementById(id: id);
      if(etablissmentEntity.etablissmentEnum == EtablissmentEnum.OK){
        etablissements = etablissmentEntity.etablissement;
        print('voici mes etablissement : ${etablissements}');
      }else{
        Get.toNamed(Routes.ERROR_PAGE);
      }
      hide.value = false;
    }else{
      Get.toNamed(Routes.ERROR_PAGE);
    }
  }

  void goToNextPage(Etablissement etablissment){
    Get.toNamed(
        Routes.SCHOOL,
        arguments: {
          'etablissement':etablissment.name,
          'id_ets':etablissment.id.toString()
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
