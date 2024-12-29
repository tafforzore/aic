import 'package:finalaic/datas/local_storage/encrypted_storage.dart';
import 'package:finalaic/presentation/components/app_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/app_colors.dart';
import '../components/bottom_sheet.dart';
import 'controllers/profile_screen.controller.dart';

class ProfileScreenScreen extends GetView<ProfileScreenController> {
  const ProfileScreenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          LocaleKeys.profile.tr,
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: AppSize.titleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 32.sp,

                          backgroundImage: AssetImage(
                              'assets/images/defaut_user.png'),
                        ),
                        Container(
                          width: 23.5.sp,
                          height: 23.5.sp,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.pending_actions_outlined, color: AppColor.whiteColor,),
                            onPressed: () {
                              controller.pickImageFromGallery();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      LocaleKeys.profile_setting_information.tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildSectionTitle(LocaleKeys.personal_information.tr),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileDetail(LocaleKeys.username.tr, controller.username),
                    _buildProfileDetail(LocaleKeys.email.tr, controller.email),
                    _buildProfileDetail(LocaleKeys.phonenumber.tr, controller.number)
                  ],
                ),
              ),
              SizedBox(height: 10),

              SizedBox(height: 10),
              _buildSectionTitle(LocaleKeys.profile_setting.tr),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileOption(LocaleKeys.change_language.tr, Icons.language,(){FastCreateCards.changeLanguage(context);}),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileOption(
                        LocaleKeys.theme.tr, Icons.palette, () {
                         FastCreateCards.changeTheme(context);
                    }),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileOption(
                        LocaleKeys.change_password.tr, Icons.lock, () {
                        FastCreateCards.changePassword(context);
                    }),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileOption(
                        LocaleKeys.logout.tr, Icons.logout,
                            ()async {
                              await Get.find<EncryptedStorage>().removeToken();
                              await Get.find<EncryptedStorage>().removeToken();
                              Get.offAllNamed(await Routes.initialRoute);
                          }),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0.sp, bottom: 8.0.sp),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppSize.textSize,
          fontWeight: FontWeight.bold,
          color: AppColor.blackColor,
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, RxString value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0.sp),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 15.sp),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: AppSize.textSize, fontWeight: FontWeight.w500),
            ),

            Text(
              value.obs.string,
              style: TextStyle(
                  fontSize: AppSize.textSize, color: Colors.grey[600]),
            ),
          ],
        ) ,
      ),
    );
  }

  Widget _buildProfileOption(String label, IconData icon, Function() onpress) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0.sp, horizontal: 12.sp),
      tileColor: AppColor.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      title: Text(
        label,
        style: TextStyle(
            fontSize: AppSize.textSize, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(icon, color: AppColor.primaryColor),
      onTap: onpress,
    );
  }

  Widget _buildSwitchOption(String label, bool value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          label,
          style: TextStyle(
              fontSize: AppSize.textSize, fontWeight: FontWeight.w500),
        ),
        value: value,
        onChanged: (bool newValue) {},
        activeColor: AppColor.primaryColor,
      ),
    );
  }
}
