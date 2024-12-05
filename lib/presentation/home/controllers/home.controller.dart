import 'package:finalaic/infrastructure/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home.screen.dart';
import '../profile_screen.dart';
import '../search_screen.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool change = false.obs;

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController dateNaissanceController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();

  createCard(){}

  void loadData() async {
     Future.delayed(Duration(seconds: 5),() {
      change.value = true;
    },);
  }

  final List<StatelessWidget> pages = [
    SearchScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  // Fonction pour changer la page active
  void changePage(int index) {
    selectedIndex.value = index;
    if(index == 2){
      Get.toNamed(Routes.PROFILE_SCREEN);
    }
    if(index == 1){
      Get.toNamed(Routes.SEARCH_SCREEN);
    }
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
