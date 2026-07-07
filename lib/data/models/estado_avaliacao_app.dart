import 'package:isar_community/isar.dart';

part 'estado_avaliacao_app.g.dart';

/// Registo único que controla quando o convite para avaliar a app foi
/// mostrado pela última vez — a partir do 2º dia de uso, depois no máximo
/// semanalmente (e sempre que se gera um relatório), nunca como condição
/// para usar a app.
@collection
class EstadoAvaliacaoApp {
  Id id = 0;

  DateTime? ultimaVezMostrado;
}
