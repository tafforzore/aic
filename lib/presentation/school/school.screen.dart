import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../domain/entities/etablissement.dart';
import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/custom_appbar.dart';
import 'controllers/school.controller.dart';

class SchoolScreen extends GetView<SchoolController> {
  const SchoolScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: LocaleKeys.classe.tr,
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
              if (controller.etablissements.isEmpty) {
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
                      final establishment = controller.etablissements[index];
                      return Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: _buildEstablismentItem(establishment),
                        ),
                      );
                    },
                    childCount: controller.etablissements.length,
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

  Widget dialog(Etablissement etablissement){
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              etablissement.logo,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              etablissement.nom_etab,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Année académique: ${etablissement.annee_academique}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Devise: ${etablissement.devise}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Fermer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.STUDENT);
                  },
                  child: Text("Aller"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstablismentItem(Etablissement etablissement) {
    return InkWell(
      onTap: (){
        Get.dialog(dialog(etablissement));
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
                  Image.network(
                    etablissement.logo,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        Text(
                          etablissement.nom_etab,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                        Container(height: 5),
                        Text(
                          etablissement.annee_academique,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                        Container(height: 10),
                        Text(
                          etablissement.devise,
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
