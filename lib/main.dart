import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'datas/local_storage/encrypted_storage.dart';
import 'generated/locales.g.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/network/dio_client.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDio();
  await initLocalStorage();
  String initialRoutes =  await Routes.initialRoute;
  print("storage "+initialRoutes);
   runApp(Main(initialRoutes));
}

Future<void> initLocalStorage() async {
  if (!Get.isRegistered<EncryptedStorage>()) {
    await Get.putAsync(() async {
      EncryptedStorage encryptedStorage = await EncryptedStorage.init();
      return encryptedStorage;
    }, permanent: true);
  }
}

initDio() {
  if (!Get.isRegistered<DioClient>()) {
    Get.put(DioClient(), permanent: true);
  }
}


class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("je suis u"),),
    );
  }

}


class Main extends StatelessWidget with WidgetsBindingObserver {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.onlyBuilder,
          title: 'AIC',
          initialRoute: initialRoute,
          translationsKeys: AppTranslation.translations,
          locale: Locale('fr'),
          fallbackLocale: Locale('en'),
          getPages: Nav.routes,
          theme:  ThemeData(
            fontFamily: 'Monsterrat',
            textTheme: const  TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  height: .9,)
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3239E5)),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
