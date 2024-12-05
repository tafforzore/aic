import 'package:finalaic/main.dart';
import 'package:finalaic/presentation/components/app_colors.dart';
import 'package:finalaic/presentation/components/app_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../components/custom_appbar.dart';
import 'controllers/pin_code_page.controller.dart'  ;

class PinCodePageScreen extends GetView<PinCodePageController> {
  const PinCodePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          // CustomAppBar(
          //   title: "Mon Titre", // Titre dynamique
          //   backgroundImageUrl: "https://via.placeholder.com/800x400", // URL de l'image de fond
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.notifications, color: Colors.white),
          //       onPressed: () {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("Notifications clicked")),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 12.sp,
          ),
          inputText(),
            SizedBox(
              height: 12.sp,
            ),
            GridView.count(
              crossAxisCount: 3,
              children: [
                button("1"),
                button("2"),
                button("3"),
                button("4"),
                button("5"),
                button("6"),
                button("7"),
                button("8"),
                button("9"),
                button("0"),
              ],
            )
        ]
      )
    );
  }

  Widget button(String number){
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,border: Border.all(color: AppColor.primaryColor, width: 5.sp)
        ),
        child: Text(number, style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: AppSize.titleSize
        ),),
      ),
    );
  }

  Widget inputText(){
    return Row(
      children: [

      ],
    );
  }
}
