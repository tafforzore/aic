import 'package:finalaic/generated/locales.g.dart';
import 'package:finalaic/presentation/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../infrastructure/navigation/routes.dart';
import '../components/app_size.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // Background images
            Image.asset('assets/images/photographe4.png', height: 28.h),
            Positioned(
              bottom: 1.0,
              right: 1.0,
              child: Image.asset('assets/images/photographe5_r.png', height: 28.h),
            ),

            // Content
            ListView(
              children: [
                SizedBox(height: 10.h),
                Image.asset('assets/images/aic-logo.png', width: 30.sp, height: 30.sp),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: AppSize.textSize),

                          // Title
                          Text(
                            LocaleKeys.connexion.tr,
                            style: TextStyle(
                              fontSize: AppSize.titleSize,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),

                          SizedBox(height: AppSize.textSize),

                          // Error message
                          Obx(() {
                            return Text(
                              controller.error.value,
                              style: TextStyle(
                                fontSize: AppSize.textSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            );
                          }),

                          SizedBox(height: AppSize.textSize),

                          // Username field
                          TextField(
                            controller: controller.username,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.username.tr,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                gapPadding: 10,
                              ),
                              labelStyle: TextStyle(
                                fontSize: AppSize.textSize,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),

                          SizedBox(height: AppSize.textSize),

                          // Password field
                          TextField(
                            controller: controller.password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: LocaleKeys.password.tr,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                gapPadding: 10,
                              ),
                              labelStyle: TextStyle(
                                fontSize: AppSize.textSize,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),

                          SizedBox(height: AppSize.textSize),

                          // Actions row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.FORGET_PASSWORD);
                                },
                                child: Text(
                                  LocaleKeys.lost_password.tr,
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.REGISTER);
                                },
                                child: Text(
                                  LocaleKeys.inscription.tr,
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSize.textSize),

                          // Login button
                          Obx(() {
                            return TextButton(
                              style: TextButton.styleFrom(
                                side: BorderSide(color: AppColor.primaryColor, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              onPressed: controller.isLoading.value
                                  ? null // Disable button while loading
                                  : controller.loginAction,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    LocaleKeys.connexion.tr,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: AppSize.textSize,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),

                          SizedBox(height: AppSize.textSize),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Loading spinner
            Obx(() {
              if (controller.isLoading.value) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                      ),
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
