class PrevisaoDia {
  const PrevisaoDia({required this.data, this.tMin, this.tMax, this.precipitaProb});

  final DateTime data;
  final double? tMin;
  final double? tMax;
  final double? precipitaProb;

  /// Constrói a partir de uma entrada da lista `data` do JSON de previsão
  /// diária do IPMA. Devolve `null` se faltar a data (o resto dos campos é
  /// opcional, mostra-se "—" se não vier preenchido).
  static PrevisaoDia? fromJson(Map<String, dynamic> json) {
    final dataTexto = json['forecastDate'];
    if (dataTexto is! String) return null;
    final data = DateTime.tryParse(dataTexto);
    if (data == null) return null;

    return PrevisaoDia(
      data: data,
      tMin: _paraDouble(json['tMin']),
      tMax: _paraDouble(json['tMax']),
      precipitaProb: _paraDouble(json['precipitaProb']),
    );
  }

  static double? _paraDouble(Object? valor) {
    if (valor == null) return null;
    if (valor is num) return valor.toDouble();
    if (valor is String) return double.tryParse(valor);
    return null;
  }
}
