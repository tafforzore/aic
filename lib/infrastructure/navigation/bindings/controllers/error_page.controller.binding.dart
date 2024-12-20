import 'package:get/get.dart';

import '../../../../presentation/Error_page/controllers/error_page.controller.dart';

class ErrorPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ErrorPageController>(
      () => ErrorPageController(),
    );
  }
}
