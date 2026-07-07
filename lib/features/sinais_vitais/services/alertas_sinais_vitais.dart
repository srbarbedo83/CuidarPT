import '../../../data/models/registo_sinais_vitais.dart';

/// Aviso a mostrar sempre que se apresentam alertas de sinais vitais.
const alertaSinaisVitaisAviso =
    'Valores de referência gerais da OMS para adultos em repouso. Não substitui avaliação médica.';

/// Gravidade de um alerta, usada para escolher a cor (amarelo/vermelho).
enum GravidadeAlerta { atencao, grave }

class AlertaSinalVital {
  const AlertaSinalVital({required this.mensagem, required this.gravidade});

  final String mensagem;
  final GravidadeAlerta gravidade;
}

/// Devolve alertas em texto para valores de [registo] fora dos intervalos
/// de referência da OMS para adultos em repouso (pressão arterial,
/// temperatura, glicemia e frequência cardíaca). Não é um diagnóstico —
/// serve apenas para chamar a atenção do cuidador.
List<AlertaSinalVital> alertasSinaisVitais(RegistoSinaisVitais registo) {
  final alertas = <AlertaSinalVital>[];

  final sistolica = registo.pressaoSistolica;
  final diastolica = registo.pressaoDiastolica;
  if (sistolica != null && diastolica != null) {
    if (sistolica >= 180 || diastolica >= 120) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Pressão arterial muito elevada (possível crise hipertensiva)',
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (sistolica >= 140 || diastolica >= 90) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Pressão arterial elevada (hipertensão)',
        gravidade: GravidadeAlerta.atencao,
      ));
    } else if (sistolica < 90 || diastolica < 60) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Pressão arterial baixa (hipotensão)',
        gravidade: GravidadeAlerta.atencao,
      ));
    }
  }

  final temperatura = registo.temperatura;
  if (temperatura != null) {
    if (temperatura >= 39) {
      alertas.add(const AlertaSinalVital(mensagem: 'Febre alta', gravidade: GravidadeAlerta.grave));
    } else if (temperatura >= 38) {
      alertas.add(const AlertaSinalVital(mensagem: 'Febre', gravidade: GravidadeAlerta.atencao));
    } else if (temperatura < 35) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Temperatura corporal muito baixa (hipotermia)',
        gravidade: GravidadeAlerta.grave,
      ));
    }
  }

  final glicemia = registo.glicemia;
  if (glicemia != null) {
    if (glicemia < 70) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Glicemia baixa (hipoglicemia)',
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (glicemia >= 180) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Glicemia muito elevada',
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (glicemia >= 140) {
      alertas.add(const AlertaSinalVital(mensagem: 'Glicemia elevada', gravidade: GravidadeAlerta.atencao));
    }
  }

  final frequencia = registo.frequenciaCardiaca;
  if (frequencia != null) {
    if (frequencia < 60) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Frequência cardíaca baixa (bradicardia)',
        gravidade: GravidadeAlerta.atencao,
      ));
    } else if (frequencia > 100) {
      alertas.add(const AlertaSinalVital(
        mensagem: 'Frequência cardíaca elevada (taquicardia)',
        gravidade: GravidadeAlerta.atencao,
      ));
    }
  }

  return alertas;
}

/// Pior gravidade entre os alertas, `null` se não houver nenhum.
GravidadeAlerta? piorGravidade(List<AlertaSinalVital> alertas) {
  if (alertas.isEmpty) return null;
  return alertas.any((a) => a.gravidade == GravidadeAlerta.grave)
      ? GravidadeAlerta.grave
      : GravidadeAlerta.atencao;
}
