import '../../../data/models/registo_sinais_vitais.dart';
import '../../../l10n/app_localizations.dart';

/// Aviso a mostrar sempre que se apresentam alertas de sinais vitais.
String alertaSinaisVitaisAviso(AppLocalizations l10n) => l10n.alertaSinaisVitaisAviso;

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
List<AlertaSinalVital> alertasSinaisVitais(AppLocalizations l10n, RegistoSinaisVitais registo) {
  final alertas = <AlertaSinalVital>[];

  final sistolica = registo.pressaoSistolica;
  final diastolica = registo.pressaoDiastolica;
  if (sistolica != null && diastolica != null) {
    if (sistolica >= 180 || diastolica >= 120) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaPressaoMuitoElevada,
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (sistolica >= 140 || diastolica >= 90) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaPressaoElevada,
        gravidade: GravidadeAlerta.atencao,
      ));
    } else if (sistolica < 90 || diastolica < 60) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaPressaoBaixa,
        gravidade: GravidadeAlerta.atencao,
      ));
    }
  }

  final temperatura = registo.temperatura;
  if (temperatura != null) {
    if (temperatura >= 39) {
      alertas.add(AlertaSinalVital(mensagem: l10n.alertaFebreAlta, gravidade: GravidadeAlerta.grave));
    } else if (temperatura >= 38) {
      alertas.add(AlertaSinalVital(mensagem: l10n.alertaFebre, gravidade: GravidadeAlerta.atencao));
    } else if (temperatura < 35) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaHipotermia,
        gravidade: GravidadeAlerta.grave,
      ));
    }
  }

  final glicemia = registo.glicemia;
  if (glicemia != null) {
    if (glicemia < 70) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaGlicemiaBaixa,
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (glicemia >= 180) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaGlicemiaMuitoElevada,
        gravidade: GravidadeAlerta.grave,
      ));
    } else if (glicemia >= 140) {
      alertas.add(AlertaSinalVital(mensagem: l10n.alertaGlicemiaElevada, gravidade: GravidadeAlerta.atencao));
    }
  }

  final frequencia = registo.frequenciaCardiaca;
  if (frequencia != null) {
    if (frequencia < 60) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaFrequenciaBaixa,
        gravidade: GravidadeAlerta.atencao,
      ));
    } else if (frequencia > 100) {
      alertas.add(AlertaSinalVital(
        mensagem: l10n.alertaFrequenciaElevada,
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
