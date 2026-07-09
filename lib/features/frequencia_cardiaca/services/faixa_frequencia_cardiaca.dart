/// Classificação do valor de BPM medido, para dar uma indicação visual
/// rápida (Normal/Baixa/Elevada) — não é um diagnóstico.
enum FaixaFrequenciaCardiaca { baixa, normal, elevada }

/// Calcula a idade em anos completos a partir da data de nascimento.
int calcularIdadeAnos(DateTime dataNascimento, {DateTime? agora}) {
  final referencia = agora ?? DateTime.now();
  var idade = referencia.year - dataNascimento.year;
  final aindaNaoFezAnos = referencia.month < dataNascimento.month ||
      (referencia.month == dataNascimento.month && referencia.day < dataNascimento.day);
  if (aindaNaoFezAnos) idade--;
  return idade;
}

/// Classifica [bpm] consoante os intervalos de referência para a idade
/// (ou o intervalo de adulto, se a idade não for conhecida).
FaixaFrequenciaCardiaca classificarFrequenciaCardiaca(int bpm, {int? idadeAnos}) {
  final intervalo = _intervaloNormal(idadeAnos);
  if (bpm < intervalo.minimo) return FaixaFrequenciaCardiaca.baixa;
  if (bpm > intervalo.maximo) return FaixaFrequenciaCardiaca.elevada;
  return FaixaFrequenciaCardiaca.normal;
}

({int minimo, int maximo}) _intervaloNormal(int? idadeAnos) {
  if (idadeAnos == null) return (minimo: 60, maximo: 100);
  if (idadeAnos < 1) return (minimo: 100, maximo: 160);
  if (idadeAnos < 3) return (minimo: 80, maximo: 130);
  if (idadeAnos < 5) return (minimo: 80, maximo: 120);
  if (idadeAnos < 7) return (minimo: 75, maximo: 115);
  if (idadeAnos < 10) return (minimo: 70, maximo: 110);
  return (minimo: 60, maximo: 100);
}

String labelFaixaFrequenciaCardiaca(FaixaFrequenciaCardiaca faixa) {
  return switch (faixa) {
    FaixaFrequenciaCardiaca.baixa => 'Baixa',
    FaixaFrequenciaCardiaca.normal => 'Normal',
    FaixaFrequenciaCardiaca.elevada => 'Elevada',
  };
}
