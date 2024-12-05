import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalaic/presentation/components/app_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../domain/entities/etablissement.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/app_colors.dart';
import 'controllers/search_screen.controller.dart';

class SearchScreenScreen extends GetView<SearchScreenController> {
  const SearchScreenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [ Text("Mes cartes ", style: TextStyle(
                  fontSize: AppSize.titleSize,
                  fontWeight: FontWeight.bold
              ),)],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: controller.imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              'Image ${controller.imageUrls.indexOf(imageUrl) + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("cartes Recents ", style: TextStyle(
                fontSize: AppSize.titleSize,
                fontWeight: FontWeight.bold
              ),),
                IconButton(
                  icon: Icon(Icons.filter_list, color: AppColor.primaryColor),
                  onPressed: () {
                    //mùodals acron
                  },
                ),

              ],
            ),
            Expanded(child:
            ListView.builder(
              itemCount: controller.etablissements.length,
               itemBuilder: (BuildContext context, int index) {
              final establishment = controller.etablissements[index];
                return Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: _buildEstablismentItem(establishment),
                  ),
                );
            },
            )
            )
          ],
        ),
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
              etablissement.logo,
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
                    etablissement.nom_etab,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Année académique: ${etablissement.annee_academique}",
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
                          // Action for SHARE
                        },
                        child: const Text(
                          "Supprimer",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.CARTE);
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
