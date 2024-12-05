import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  void _navigateToHome()async{
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.INTRODUCTION_PAGE);
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
    _navigateToHome();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
