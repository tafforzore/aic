import 'dart:ui';

import 'package:finalaic/datas/local_storage/encrypted_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FastCreateCardController extends GetxController{
  var selectedLanguage = 'en'.obs;
  RxBool isDarkMode = false.obs;

  final List<Map<String, String>> languages = [
    {'code': 'de', 'name': 'Deutsch'},
    {'code': 'ar', 'name': 'العربية'},
    {'code': 'chi', 'name': '中文'},
    {'code': 'en', 'name': 'English'},
    {'code': 'fr', 'name': 'Français'},
    {'code': 'ru', 'name': 'Русский'},
  ];

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    updateLocale(languageCode);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }


  void updateLocale(String languageCode) async{
    Locale locale = Locale(languageCode);
    await Get.find<EncryptedStorage>().setParameter([languageCode]);
    Get.updateLocale(locale);
  }
}