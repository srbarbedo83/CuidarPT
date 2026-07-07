import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_medicacao.dart';

enum TipoProximoEvento { medicacao, consulta }

class ProximoEvento {
  const ProximoEvento({required this.tipo, required this.titulo, required this.dataHora});

  final TipoProximoEvento tipo;
  final String titulo;
  final DateTime dataHora;
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

/// Calcula o próximo evento futuro (toma de medicação ou consulta) de entre
/// os registos de um idoso, para mostrar uma contagem decrescente no perfil.
ProximoEvento? proximoEvento(
  DateTime agora, {
  required List<RegistoMedicacao> medicacoes,
  required List<RegistoConsulta> consultas,
}) {
  ProximoEvento? melhor;

  for (final medicacao in medicacoes) {
    final ocorrencia = _proximaOcorrenciaMedicacao(medicacao, agora);
    if (ocorrencia == null) continue;
    if (melhor == null || ocorrencia.isBefore(melhor.dataHora)) {
      melhor = ProximoEvento(
        tipo: TipoProximoEvento.medicacao,
        titulo: medicacao.nomeMedicamento,
        dataHora: ocorrencia,
      );
    }
  }

  for (final consulta in consultas) {
    if (!consulta.lembreteAtivo || !consulta.dataHora.isAfter(agora)) continue;
    if (melhor == null || consulta.dataHora.isBefore(melhor.dataHora)) {
      melhor = ProximoEvento(
        tipo: TipoProximoEvento.consulta,
        titulo: consulta.especialidade,
        dataHora: consulta.dataHora,
      );
    }
  }

  return melhor;
}

/// Formata o tempo restante até [dataHora] a partir de [agora] de forma
/// compacta: "faltam 2h", "faltam 3 dias", "faltam 15 min".
String formatarContagem(DateTime agora, DateTime dataHora) {
  final diferenca = dataHora.difference(agora);
  if (diferenca.inDays >= 1) {
    return 'faltam ${diferenca.inDays} ${diferenca.inDays == 1 ? 'dia' : 'dias'}';
  }
  if (diferenca.inHours >= 1) {
    return 'faltam ${diferenca.inHours}h';
  }
  final minutos = diferenca.inMinutes.clamp(0, 59);
  return 'faltam $minutos min';
}
