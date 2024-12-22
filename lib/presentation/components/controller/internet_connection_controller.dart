import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class IntenetConnexionController extends GetxController{
  RxBool hasConnection = true.obs;
  InternetConnection internetConnection = InternetConnection.createInstance();

  void internetChecker(){
    internetConnection.onStatusChange.listen((status){
      if(status == InternetStatus.connected){
        hasConnection.value = true;
      }
      else{
        hasConnection.value = false;
      }
    });
  }


  @override
  void onInit() {
    internetChecker();
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