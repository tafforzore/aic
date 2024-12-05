import 'package:get/get.dart';

import '../../../domain/entities/etablissement.dart';

class SearchScreenController extends GetxController {
  //TODO: Implement SearchScreenController

  Future<void> refreshData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  final List<String> imageUrls = [
    'https://via.placeholder.com/800x400.png?text=Image+1',
    'https://via.placeholder.com/800x400.png?text=Image+2',
    'https://via.placeholder.com/800x400.png?text=Image+3',
    'https://via.placeholder.com/800x400.png?text=Image+4',
  ];

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



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
