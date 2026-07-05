enum NivelAviso { amarelo, laranja, vermelho }

class AvisoMeteorologico {
  const AvisoMeteorologico({
    required this.tipo,
    required this.nivel,
    required this.inicio,
    required this.fim,
  });

  final String tipo;
  final NivelAviso nivel;
  final DateTime inicio;
  final DateTime fim;

  /// Constrói a partir de uma entrada do JSON de avisos meteorológicos do
  /// IPMA. Devolve `null` se faltar algum campo essencial, ou se o nível
  /// for "green" (sem aviso ativo) — só nos interessam avisos reais.
  static AvisoMeteorologico? fromJson(Map<String, dynamic> json) {
    final tipo = json['awarenessTypeName'];
    final nivelTexto = json['awarenessLevelID'];
    final inicioTexto = json['startTime'];
    final fimTexto = json['endTime'];

    if (tipo is! String || nivelTexto is! String || inicioTexto is! String || fimTexto is! String) {
      return null;
    }

    final nivel = _paraNivel(nivelTexto);
    if (nivel == null) return null;

    final inicio = DateTime.tryParse(inicioTexto);
    final fim = DateTime.tryParse(fimTexto);
    if (inicio == null || fim == null) return null;

    return AvisoMeteorologico(tipo: tipo, nivel: nivel, inicio: inicio, fim: fim);
  }

  static NivelAviso? _paraNivel(String texto) {
    switch (texto.toLowerCase()) {
      case 'yellow':
        return NivelAviso.amarelo;
      case 'orange':
        return NivelAviso.laranja;
      case 'red':
        return NivelAviso.vermelho;
      default:
        return null;
    }
  }
}
