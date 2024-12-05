import 'package:get/get.dart';

import '../../../../presentation/generate_text/controllers/generate_text.controller.dart';

class GenerateTextControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateTextController>(
      () => GenerateTextController(),
    );
  }
}
