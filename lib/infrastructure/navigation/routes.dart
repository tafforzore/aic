import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../datas/local_storage/encrypted_storage.dart';

class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    String refreshToken = await Get.find<EncryptedStorage>().getToken() ?? "";
    Get.find<EncryptedStorage>().removeToken();
    if (refreshToken.isEmpty) {
      return HOME;
      // return SPLASH;
    }
    return HOME;
    // return ERROR_PAGE;
  }

  static const CARTE = '/carte';
  static const ERROR_PAGE = '/error-page';
  static const ETABLISSEMENT = '/etablissement';
  static const FORGET_PASSWORD = '/forget-password';
  static const GENERATE_TEXT = '/generate-text';
  static const HOME = '/home';
  static const INTRODUCTION = '/introduction';
  static const INTRODUCTION_PAGE = '/introduction-page';
  static const LOGIN = '/login';
  static const PIN_CODE_PAGE = '/pin-code-page';
  static const PROFILE_SCREE = '/profile-scree';
  static const PROFILE_SCREEN = '/profile-screen';
  static const REGISTER = '/register';
  static const SCHOOL = '/school';
  static const SEARCH_SCREEN = '/search-screen';
  static const SPLASH = '/splash';
  static const STUDENT = '/student';
  static const CHANGE_PASSWORD = '/change-password';
}
