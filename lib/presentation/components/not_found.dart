import 'package:finalaic/infrastructure/navigation/routes.dart';
import 'package:finalaic/presentation/components/custon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class NotFound extends StatelessWidget{
  String text;
  NotFound({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Image.asset('assets/images/empty.png',width: 60.w,),
          ),
          Container(
            width: 70.w,
            child: Text(
              text,textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(height: 40.sp,),
          SizedBox(
              width: 50.w,
              child: CustomButton(text: 'Accueil', onPressed: ()async{Get.offAllNamed(Routes.HOME);},))
        ],
      ),
    );
  }

}