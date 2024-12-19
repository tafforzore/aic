import 'package:finalaic/domain/entities/student.dart';
import 'package:finalaic/domain/entity_response/school_entity.dart';
import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';
import '../../../infrastructure/dal/enum/etablissementenum.dart';
import '../../../infrastructure/dal/services/school_service.dart';

class StudentController extends GetxController {

  List<Student> students = [];


  RxString etablissement = ''.obs;
  RxString id = ''.obs;
  RxString classe = ''.obs;
  RxString idClasse = ''.obs;


  RxBool hide = true.obs;


  viewDetails(Etablissement etablissements){
  }

  void loadData() async {
    StudentEntity studentEntity = await SchoolService().getAllStudentByClassById(id: id.value);
    if(studentEntity.studentEnum == StudentEnum.OK){
      students = studentEntity.students!;
      print('voici mes salle de classe : ${students}');
    }
    hide.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() {
    if(Get.arguments.containsKey("etablissement")){
      etablissement.value = Get.arguments["etablissement"]??"";
    }

    if(Get.arguments.containsKey("id_ets")){
      id.value = Get.arguments["id_ets"]??"";
    }

    if(Get.arguments.containsKey("classe")){
      classe.value = Get.arguments["classe"]??"";
    }

    if(Get.arguments.containsKey("id_classe")){
      idClasse.value = Get.arguments["id_classe"]??"";
    }

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
