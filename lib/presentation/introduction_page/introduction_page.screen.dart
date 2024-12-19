import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import 'controllers/introduction_page.controller.dart';

class IntroductionPageScreen extends GetView<IntroductionPageController> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.offNamed(Routes.REGISTER);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 18.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: LocaleKeys.welcome_app.tr,
          body: LocaleKeys.welcome_app_text.tr,
          image: _buildImage('images/cameras.png'),
          decoration: pageDecoration.copyWith(
            bodyAlignment: Alignment.center, // Center the body
            imageAlignment: Alignment.center, // Center the image
          ),
        ),
        PageViewModel(
          title: LocaleKeys.seamless_integration.tr,
          body: LocaleKeys.seamless_integration_text.tr,
          image: _buildImage('images/carte.png'),
          decoration: pageDecoration.copyWith(
            bodyAlignment: Alignment.center,
            imageAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          title: LocaleKeys.Start_Now.tr,
          body: LocaleKeys.Start_Now_text.tr,
          image: _buildImage('images/banderole.png'),
          decoration: pageDecoration.copyWith(
            bodyAlignment: Alignment.center,
            imageAlignment: Alignment.center,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip:  Text(LocaleKeys.Skip.tr),
      next:  Icon(Icons.arrow_forward),
      done:  Text(LocaleKeys.Done.tr),
    );
  }
}
