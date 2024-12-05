import 'package:get/get.dart';

import '../../../../presentation/carte/controllers/carte.controller.dart';

class CarteControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarteController>(
      () => CarteController(),
    );
  }
}
