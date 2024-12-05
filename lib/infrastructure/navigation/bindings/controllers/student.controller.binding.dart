import 'package:get/get.dart';

import '../../../../presentation/student/controllers/student.controller.dart';

class StudentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(
      () => StudentController(),
    );
  }
}
