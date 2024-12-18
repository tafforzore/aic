import '../../infrastructure/dal/dtos/etablissement_dto.dart';
import '../../infrastructure/dal/enum/etablissementenum.dart';
import '../entities/etablissement.dart';

class EtablissmentEntity{
  EtablissmentEnum etablissmentEnum;
  List<Etablissement>? etablissement;

  EtablissmentEntity({
    required this.etablissmentEnum,
    this.etablissement,
  });
}