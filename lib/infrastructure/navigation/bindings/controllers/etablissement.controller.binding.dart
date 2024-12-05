import 'package:get/get.dart';

import '../../../../presentation/etablissement/controllers/etablissement.controller.dart';

class EtablissementControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EtablissementController>(
      () => EtablissementController(),
    );
  }
}
