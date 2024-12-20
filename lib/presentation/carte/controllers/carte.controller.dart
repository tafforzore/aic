import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:finalaic/infrastructure/dal/services/school_service.dart';
import 'package:finalaic/presentation/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/entities/student.dart';
import '../../../infrastructure/constant/server.dart';
import '../../../infrastructure/dal/enum/etablissementenum.dart';

class CarteController extends GetxController {
  // Cloudinary configuration
  final cloudinary = Cloudinary.unsignedConfig(
    cloudName: CloudinaryConstant.cloudName,
  );

  Rx<File?> profileImage = Rx<File?>(null);
  late Student student;

  // Function to pick an image from the camera
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


  // Function to upload the image to Cloudinary
  Future<void> uploadImage() async {
    if (profileImage.value == null) {
      Get.snackbar(
        "Erreur",
        "Veuillez sélectionner une image avant de téléverser.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.danger,
        colorText: Colors.white,
      );
      return;
    }

    // Upload the image to Cloudinary
    try {
      final response = await cloudinary.unsignedUpload(
        file: profileImage.value!.path,
        resourceType: CloudinaryResourceType.image,
        folder: 'profile_images', // Specify your folder name
        uploadPreset: 'zaklsi74', // Your upload preset (use an unsigned preset)
      );

      if (response.isSuccessful) {
        String? uploadedImageUrl = response.secureUrl;
        student.image_url = uploadedImageUrl;
        StudentEnum studentEnum = await SchoolService().updateStudent(student: student);
        if(studentEnum == StudentEnum.OK){
          Get.back();
          Get.snackbar(
            "Succès",
            "L'image a été téléversée avec succès.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.primaryColor,
            colorText: Colors.white,
          );
        }else {
          Get.snackbar(
            "Erreur",
            "Erreur s'est produite lors de l'enregistrement.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.danger,
            colorText: Colors.white,
          );
        }

      } else {
        Get.snackbar(
          "Erreur",
          "Erreur lors du téléversement de l'image.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.danger,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Erreur inattendue",
        "Une erreur s'est produite : $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.danger,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    if (Get.arguments.containsKey("student")) {
      student = Get.arguments["student"];
    }
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
