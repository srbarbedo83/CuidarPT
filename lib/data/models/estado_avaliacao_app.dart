import 'package:isar/isar.dart';

part 'estado_avaliacao_app.g.dart';

/// Registo único que controla se o convite para avaliar a app já foi
/// mostrado — mostra-se uma única vez, num momento de valor percebido
/// (depois do primeiro relatório PDF), nunca como condição para usar a app.
@collection
class EstadoAvaliacaoApp {
  Id id = 0;

  bool jaMostrado = false;
}
