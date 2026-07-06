import 'package:isar_community/isar.dart';

part 'localizacao_selecionada.g.dart';

/// Registo único com a localização escolhida pelo utilizador para a
/// previsão do tempo e avisos oficiais.
@collection
class LocalizacaoSelecionada {
  Id id = 0;

  int? globalIdLocal;
  String? nome;
  String? idAreaAviso;
}
