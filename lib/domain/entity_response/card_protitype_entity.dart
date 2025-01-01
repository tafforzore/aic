import '../../infrastructure/dal/dtos/etablissement_dto.dart';
import '../../infrastructure/dal/enum/etablissementenum.dart';
import '../entities/card_prototype.dart';
import '../entities/etablissement.dart';

class CardProtypeEntity{
  CardProtitypeEnum cardProtitypeEnum;
  List<CardPrototype>? listCard;

  CardProtypeEntity({
    required this.cardProtitypeEnum,
    this.listCard,
  });
}