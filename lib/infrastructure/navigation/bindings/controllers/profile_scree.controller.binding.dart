import 'package:get/get.dart';

import '../../../../presentation/profile_scree/controllers/profile_scree.controller.dart';

class ProfileScreeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreeController>(
      () => ProfileScreeController(),
    );
  }
}
