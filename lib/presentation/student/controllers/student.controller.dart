import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';

class StudentController extends GetxController {
  List<Etablissement> etablissements = [
    Etablissement(
      id: 1,
      name: "Université de Paris",
      devise: "Liberté, Égalité, Fraternité",
      contact: "contact@universite-paris.fr",
      logo: "https://via.placeholder.com/150",
      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: 'null',
    ),
    Etablissement(
      id: 2,
      name: "École Polytechnique",
      devise: "Excellence, Innovation",
      contact: "contact@polytechnique.fr",
      logo: "https://via.placeholder.com/150",
      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
    ),
    Etablissement(
      id: 3,
      name: "Université de Lyon",
      devise: "Savoir et Partage",
      contact: "contact@universite-lyon.fr",
      logo: "https://via.placeholder.com/150",
      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
    ),
    Etablissement(
      id: 4,
      name: "École des Mines",
      devise: "Technologie et Futur",
      contact: "contact@ecole-des-mines.fr",
      logo: "https://via.placeholder.com/150",
      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
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
