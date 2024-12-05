import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../datas/local_storage/encrypted_storage.dart';
import '../infrastructure/network/dio_client.dart';
import 'controller/connection.dart';


class ReloadMain {
  Future<void> initMain() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await initLocalStorage();
    initDio();
    bool pinCodeRequired = true;
    Get.put(pinCodeRequired, permanent: true);
    Get.put(ConnectionController());
  }

  initDio() {
    if (!Get.isRegistered<DioClient>()) {
      Get.put(DioClient(), permanent: true);
    }
  }

  Future<void> initLocalStorage() async {
    if (!Get.isRegistered<EncryptedStorage>()) {
      await Get.putAsync(() async {
        EncryptedStorage encryptedStorage = await EncryptedStorage.init();
        return encryptedStorage;
      }, permanent: true);
    }
  }

}