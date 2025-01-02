import 'package:finalaic/presentation/components/app_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/etablissement.dart';
import '../../domain/entities/school.dart';
import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/custom_appbar.dart';
import '../components/not_found.dart';
import 'controllers/school.controller.dart';

class SchoolScreen extends GetView<SchoolController> {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadData();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           CustomAppBar(
              title:  controller.etablissement.value,
              backgroundImageUrl: "https://via.placeholder.com/800x400",
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(LocaleKeys.notification_press.tr)),
                    );
                  },
                ),
              ],
            ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10, top: 5),
                    child: Text(LocaleKeys.classrooms.tr, style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: AppSize.titleSize+7
                    ),)
                ),
              ],
            ),
          ),
          Obx(() {
            if (!controller.hide.value) {
              if (controller.schools.isEmpty) {
                return SliverToBoxAdapter(
                  child: NotFound(text: LocaleKeys.list_school_not_found.tr,)
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final school = controller.schools[index];
                      return Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: _buildEstablismentItem(school),
                        ),
                      );
                    },
                    childCount: controller.schools.length,
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

  Widget dialog(Classe etablissement) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image.network(
            //   etablissement.logo ?? '',
            //   height: 100,
            //   width: 100,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 10),
            Text(
              '${LocaleKeys.classe.tr} :${etablissement.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            // Text(
            //   "Année académique: ${etablissement.academicYear}",
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: Colors.grey[600],
            //   ),
            // ),
            SizedBox(height: 10),
            // Text(
            //   "Devise: ${etablissement.devise}",
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: Colors.grey[600],
            //   ),
            // ),
            // SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(LocaleKeys.close.tr),
                ),
                SizedBox(width: 15.sp,),
                ElevatedButton(
                  onPressed: () {
                    controller.goToNextPage(etablissement);
                  },
                  child: Text(LocaleKeys.go_to.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstablismentItem(Classe classe) {
    return InkWell(
      onTap: () {
        Get.dialog(dialog(classe));
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.school)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Image.network(
                      //   classe.logo ?? '',
                      //   height: 100,
                      //   width: 100,
                      //   fit: BoxFit.cover,
                      // ),
                      Container(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(height: 5),
                            Text(
                              classe.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey[800],
                              ),
                            ),
                            Container(height: 5),
                            // Text(
                            //   classe.academicYear ?? '',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.grey[500],
                            //   ),
                            // ),
                            // Container(height: 10),
                            // Text(
                            //   classe.cachet,
                            //   maxLines: 2,
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Colors.grey[700],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(Icons.navigate_next_rounded, color: AppColor.primaryColor, size: 20.sp,),
                      )
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
}
