import 'dart:io';

import 'package:finalaic/presentation/components/controller/fast_create_card_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  //TODO: Implement ProfileScreenController
  Rx<File?> profileImage = Rx<File?>(null);
  RxString username = 'Severin'.obs;
  RxString email = 'severin@gmail.com'.obs;
  RxString number = '651881464'.obs;
  RxString adress = 'yaounde-cameroun'.obs;

  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  Deconnexion(){}

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

  getProfileInformations() async {

  }

  void increment() => count.value++;
}
