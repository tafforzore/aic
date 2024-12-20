import 'package:finalaic/domain/entities/student.dart';
import 'package:finalaic/domain/entity_response/school_entity.dart';
import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';
import '../../../infrastructure/dal/enum/etablissementenum.dart';
import '../../../infrastructure/dal/services/school_service.dart';
import '../../../infrastructure/navigation/routes.dart';

class StudentController extends GetxController {
  List<Student> students = [];

  RxString etablissement = ''.obs;
  RxString id = ''.obs;
  RxString classe = ''.obs;
  RxString idClasse = ''.obs;

  RxBool hide = true.obs;

  void viewDetails(Etablissement etablissements) {
    // Implémentation des détails si nécessaire
  }

  void loadData() async {
    hide.value = true; // Masquer avant de charger les données
    try {
      StudentEntity studentEntity = await SchoolService().getAllStudentByClassById(id: id.value);
      if (studentEntity.studentEnum == StudentEnum.OK) {
        students = studentEntity.students ?? [];
        print('Voici mes salles de classe : $students');
      }
    } catch (e) {
      print('Erreur lors du chargement des données : $e');
    } finally {
      hide.value = false; // Révéler après le chargement
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Lecture des arguments
    if (Get.arguments.containsKey("etablissement")) {
      etablissement.value = Get.arguments["etablissement"] ?? "";
    }

    if (Get.arguments.containsKey("id_ets")) {
      id.value = Get.arguments["id_ets"] ?? "";
    }

    if (Get.arguments.containsKey("classe")) {
      classe.value = Get.arguments["classe"] ?? "";
    }

    if (Get.arguments.containsKey("id_classe")) {
      idClasse.value = Get.arguments["id_classe"] ?? "";
    }
  }

  void goToNextPage(Student student){
    Get.back();
    Get.toNamed(Routes.CARTE,
      arguments: {
        'student':student
      }
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData(); // Charger les données dès que le contrôleur est prêt
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
