import '../../../data/models/registo_sinais_vitais.dart';

/// Aviso a mostrar sempre que se apresentam alertas de sinais vitais.
const alertaSinaisVitaisAviso =
    'Valores de referência gerais da OMS para adultos em repouso. Não substitui avaliação médica.';

/// Devolve alertas em texto para valores de [registo] fora dos intervalos
/// de referência da OMS para adultos em repouso (pressão arterial,
/// temperatura, glicemia e frequência cardíaca). Não é um diagnóstico —
/// serve apenas para chamar a atenção do cuidador.
List<String> alertasSinaisVitais(RegistoSinaisVitais registo) {
  final alertas = <String>[];

  final sistolica = registo.pressaoSistolica;
  final diastolica = registo.pressaoDiastolica;
  if (sistolica != null && diastolica != null) {
    if (sistolica >= 180 || diastolica >= 120) {
      alertas.add('Pressão arterial muito elevada (possível crise hipertensiva)');
    } else if (sistolica >= 140 || diastolica >= 90) {
      alertas.add('Pressão arterial elevada (hipertensão)');
    } else if (sistolica < 90 || diastolica < 60) {
      alertas.add('Pressão arterial baixa (hipotensão)');
    }
  }

  final temperatura = registo.temperatura;
  if (temperatura != null) {
    if (temperatura >= 39) {
      alertas.add('Febre alta');
    } else if (temperatura >= 38) {
      alertas.add('Febre');
    } else if (temperatura < 35) {
      alertas.add('Temperatura corporal muito baixa (hipotermia)');
    }
  }

  final glicemia = registo.glicemia;
  if (glicemia != null) {
    if (glicemia < 70) {
      alertas.add('Glicemia baixa (hipoglicemia)');
    } else if (glicemia >= 180) {
      alertas.add('Glicemia muito elevada');
    } else if (glicemia >= 140) {
      alertas.add('Glicemia elevada');
    }
  }

  final frequencia = registo.frequenciaCardiaca;
  if (frequencia != null) {
    if (frequencia < 60) {
      alertas.add('Frequência cardíaca baixa (bradicardia)');
    } else if (frequencia > 100) {
      alertas.add('Frequência cardíaca elevada (taquicardia)');
    }
  }

  return alertas;
}
