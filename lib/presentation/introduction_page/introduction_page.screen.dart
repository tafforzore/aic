import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../infrastructure/navigation/routes.dart';
import 'controllers/introduction_page.controller.dart';

class IntroductionPageScreen extends GetView<IntroductionPageController> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.toNamed(Routes.REGISTER);
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
          title: "Welcome to Our App!",
          body: "Discover the best features of our app.",
          image: _buildImage('images/cameras.png'),
          decoration: pageDecoration.copyWith(
            bodyAlignment: Alignment.center, // Center the body
            imageAlignment: Alignment.center, // Center the image
          ),
        ),
        PageViewModel(
          title: "Seamless Integration",
          body: "Enjoy smooth experience across all devices.",
          image: _buildImage('images/carte.png'),
          decoration: pageDecoration.copyWith(
            bodyAlignment: Alignment.center,
            imageAlignment: Alignment.center,
          ),
        ),
        PageViewModel(
          title: "Start Now!",
          body: "Let’s get started and explore.",
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
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done'),
    );
  }
}
