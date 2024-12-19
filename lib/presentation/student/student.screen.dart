import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../domain/entities/etablissement.dart';
import '../../domain/entities/student.dart';
import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/custom_appbar.dart';
import 'controllers/student.controller.dart';

class StudentScreen extends GetView<StudentController> {
  const StudentScreen({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: LocaleKeys.student.tr,
            backgroundImageUrl: "https://via.placeholder.com/800x400",
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Notifications clicked")),
                  );
                },
              ),
            ],
          ),

          Obx(() {
            if (!controller.hide.value) {
              if (controller.students.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      LocaleKeys.list_school_not_found.tr,
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }else{
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final student = controller.students[index];
                      return Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: _buildEstablismentItem(student),
                        ),
                      );
                    },
                    childCount: controller.students.length,
                  ),
                );
              }

            } else {
              return ShimmerEtablissement();
            }
          }),
        ],
      ),
    );
  }

  Widget dialog(Student student){
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            student.image_url!.isNotEmpty?
            Image.network(
              student.image_url!,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                ),
              ),
            ):
            Image.asset('assets/images/default_student.png',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                ),
              ),
            )
            ,
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nom :'+student.firstName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Prenom :'+student.lastName,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Matricule :'+student.matricule,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Action for SHARE
                        },
                        child:  Text(
                          "annuller",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.CARTE);
                        },
                        child: Text(
                          "Prendre Photos",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstablismentItem(Student student) {
    return InkWell(
      onTap: (){
        Get.dialog(dialog(student));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  student.image_url!.isNotEmpty?
                  Image.network(
                    student.image_url!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ):
                  Image.asset('assets/images/default_student.png')
                  ,
                  Container(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        Text(
                          'Nom :'+student.firstName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                        Container(height: 5),
                        Text(
                          'Prenom :'+student.lastName?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                        Container(height: 10),
                        Text(
                          'Matricule :'+student.matricule,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
