import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/models/localidade_ipma.dart';
import '../models/aviso_meteorologico.dart';
import '../models/previsao_dia.dart';

class IpmaException implements Exception {
  IpmaException(this.mensagem);

  final String mensagem;

  @override
  String toString() => mensagem;
}

/// Consome os dados abertos do IPMA (api.ipma.pt) diretamente do
/// dispositivo — sem qualquer servidor próprio. Todos os dados vêm de uma
/// fonte pública oficial e são reutilizáveis livremente, com indicação da
/// fonte ("Dados: IPMA") na interface.
class IpmaService {
  IpmaService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const _timeout = Duration(seconds: 15);

  static const urlLocalidades = 'https://api.ipma.pt/open-data/distrits-islands.json';
  static const urlAvisos = 'https://api.ipma.pt/open-data/forecast/warnings/warnings_www.json';

  static String urlPrevisao(int globalIdLocal) {
    return 'https://api.ipma.pt/open-data/forecast/meteorology/cities/daily/$globalIdLocal.json';
  }

  /// Devolve o corpo (JSON em texto) da resposta, para poder ser guardado
  /// em cache tal e qual, e reaproveitado offline através das mesmas
  /// funções de parsing.
  Future<String> obterCorpo(String url) async {
    final http.Response resposta;
    try {
      resposta = await _client.get(Uri.parse(url)).timeout(_timeout);
    } catch (_) {
      throw IpmaException('Sem ligação à internet.');
    }
    if (resposta.statusCode != 200) {
      throw IpmaException('O IPMA não respondeu (${resposta.statusCode}).');
    }
    return utf8.decode(resposta.bodyBytes);
  }
}

List<dynamic> _decodificarLista(String corpoJson) {
  final corpo = jsonDecode(corpoJson);
  if (corpo is List) return corpo;
  if (corpo is Map && corpo['data'] is List) return corpo['data'] as List;
  throw IpmaException('Resposta inesperada do IPMA.');
}

List<LocalidadeIpma> parseLocalidades(String corpoJson) {
  return _decodificarLista(corpoJson)
      .whereType<Map<String, dynamic>>()
      .map(LocalidadeIpma.fromJson)
      .whereType<LocalidadeIpma>()
      .toList();
}

List<PrevisaoDia> parsePrevisao(String corpoJson) {
  final lista = _decodificarLista(corpoJson)
      .whereType<Map<String, dynamic>>()
      .map(PrevisaoDia.fromJson)
      .whereType<PrevisaoDia>()
      .toList();
  lista.sort((a, b) => a.data.compareTo(b.data));
  return lista;
}

List<AvisoMeteorologico> parseAvisos(String corpoJson, String idAreaAviso) {
  return _decodificarLista(corpoJson)
      .whereType<Map<String, dynamic>>()
      .where((item) => item['idAreaAviso'] == idAreaAviso)
      .map(AvisoMeteorologico.fromJson)
      .whereType<AvisoMeteorologico>()
      .toList();
}
