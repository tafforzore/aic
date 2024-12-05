import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/dal/enum/auth_enum.dart';
import '../../../infrastructure/dal/payload/request/register_request.dart';
import '../../../infrastructure/dal/services/auth_services.dart';
import '../../../infrastructure/navigation/routes.dart';

class RegisterController extends GetxController {

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController c_password = TextEditingController();
  RxString errorText = ''.obs;

  bool champsVerification(){
    if(password.value.text.isEmpty ||
        c_password.value.text.isEmpty ||
        email.value.text.isEmpty|| username.value.text.isEmpty
    ){
      errorText.value = "Veuillez completer tous les champs !!!";
      return false;
    }
    else{
      if(password.value.text.length<8 || c_password.value.text.length<8){
        errorText.value = "Mots de passe doit contenir 8 caracteres !!!";
      }else
      if(password.value.text != c_password.value.text){
        errorText.value = "Mots de passe Non valide !!!";
        return false;
      }
    }
    return true;
  }

  Future<void> createAccount() async{
    bool fieldsIsOk = champsVerification();
    if(fieldsIsOk){
      RegisterRequest registerObject = RegisterRequest(username: username.value.text, email: email.value.text, password: password.value.text);
      LoginVerification loginVerification =  await AuthServices().register(registerObject: registerObject);

      if(loginVerification == LoginVerification.CREATED){
        Get.offNamed(Routes.HOME);
      }else if(loginVerification == LoginVerification.WRONG_DATA){}
      else if(loginVerification == LoginVerification.USER_EXIST){
        errorText.value = "username existe deja !!";
      }
      else{
        //todo: apiError echec de connexion a api
        errorText.value = "une erreur est survenue !!";

      }
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
