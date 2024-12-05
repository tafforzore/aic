import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterControllerBinding(),
    ),
    GetPage(
      name: Routes.INTRODUCTION_PAGE,
      page: () => IntroductionPageScreen(),
      binding: IntroductionPageControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.PIN_CODE_PAGE,
      page: () => const PinCodePageScreen(),
      binding: PinCodePageControllerBinding(),
    ),
    GetPage(
      name: Routes.ETABLISSEMENT,
      page: () => const EtablissementScreen(),
      binding: EtablissementControllerBinding(),
    ),
    GetPage(
      name: Routes.GENERATE_TEXT,
      page: () => const GenerateTextScreen(),
      binding: GenerateTextControllerBinding(),
    ),
    GetPage(
      name: Routes.CARTE,
      page: () => const CarteScreen(),
      binding: CarteControllerBinding(),
    ),
    GetPage(
      name: Routes.SCHOOL,
      page: () => const SchoolScreen(),
      binding: SchoolControllerBinding(),
    ),
    GetPage(
      name: Routes.STUDENT,
      page: () => const StudentScreen(),
      binding: StudentControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_SCREE,
      page: () => const ProfileScreeScreen(),
      binding: ProfileScreeControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_SCREEN,
      page: () => const ProfileScreenScreen(),
      binding: ProfileScreenControllerBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_SCREEN,
      page: () => const SearchScreenScreen(),
      binding: SearchScreenControllerBinding(),
    ),
  ];
}
