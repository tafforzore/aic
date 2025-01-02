import 'package:finalaic/infrastructure/dal/enum/etablissementenum.dart';
import 'package:finalaic/infrastructure/dal/services/school_service.dart';
import 'package:get/get.dart';

import '../../../domain/entities/card_prototype.dart';
import '../../../domain/entities/etablissement.dart';
import '../../../domain/entity_response/card_protitype_entity.dart';
import '../../../infrastructure/navigation/routes.dart';

class SearchScreenController extends GetxController {
  //TODO: Implement SearchScreenController
  RxBool isLoading = false.obs;

  Future<void> refreshData() async {
    await Future.delayed(Duration(seconds: 2));
  }



  final List<String> imageUrls = [
    'https://via.placeholder.com/800x400.png?text=Image+1',
    'https://via.placeholder.com/800x400.png?text=Image+2',
    'https://via.placeholder.com/800x400.png?text=Image+3',
    'https://via.placeholder.com/800x400.png?text=Image+4',
  ];

  RxList<CardPrototype> prototypeCards = <CardPrototype>[].obs;

  List<Etablissement> etablissements = [
    Etablissement(
      id: 1,
      name: "Université de Paris",
      devise: "Liberté, Égalité, Fraternité",
      contact: "contact@universite-paris.fr",
      logo: "",

      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: 'null',
    ),
    Etablissement(
      id: 2,
      name: "École Polytechnique",
      devise: "Excellence, Innovation",
      contact: "contact@polytechnique.fr",
      logo: "",
      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
    ),
    Etablissement(
      id: 3,
      name: "Université de Lyon",
      devise: "Savoir et Partage",
      contact: "contact@universite-lyon.fr",
      logo: "",

      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
    ),
    Etablissement(
      id: 4,
      name: "École des Mines",
      devise: "Technologie et Futur",
      contact: "contact@ecole-des-mines.fr",
      logo: "",

      academicYear: "2023-2024",
      cachet: null,
      signaturePrincipale: null,
      user: null, phone: '',
    ),
  ];



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  getCards() async {
    isLoading.value = true; // Commencez à charger
    try {
      CardProtypeEntity cardProtypeEntity = await SchoolService().getCardPrototype();
      if (cardProtypeEntity.cardProtitypeEnum == CardProtitypeEnum.OK) {
        prototypeCards.assignAll(cardProtypeEntity.listCard!);
        print('mes proto ${prototypeCards}');
      } else {
        Get.toNamed(Routes.ERROR_PAGE);
      }
    } catch (e) {
      print('Error fetching cards: $e');
      Get.toNamed(Routes.ERROR_PAGE);
    } finally {
      isLoading.value = false; // Arrêtez de charger
    }
  }

  @override
  void onReady() async{
    super.onReady();
   getCards();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
