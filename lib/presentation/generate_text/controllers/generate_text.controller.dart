import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GenerateTextController extends GetxController {
  //TODO: Implement GenerateTextController

  Rx<File?> capturedImage = Rx<File?>(null);
  RxString generatedText = "Aucun texte disponible".obs;
  RxBool isTextCopied = false.obs;

  Future<void> takePhoto() async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      capturedImage.value = File(photo.path);
      generatedText.value = "Texte généré après la capture : ${DateTime.now()}";
    }
  }

  void copyText() {
    if (generatedText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: generatedText.value));
      isTextCopied.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        isTextCopied.value = false;
      });

      Get.snackbar("Succès", "Texte copié dans le presse-papiers",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  final count = 0.obs;
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

  void increment() => count.value++;
}

