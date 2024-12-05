import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';

class StudentController extends GetxController {
  List<Etablissement> etablissements = [
    Etablissement(
      "Université de Paris",
      "2023-2024",
      "Liberté, Égalité, Fraternité",
      "https://via.placeholder.com/150",
    ),
    Etablissement(
      "École Polytechnique",
      "2023-2024",
      "Excellence, Innovation",
      "https://via.placeholder.com/150",
    ),
    Etablissement(
      "Université de Lyon",
      "2023-2024",
      "Savoir et Partage",
      "https://via.placeholder.com/150",
    ),
    Etablissement(
      "École des Mines",
      "2023-2024",
      "Technologie et Futur",
      "https://via.placeholder.com/150",
    ),
  ];

  RxBool hide = true.obs;


  viewDetails(Etablissement etablissements){
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 5));
    hide.value = false;
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
