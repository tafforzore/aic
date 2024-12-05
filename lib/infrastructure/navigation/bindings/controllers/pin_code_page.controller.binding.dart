import 'package:get/get.dart';

import '../../../../presentation/pin_code_page/controllers/pin_code_page.controller.dart';

class PinCodePageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodePageController>(
      () => PinCodePageController(),
    );
  }
}
