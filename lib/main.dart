import 'package:finalaic/presentation/components/app_colors.dart';
import 'package:finalaic/presentation/components/controller/fast_create_card_controller.dart';
import 'package:finalaic/presentation/components/controller/internet_connection_controller.dart';
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
  Get.put(IntenetConnexionController(),permanent: true);
  Get.put(FastCreateCardController());
  List<dynamic> defaultParameter = await Get.find<EncryptedStorage>().getParameter();
  print("storage "+defaultParameter.toString());

   runApp(Main(initialRoutes,defaultParameter));
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
  final List defaultParameter;
  Main(this.initialRoute, this.defaultParameter, {super.key});

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
          locale: Locale(defaultParameter.isNotEmpty?defaultParameter[0]:'fr'),
          fallbackLocale: Locale('en'),
          getPages: Nav.routes,
          themeMode: Get.find<FastCreateCardController>().isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          theme:  ThemeData(
            brightness: Brightness.light,
            primaryColor: AppColor.primaryColor,
            hintColor: AppColor.secondaryColor,
            scaffoldBackgroundColor: AppColor.whiteColor,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColor.primaryColor,
            ),
            buttonTheme: ButtonThemeData(buttonColor: AppColor.primaryColor),
            fontFamily: 'Monsterrat',
            textTheme: TextTheme(
                bodyMedium:  TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 18,
                  letterSpacing: 1,
                  height: .9,)
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColor.primaryColor,
            hintColor: AppColor.secondaryColor,
            scaffoldBackgroundColor: AppColor.blackColorColor,
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: AppColor.whiteColor),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColor.primaryColor,
            ),
            buttonTheme: ButtonThemeData(buttonColor: AppColor.primaryColor),
          ),
        );
      },
    );
  }
}
