import 'package:isar/isar.dart';

part 'info_local_cache.g.dart';

/// Cache local da última previsão do tempo e avisos obtidos do IPMA,
/// guardados como JSON em bruto — permite mostrar "última atualização há
/// X" quando não há ligação à internet.
@collection
class InfoLocalCache {
  Id id = 0;

  String? previsaoJson;
  String? avisosJson;
  DateTime? atualizadoEm;
}
