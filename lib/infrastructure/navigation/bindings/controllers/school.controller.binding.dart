import 'package:get/get.dart';

import '../../../../presentation/school/controllers/school.controller.dart';

class SchoolControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolController>(
      () => SchoolController(),
    );
  }
}
