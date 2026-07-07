import 'package:isar_community/isar.dart';

part 'item_rotina.g.dart';

enum CategoriaRotina { higiene, alimentacao }

/// Um item recorrente da rotina de higiene/alimentação de um idoso (ex.:
/// "Banho", "Pequeno-almoço"), funcionalidade Premium. As conclusões diárias
/// ficam registadas em [RegistoCuidadoDiario.itemRotinaId].
@collection
class ItemRotina {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  @Enumerated(EnumType.name)
  late CategoriaRotina categoria;

  late String nome;

  /// Permite pausar o item sem apagar o histórico de conclusões.
  bool ativo = true;

  late DateTime criadoEm;
}
