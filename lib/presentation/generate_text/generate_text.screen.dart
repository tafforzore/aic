import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../components/app_colors.dart';
import 'controllers/generate_text.controller.dart';

class GenerateTextScreen extends GetView<GenerateTextController> {
  const GenerateTextScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title:  Text(LocaleKeys.take_picture.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              return controller.capturedImage.value == null
                  ? Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    LocaleKeys.no_take_picture.tr,
                    style: TextStyle(
                      color: AppColor.greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
                  : Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(controller.capturedImage.value!),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            // Bouton pour capturer une photo
            ElevatedButton.icon(
              onPressed: controller.takePhoto,
              icon: const Icon(Icons.camera),
              label:  Text(LocaleKeys.take_picture.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.generate_text.tr,
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      controller.generatedText.value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 20),
            Obx(() {
              return ElevatedButton.icon(
                onPressed: controller.copyText,
                icon: Icon(
                  controller.isTextCopied.value
                      ? Icons.check_circle
                      : Icons.copy,
                  color: controller.isTextCopied.value
                      ? Colors.green
                      : AppColor.primaryColor,
                ),
                label: Text(
                  controller.isTextCopied.value
                      ? LocaleKeys.copied_text.tr
                      : LocaleKeys.copy_text.tr,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

