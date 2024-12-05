import 'package:get/get.dart';

import '../../../../presentation/introduction_page/controllers/introduction_page.controller.dart';

class IntroductionPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroductionPageController>(
      () => IntroductionPageController(),
    );
  }
}
