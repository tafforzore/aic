import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../infrastructure/dal/enum/auth_enum.dart';
import '../../../infrastructure/dal/payload/request/login_request.dart';
import '../../../infrastructure/dal/services/auth_services.dart';
import '../../../infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxString error = "".obs;
  RxBool isLoading = false.obs;

  Future<void> loginAction() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      if (password.text.length > 7) {
        isLoading.value = true;

        try {
          LoginRequest loginRequest = LoginRequest(
            username: username.text,
            password: password.text,
          );

          LoginVerification loginVerification = await AuthServices().login(
            loginRequest: loginRequest,
          );


          if (loginVerification == LoginVerification.CREATED) {
            Get.offNamed(Routes.HOME);
          } else if (loginVerification == LoginVerification.WRONG_DATA) {
            error.value = "Nom d'utilisateur ou mot de passe incorrect.";
          } else if (loginVerification == LoginVerification.USER_EXIST) {
            error.value = "Le nom d'utilisateur existe déjà !";
          } else {
            error.value = "Une erreur est survenue lors de la connexion.";
          }
        } catch (e) {
          error.value = "Une erreur s'est produite ";
        } finally {
          isLoading.value = false;
        }
      } else {
        error.value = "Le mot de passe doit contenir au moins 8 caractères.";
      }
    } else {
      error.value = "Veuillez compléter tous les champs.";
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
