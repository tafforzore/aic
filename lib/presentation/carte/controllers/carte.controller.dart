import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class CarteController extends GetxController {
  //TODO: Implement CarteController

  Rx<File?> profileImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}

