import 'package:get/get.dart';

import '../../../../presentation/profile_screen/controllers/profile_screen.controller.dart';

class ProfileScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreenController>(
      () => ProfileScreenController(),
    );
  }
}
