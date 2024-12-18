import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../generated/locales.g.dart';
import '../../infrastructure/navigation/routes.dart';
import '../components/Shimmer.dart';
import '../components/app_colors.dart';
import '../components/app_size.dart';
import 'controllers/home.controller.dart';

class HomePageScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return  Obx((){
      return controller.pages[controller.selectedIndex.value];
    });
  }

   BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: (index) => controller.changePage(index),
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.change.value) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                _buildWelcomeSection(),
                SizedBox(height: 3.h),
                ActionPage.buildSearchBar(),
                SizedBox(height: 2.h),
                ActionPage.buildGridActions(),
                SizedBox(height: 2.h),
                _buildRecentFilesHeader(),
                _buildRecentFilesList(),
              ],
            ),
          ),
          floatingActionButton: ActionPage.buildFloatingActionButtons(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: HomePageScreen().buildBottomNavigationBar(),
        );
      } else {
        return  Scaffold(body: ShimmerTile());
      }
    });
  }

  /// Widget: Section de bienvenue
  Widget _buildWelcomeSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Bienvenu sur ",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: AppSize.titleSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          "AIC",
          style: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: AppSize.titleSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentFilesHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Text(
        LocaleKeys.recent.tr,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildRecentFilesList() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ActionPage.buildFileItem(
          title: "ACE Scanner_2024_09_30",
          subtitle: "1 page - 2024/09/30",
          icon: Icons.picture_as_pdf,
        ),
        ActionPage.buildFileItem(
          title: "Fichier exemple",
          subtitle: "6 pages - 2024/09/30",
          icon: Icons.file_present,
        ),
      ],
    );
  }
}

class ActionPage {
  
  static Widget buildSearchBar() {
    return Material(
      child: TextField(
        decoration: InputDecoration(
          hintText: LocaleKeys.search.tr,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// Widget: Grille d'actions
  static Widget buildGridActions() {
    final actions = [
      {"icon": Icons.text_fields, "label": LocaleKeys.extract_text.tr, "onTap": _extractText},
      {"icon": Icons.school, "label": LocaleKeys.new_school.tr, "onTap": _newSchool},
      {"icon": Icons.add_card, "label": LocaleKeys.create_card.tr, "onTap": _createCard},
      {"icon": Icons.credit_card, "label": LocaleKeys.My_card.tr, "onTap": _showMyCard},
      {"icon": Icons.download, "label": LocaleKeys.download.tr, "onTap": _download},
      {"icon": Icons.school_rounded, "label": LocaleKeys.etudiant_card.tr, "onTap": _studentCard},
      {"icon": Icons.badge, "label": LocaleKeys.badge, "onTap": _badge},
      {"icon": Icons.palette, "label": LocaleKeys.theme, "onTap": _changeTheme},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
          mainAxisExtent: 100
      ),
      itemBuilder: (context, index) {
        final action = actions[index];
        return GestureDetector(
          onTap: () {
            if (action["onTap"] != null) {
              (action["onTap"] as Function)();
            }
          },
          child: _buildGridItem(
            action["icon"] as IconData,
            action["label"] as String,
          ),
        );
      },
    );
  }

  /// Widget: Élément individuel de la grille
  static Widget _buildGridItem(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue[100],
              child: Icon(icon, color: AppColor.primaryColor, size: 24),
            ),
            SizedBox(height: 5),
            Container(
              width: 20.w,
              height: 7.w,
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Widget: Élément de fichier
  static Widget buildFileItem({required String title, required String subtitle, required IconData icon}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: AppColor.primaryColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        trailing: const Icon(Icons.more_vert, color: Colors.grey),
      ),
    );
  }

  static Widget buildFloatingActionButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "new card",
          // onPressed: () => controller.newCard(context),
          onPressed: () => (){

          },
          backgroundColor: Colors.blue[100],
          child: Icon(Icons.camera_alt, color: AppColor.primaryColor),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: "btn2",
          // onPressed: () => Get.dialog(newCard(context)),
          onPressed: () {
            fastCreateCard(context);
          },
          backgroundColor: Colors.blue[100],
          child: Icon(Icons.add, color: AppColor.primaryColor),
        ),
      ],
    );
  }

  /// Actions associées
  static void _extractText() {
    Get.toNamed(Routes.GENERATE_TEXT);
    Get.snackbar("Extract Text", "Fonctionnalité d'extraction activée !");
  }

  static void _newSchool() {
    Get.toNamed(Routes.ETABLISSEMENT);
  }

  static void _createCard() {
    Get.snackbar("Create Card", "Création d'une carte personnalisée !");
  }

  static void _showMyCard() {
    Get.snackbar("My Card", "Affichage de votre carte !");
  }

  static void _download() {
    Get.snackbar("Download", "Téléchargement en cours...");
  }

  static void _studentCard() {
    Get.snackbar("Etudiant Card", "Gestion des cartes étudiantes !");
  }

  static void _badge() {
    Get.snackbar("Badge", "Génération de badges...");
  }

  static void _changeTheme() {
    Get.snackbar("Theme", "Changement de thème !");
  }

  static void fastCreateCard(BuildContext context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        final controller = Get.find<HomeController>();
        return Padding(
          padding:  EdgeInsets.all(20.0.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Creer une Carte", style: TextStyle(
                    fontSize: AppSize.titleSize,
                    fontWeight: FontWeight.w800
                  ),)
                ],
              ),
              TextFormField(
                controller: controller.nomController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Prénom
              TextFormField(
                controller: controller.prenomController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Date de naissance
              TextFormField(
                controller: controller.dateNaissanceController,
                decoration: InputDecoration(labelText: 'Date de naissance'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre date de naissance';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Adresse
              TextFormField(
                controller: controller.adresseController,
                decoration: InputDecoration(labelText: 'Adresse'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre adresse';
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
                        borderRadius: BorderRadius.circular(20), // Bordures arrondies (facultatif)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Annuler",
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
                        borderRadius: BorderRadius.circular(20), // Bordures arrondies (facultatif)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed:controller.createCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Creer",
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

  // static Widget newCard(BuildContext context) {
  //   return Dialogs.bottomMaterialDialog(
  //     msg: 'Congratulations, you won 500 points',
  //     title: 'Congratulations',
  //     color: Colors.white,
  //     lottieBuilder: Lottie.asset(
  //       'assets/images/1 (1).json',
  //       fit: BoxFit.contain,
  //     ),
  //     context: context,
  //   );
  // }
}

