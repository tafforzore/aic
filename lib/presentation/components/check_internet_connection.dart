import 'package:finalaic/presentation/no_internet_connexion/no_internet_connexion.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/internet_connection_controller.dart';

class CheckInternetConnection extends StatelessWidget {
  final controller = Get.find<IntenetConnexionController>();
  Widget child;

  CheckInternetConnection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.hasConnection.value
            ? child :
        NoInternetConnexionScreen(),
      );
    });
  }

}