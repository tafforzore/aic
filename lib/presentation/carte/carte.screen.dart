import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../components/app_colors.dart';
import 'controllers/carte.controller.dart';

class CarteScreen extends GetView<CarteController> {
  const CarteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.delete<CarteController>();
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColor.whiteColor,)),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Carte Scolaire",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Section de l'image de profil
            Obx(() {
              String? imageUrl = controller.student.image_url??'';
              File? selectedImage = controller.profileImage.value;

              return GestureDetector(
                onTap: () async {
                  _showImagePicker(context);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColor.primaryColor.withOpacity(0.2),
                  backgroundImage: selectedImage != null
                      ? FileImage(selectedImage)
                      : imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : null,
                  child: selectedImage == null && imageUrl.isEmpty
                      ? Icon(
                    Icons.add_a_photo,
                    color: AppColor.primaryColor,
                    size: 40,
                  )
                      : null,
                ),
              );
            }),

            const SizedBox(height: 20),
            // Carte d'identité
            Container(
              width: 90.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("Nom", controller.student.firstName, Icons.person),
                  const SizedBox(height: 16),
                  _buildInfoRow("Prenom", controller.student.lastName, Icons.person_outline),
                  const SizedBox(height: 16),
                  _buildInfoRow("Matricule", controller.student.matricule, Icons.confirmation_number),
                  const SizedBox(height: 16),
                  _buildInfoRow("Date de naissance", controller.student.date_of_birth, Icons.calendar_today),
                  // const SizedBox(height: 16),
                  // _buildInfoRow("Adresse", controller.student.!, Icons.location_on),
                  const SizedBox(height: 16),
                  _buildInfoRow("Sexe", controller.student.sexe ?? "Non défini", Icons.wc),
                ],
              ),
            ),
            const Spacer(),
            // Bouton Enregistrer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: ElevatedButton(
                onPressed: controller.uploadImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColor.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Prendre une photo'),
                onTap: () {
                  Get.find<CarteController>().pickImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Importer depuis la galerie'),
                onTap: () {
                  Get.find<CarteController>().pickImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
