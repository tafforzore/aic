import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/etablissement.dart';
import '../../generated/locales.g.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/custom_appbar.dart';
import '../components/not_found.dart';
import 'controllers/etablissement.controller.dart';

class EtablissementScreen extends GetView<EtablissementController> {
  const EtablissementScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: LocaleKeys.school.tr,
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
                  child: NotFound(text: LocaleKeys.list_school_not_found.tr,),
                );
              }else{
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final establishment = controller.etablissements[index];
                      return Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 1.0, top: 1.0),
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              etablissement.logo ?? '',
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
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    etablissement.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Année académique: ${etablissement.academicYear}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Devise: ${etablissement.devise}",
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
                        child: const Text(
                          "Supprimer",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          controller.goToNextPage(etablissement);
                        },
                        child: const Text(
                          "Aller",
                          style: TextStyle(color: Colors.blueAccent),
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
                  etablissement.logo!.isNotEmpty?
                  Image.network(
                    etablissement.logo??'',
                    height: 70,
                    width: 100,
                    fit: BoxFit.cover,
                  ) :
                  Image.asset('assets/images/default_etab.png',height: 70,
                    width: 100,
                    fit: BoxFit.cover,)
                  ,
                  Container(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        Text(
                          etablissement.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                        Container(height: 5),
                        Text(
                          etablissement.academicYear??"",
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
