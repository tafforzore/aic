import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle textStyle;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderColor = Colors.blue,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.textStyle = const TextStyle(fontSize: 16, color: Colors.blue),
  }) : super(key: key);

  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(color: borderColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      onPressed: isLoading.value
          ? null
          : () async {
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 4));
        onPressed();
        isLoading.value = false;
      },
      child: isLoading.value
          ?  CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
      )
          : Text(
        text,
        style: textStyle,
      ),
    ));
  }
}
