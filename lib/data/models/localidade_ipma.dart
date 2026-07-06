import 'package:isar_community/isar.dart';

part 'localidade_ipma.g.dart';

/// Uma localidade (distrito/ilha) do ficheiro de dados abertos do IPMA
/// (`distrits-islands.json`), guardada localmente após a primeira consulta
/// para a lista funcionar offline. O `id` é o próprio `globalIdLocal` do
/// IPMA, usado para pedir a previsão do tempo; `idAreaAviso` é usado para
/// os avisos meteorológicos oficiais (Premium).
@collection
class LocalidadeIpma {
  Id id = Isar.autoIncrement;

  @Index()
  late int globalIdLocal;

  late String nome;

  late String idAreaAviso;

  /// Constrói a partir de uma entrada do JSON do IPMA. Devolve `null` se
  /// faltar algum dos campos essenciais — mais vale ignorar uma entrada
  /// mal formada do que rebentar a lista toda.
  static LocalidadeIpma? fromJson(Map<String, dynamic> json) {
    final globalIdLocal = json['globalIdLocal'];
    final nome = json['local'];
    final idAreaAviso = json['idAreaAviso'];
    if (globalIdLocal is! int || nome is! String || idAreaAviso is! String) {
      return null;
    }
    return LocalidadeIpma()
      ..globalIdLocal = globalIdLocal
      ..nome = nome
      ..idAreaAviso = idAreaAviso;
  }
}
