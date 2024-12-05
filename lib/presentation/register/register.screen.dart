import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/app_colors.dart';
import '../components/app_size.dart';
import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/photographe4.png', height: 28.h,),
            ListView(
              children: [
                SizedBox(height: 7.h,),
                Image.asset(
                  'assets/images/aic-logo.png', width: 30.sp, height: 30.sp,),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: AppSize.titleSize),

                          Text(
                            "S'inscire",
                            style: TextStyle(fontSize: AppSize.titleSize,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          ),
                          SizedBox(height: AppSize.titleSize),
                          Obx(() {
                            return Text(
                              controller.errorText.value,
                              style: TextStyle(fontSize: AppSize.titleSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            );
                          }),
                          SizedBox(height: AppSize.titleSize),
                          TextField(
                            controller: controller.username,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  gapPadding: 10),
                              labelStyle: TextStyle(
                                  fontSize: AppSize.titleSize, color: AppColor.primaryColor),
                            ),
                          ),
                          SizedBox(height: AppSize.titleSize),
                          TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  gapPadding: 10),
                              labelStyle: TextStyle(
                                  fontSize: AppSize.titleSize, color: AppColor.primaryColor),
                            ),
                          ),
                          SizedBox(height: AppSize.titleSize),
                          TextField(
                            obscureText: true,
                            controller: controller.password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  gapPadding: 10),
                              labelStyle: TextStyle(
                                  fontSize: AppSize.titleSize, color: AppColor.primaryColor),),
                          ),
                          SizedBox(height: AppSize.titleSize),
                          TextField(
                              obscureText: true,
                              controller: controller.c_password,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    gapPadding: 10),
                                labelStyle: TextStyle(
                                    fontSize: AppSize.titleSize, color: AppColor.primaryColor),)
                          ),
                          SizedBox(height: AppSize.titleSize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.LOGIN);
                                },
                                child: Text("Connexion",
                                  style: TextStyle(color: AppColor.primaryColor),),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.titleSize),
                          TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: AppColor.primaryColor, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Bordures arrondies (facultatif)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            onPressed: controller.createAccount,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("S'inscrire",
                                  style: TextStyle(color: AppColor.primaryColor
                                      , fontSize: AppSize.titleSize),),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSize.titleSize),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
