import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../../l10n/app_localizations.dart';

enum TipoProximoEvento { medicacao, consulta }

class ProximoEvento {
  const ProximoEvento({
    required this.tipo,
    required this.titulo,
    required this.dataHora,
    this.medicacao,
    this.consulta,
  });

  final TipoProximoEvento tipo;
  final String titulo;
  final DateTime dataHora;

  /// Registo de origem, para permitir abrir o formulário correspondente ao
  /// tocar no lembrete. Só um dos dois está preenchido, consoante [tipo].
  final RegistoMedicacao? medicacao;
  final RegistoConsulta? consulta;
}

const _diasPesquisados = 14;

DateTime? _proximaOcorrenciaMedicacao(RegistoMedicacao medicacao, DateTime agora) {
  if (!medicacao.ativo || medicacao.horariosMinutos.isEmpty) return null;

  final horariosOrdenados = [...medicacao.horariosMinutos]..sort();
  final hoje = DateTime(agora.year, agora.month, agora.day);

  for (var offset = 0; offset <= _diasPesquisados; offset++) {
    final dia = hoje.add(Duration(days: offset));

    final inicio = medicacao.dataInicio;
    if (inicio != null && dia.isBefore(DateTime(inicio.year, inicio.month, inicio.day))) continue;

    final fim = medicacao.dataFim;
    if (fim != null && dia.isAfter(DateTime(fim.year, fim.month, fim.day))) continue;

    if (medicacao.diasSemana.isNotEmpty && !medicacao.diasSemana.contains(dia.weekday)) continue;

    for (final minutos in horariosOrdenados) {
      final ocorrencia = dia.add(Duration(minutes: minutos));
      if (ocorrencia.isAfter(agora)) return ocorrencia;
    }
  }
  return null;
}

/// Calcula, ordenados por data, os próximos eventos futuros (tomas de
/// medicação ou consultas) de entre os registos de um idoso.
List<ProximoEvento> proximosEventos(
  DateTime agora, {
  required List<RegistoMedicacao> medicacoes,
  required List<RegistoConsulta> consultas,
}) {
  final eventos = <ProximoEvento>[];

  for (final medicacao in medicacoes) {
    final ocorrencia = _proximaOcorrenciaMedicacao(medicacao, agora);
    if (ocorrencia == null) continue;
    eventos.add(ProximoEvento(
      tipo: TipoProximoEvento.medicacao,
      titulo: medicacao.nomeMedicamento,
      dataHora: ocorrencia,
      medicacao: medicacao,
    ));
  }

  for (final consulta in consultas) {
    if (!consulta.lembreteAtivo || !consulta.dataHora.isAfter(agora)) continue;
    eventos.add(ProximoEvento(
      tipo: TipoProximoEvento.consulta,
      titulo: consulta.especialidade,
      dataHora: consulta.dataHora,
      consulta: consulta,
    ));
  }

  eventos.sort((a, b) => a.dataHora.compareTo(b.dataHora));
  return eventos;
}

/// Calcula o próximo evento futuro (toma de medicação ou consulta) de entre
/// os registos de um idoso, para mostrar uma contagem decrescente no perfil.
ProximoEvento? proximoEvento(
  DateTime agora, {
  required List<RegistoMedicacao> medicacoes,
  required List<RegistoConsulta> consultas,
}) {
  final eventos = proximosEventos(agora, medicacoes: medicacoes, consultas: consultas);
  return eventos.isEmpty ? null : eventos.first;
}

/// Indica se [dataHora] está suficientemente próxima de [agora] (por
/// omissão, dentro de 3 horas) para merecer destaque visual — usado para
/// realçar lembretes urgentes no ecrã inicial.
bool eventoUrgente(DateTime agora, DateTime dataHora, {Duration limiar = const Duration(hours: 3)}) {
  final diferenca = dataHora.difference(agora);
  return !diferenca.isNegative && diferenca <= limiar;
}

/// Formata o tempo restante até [dataHora] a partir de [agora] de forma
/// compacta: "faltam 2h", "faltam 3 dias", "faltam 15 min".
String formatarContagem(AppLocalizations l10n, DateTime agora, DateTime dataHora) {
  final diferenca = dataHora.difference(agora);
  if (diferenca.inDays >= 1) {
    return l10n.proximoEventoFaltamDias(diferenca.inDays);
  }
  if (diferenca.inHours >= 1) {
    return l10n.proximoEventoFaltamHoras(diferenca.inHours);
  }
  final minutos = diferenca.inMinutes.clamp(0, 59);
  return l10n.proximoEventoFaltamMinutos(minutos);
}
