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
    etablissmentEntity = await SchoolService().getAllSchoolById();
    if(etablissmentEntity.etablissmentEnum == EtablissmentEnum.OK){
      etablissements = etablissmentEntity.etablissement;
      print('voici mes etablissement : ${etablissements}');
    }
    hide.value = false;
  }

  void goToNextPage(String etablissment_name){
    Get.toNamed(Routes.SCHOOL,arguments: {
      'etablissement':etablissment_name
    });
    Get.back();
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
