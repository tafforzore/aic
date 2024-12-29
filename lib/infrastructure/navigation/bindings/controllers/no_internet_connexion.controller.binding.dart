import 'package:get/get.dart';

import '../../../../presentation/no_internet_connexion/controllers/no_internet_connexion.controller.dart';

class NoInternetConnexionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoInternetConnexionController>(
      () => NoInternetConnexionController(),
    );
  }
}
