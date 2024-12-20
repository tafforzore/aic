import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../domain/entities/student.dart';
import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/custom_appbar.dart';
import '../components/not_found.dart';
import 'controllers/student.controller.dart';

class StudentScreen extends GetView<StudentController> {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(onPressed: (){
          Get.back;
          Get.offNamed(Routes.SCHOOL);
        }, icon: Icon(Icons.arrow_back, color: AppColor.whiteColor,weight: 10,)),
        title: Text('Listes des '+LocaleKeys.student.tr,
          style: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Obx(() {
        if (!controller.hide.value) {
          if (controller.students.isEmpty) {
            return NotFound(text: LocaleKeys.list_school_not_found.tr,);
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: controller.students.map((student) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: _buildStudentItem(student),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        } else {
          return ShimmerEtablissement();
        }
      }),
    );
  }

  Widget dialog(Student student) {
    return Dialog(
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
            student.image_url!.isNotEmpty
                ? Image.network(
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
            )
                : Image.asset(
              'assets/images/default_student.png',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nom :' + student.firstName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Prenom :' + student.lastName,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Matricule :' + student.matricule,
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
                          Get.back();
                        },
                        child: Text(
                          "Annuler",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.goToNextPage(student);
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

  Widget _buildStudentItem(Student student) {
    return InkWell(
      onTap: () {
        Get.dialog(dialog(student));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              student.image_url!.isNotEmpty
                  ? Image.network(
                student.image_url!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
                  : Image.asset('assets/images/default_student.png'),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nom :' + student.firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Prenom :' + (student.lastName ?? ''),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Matricule :' + student.matricule,
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
      ),
    );
  }
}
