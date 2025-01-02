import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../generated/locales.g.dart';
import '../components/app_colors.dart';
import '../components/custon_button.dart';
import 'controllers/no_internet_connexion.controller.dart';

class NoInternetConnexionScreen extends GetView<NoInternetConnexionController> {
  const NoInternetConnexionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back, color: AppColor.whiteColor, size: 20.sp,)),
            title: Text(LocaleKeys.error.tr, style: TextStyle(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold
            ),
            )),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  shape: BoxShape.circle,

                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/no_connexion.png',width: 60.w,),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.sp,),
              Container(
                width: 70.w,
                child: Text(
                  LocaleKeys.no_internet_connection.tr,textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 50.sp,),
              SizedBox(
                  width: 50.w,
                  child: CustomButton(text: LocaleKeys.retry.tr, onPressed: ()async{Get.back();},))
            ],
          ),
        )
    );
  }
}
