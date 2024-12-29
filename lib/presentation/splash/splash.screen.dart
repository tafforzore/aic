import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../components/app_colors.dart';
import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/aic-logo.png', width: 100.sp),
                Container(
                  width: 80.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Artificial ',
                        style: TextStyle(fontSize: 20.sp, color: AppColor.primaryColor, fontStyle:FontStyle.italic, fontWeight: FontWeight.w600, letterSpacing: .3),
                      ),
                      Text(
                        'Intelligence ',
                        style: TextStyle(fontSize: 20.sp, color: AppColor.primaryColor, fontStyle:FontStyle.italic, fontWeight: FontWeight.w600, letterSpacing: .3),
                      ),
                      Text(
                        ' Card',
                        style: TextStyle(fontSize: 20.sp, color: Colors.red, fontStyle:FontStyle.italic, fontWeight: FontWeight.w600, letterSpacing: .3),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
