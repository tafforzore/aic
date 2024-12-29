import 'package:finalaic/domain/entity_response/school_entity.dart';
import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';
import '../../../domain/entities/school.dart';
import '../../../infrastructure/dal/enum/etablissementenum.dart';
import '../../../infrastructure/dal/services/school_service.dart';
import '../../../infrastructure/navigation/routes.dart';

class SchoolController extends GetxController {
  //TODO: Implement SchoolController
  RxString etablissement = ''.obs;
  RxString id = ''.obs;

  List<Classe> schools = [];
  RxBool hide = true.obs;
  viewDetails(Etablissement etablissements){
  }



  void loadData() async {
    ClassEntity classEntity = await SchoolService().getAllClasseById(id: id.value);
    if(classEntity.classeEnum == ClasseEnum.OK){
      schools = classEntity.classes!;
      print('voici mes salle de classe : ${schools}');
    }
    hide.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() {
    print('je suis initialiser');
    if(Get.arguments.containsKey("etablissement")){
      etablissement.value = Get.arguments["etablissement"]??"";
    }

    if(Get.arguments.containsKey("id_ets")){
      id.value = Get.arguments["id_ets"]??"";
    }

    print('etablissement :${etablissement}');
    super.onInit();
  }

  void goToNextPage(Classe classe){
    Get.back;
    Get.toNamed(
        Routes.STUDENT,
        arguments: {
          'etablissement':etablissement.value,
          'id_ets':id.value,
          'classe': classe.name,
          'id_classe': classe.id.toString(),
        });
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
