import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../generated/locales.g.dart';
import '../home/controllers/home.controller.dart';
import 'app_colors.dart';
import 'app_size.dart';
import 'controller/fast_create_card_controller.dart';

class FastCreateCards{
  static final controller = Get.find<FastCreateCardController>();

  static void fastCreateCard(BuildContext context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        final controller = Get.find<HomeController>();
        return Padding(
          padding:  EdgeInsets.only(bottom: 10.h, left: 30.sp, right: 30.sp, top: 30.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(LocaleKeys.create_card.tr, style: TextStyle(
                      fontSize: AppSize.titleSize,
                      fontWeight: FontWeight.w800
                  ),)
                ],
              ),
              TextFormField(
                controller: controller.nomController,
                decoration: InputDecoration(labelText: LocaleKeys.name.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_name.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Prénom
              TextFormField(
                controller: controller.prenomController,
                decoration: InputDecoration(labelText: LocaleKeys.last_name.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_surname.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Date de naissance
              TextFormField(
                controller: controller.dateNaissanceController,
                decoration: InputDecoration(labelText: LocaleKeys.birth_date.tr),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_birth_date.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Adresse
              TextFormField(
                controller: controller.adresseController,
                decoration: InputDecoration(labelText: LocaleKeys.adress.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_birth_adress.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: AppColor.danger, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(LocaleKeys.cancel.tr,
                          style:  TextStyle(color: AppColor.danger
                              , fontSize: AppSize.textSize),),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: AppColor.success, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(LocaleKeys.create.tr,
                          style:  TextStyle(color: AppColor.success
                              , fontSize: AppSize.textSize),),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        );
      },);
  }

   static void fastCreateCardWithCardType(BuildContext context, String card_url){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        final controller = Get.find<HomeController>();
        return Padding(
          padding:  EdgeInsets.only(bottom: 10.h, left: 30.sp, right: 30.sp, top: 30.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  card_url.isNotEmpty?
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(card_url),
                            fit: BoxFit.cover,
                          ),
                      )):
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/fond_ecrans.jpg"),
                                fit: BoxFit.cover,
                              ),
                        ))
                ],
              ),
              SizedBox(height: 10.sp,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(LocaleKeys.create_card.tr, style: TextStyle(
                      fontSize: AppSize.titleSize,
                      fontWeight: FontWeight.w800
                  ),)
                ],
              ),
              TextFormField(
                controller: controller.nomController,
                decoration: InputDecoration(labelText: LocaleKeys.name.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_name.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Prénom
              TextFormField(
                controller: controller.prenomController,
                decoration: InputDecoration(labelText: LocaleKeys.last_name.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_surname.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Date de naissance
              TextFormField(
                controller: controller.dateNaissanceController,
                decoration: InputDecoration(labelText: LocaleKeys.birth_date.tr),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_birth_date.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Adresse
              TextFormField(
                controller: controller.adresseController,
                decoration: InputDecoration(labelText: LocaleKeys.adress.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enter_your_birth_adress.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: AppColor.danger, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(LocaleKeys.cancel.tr,
                          style:  TextStyle(color: AppColor.danger
                              , fontSize: AppSize.textSize),),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: AppColor.success, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(LocaleKeys.create.tr,
                          style:  TextStyle(color: AppColor.success
                              , fontSize: AppSize.textSize),),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        );
      },);
  }

   static BottomNavigationBar buildBottomNavigationBar(controller) {
     return BottomNavigationBar(
       currentIndex: controller.selectedIndex.value,
       onTap: (index) => controller.changePage(index),
       selectedItemColor: AppColor.primaryColor,
       unselectedItemColor: Colors.grey,
       type: BottomNavigationBarType.fixed,
       elevation: 8,
       items:  [
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: LocaleKeys.home.tr,
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label: LocaleKeys.search.tr,
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.account_circle),
           label: LocaleKeys.profile.tr,
         ),
       ],
     );
   }

  static void changeTheme(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.theme.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Light Theme'),
                leading: Radio<bool>(
                  value: false,
                  groupValue: controller.isDarkMode.value,
                  onChanged: (value) {
                    controller.toggleTheme();
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: Text('Dark Theme'),
                leading: Radio<bool>(
                  value: true,
                  groupValue: controller.isDarkMode.value,
                  onChanged: (value) {
                    controller.toggleTheme();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void changePassword(BuildContext context){
     showModalBottomSheet(
       context: context,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
       ),
       builder: (BuildContext context) {
         final controller = Get.find<HomeController>();
         return Padding(
           padding:  EdgeInsets.only(bottom: 10.h, left: 30.sp, right: 30.sp, top: 30.sp),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(LocaleKeys.create_card.tr, style: TextStyle(
                       fontSize: AppSize.titleSize,
                       fontWeight: FontWeight.w800
                   ),)
                 ],
               ),
               TextFormField(
                 controller: controller.nomController,
                 decoration: InputDecoration(labelText: LocaleKeys.name.tr),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return LocaleKeys.enter_your_name.tr;
                   }
                   return null;
                 },
               ),
               SizedBox(height: 10),

               // Champ Prénom
               TextFormField(
                 controller: controller.prenomController,
                 decoration: InputDecoration(labelText: LocaleKeys.last_name.tr),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return LocaleKeys.enter_your_surname.tr;
                   }
                   return null;
                 },
               ),
               SizedBox(height: 10),

               // Champ Date de naissance
               TextFormField(
                 controller: controller.dateNaissanceController,
                 decoration: InputDecoration(labelText: LocaleKeys.birth_date.tr),
                 keyboardType: TextInputType.datetime,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return LocaleKeys.enter_your_birth_date.tr;
                   }
                   return null;
                 },
               ),
               SizedBox(height: 10),

               // Champ Adresse
               TextFormField(
                 controller: controller.adresseController,
                 decoration: InputDecoration(labelText: LocaleKeys.adress.tr),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return LocaleKeys.enter_your_birth_adress.tr;
                   }
                   return null;
                 },
               ),
               SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextButton(
                     style: TextButton.styleFrom(
                       side: BorderSide(color: AppColor.danger, width: 2),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                     ),
                     onPressed:controller.createCard,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       mainAxisSize: MainAxisSize.max,
                       children: [
                         Text(LocaleKeys.cancel.tr,
                           style:  TextStyle(color: AppColor.danger
                               , fontSize: AppSize.textSize),),
                       ],
                     ),
                   ),
                   SizedBox(
                     width: 15,
                   ),
                   TextButton(
                     style: TextButton.styleFrom(
                       side: BorderSide(color: AppColor.success, width: 2),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                     ),
                     onPressed:controller.createCard,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       mainAxisSize: MainAxisSize.max,
                       children: [
                         Text(LocaleKeys.create.tr,
                           style:  TextStyle(color: AppColor.success
                               , fontSize: AppSize.textSize),),
                       ],
                     ),
                   ),

                 ],
               )
             ],
           ),
         );
       },);
   }

  static void changeLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajuster les marges verticales
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.change_language.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Ajouter un petit espace ici
              ...controller.languages.map((language) {
                return ListTile(
                  title: Text(language['name']!),
                  leading: Radio<String>(
                    value: language['code']!,
                    groupValue: controller.selectedLanguage.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.changeLanguage(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }





}