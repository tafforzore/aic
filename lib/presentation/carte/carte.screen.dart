import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../components/app_colors.dart';
import 'controllers/carte.controller.dart';

class CarteScreen extends GetView<CarteController> {
  const CarteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Carte d'Identité",
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
              return GestureDetector(
                onTap: controller.pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColor.primaryColor.withOpacity(0.2),
                  backgroundImage: controller.profileImage.value != null
                      ? FileImage(controller.profileImage.value!)
                      : null,
                  child: controller.profileImage.value == null
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
                  _buildInfoRow("Nom", "Jean Dupont", Icons.person),
                  const SizedBox(height: 16),
                  _buildInfoRow("Numéro d'identité", "123456789", Icons.badge),
                  const SizedBox(height: 16),
                  _buildInfoRow("Date de naissance", "01 Janvier 1990", Icons.cake),
                  const SizedBox(height: 16),
                  _buildInfoRow("Adresse", "123 Rue Exemple, Paris", Icons.home),
                  const SizedBox(height: 16),
                  _buildInfoRow("Contact", "+33 123 456 789", Icons.phone),
                ],
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
}


