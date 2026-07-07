import 'package:flutter/material.dart';

import '../../../core/utils/horarios.dart';
import '../../../core/utils/tipo_cuidado_diario_utils.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/models/registo_medicacao.dart';

enum TipoEventoCalendario { medicacao, consulta, cuidado }

/// Cor associada a cada tipo de evento no calendário. As consultas usam uma
/// cor mais viva porque costumam ser compromissos mais críticos de não
/// esquecer do que uma toma de medicação recorrente.
Color corTipoEventoCalendario(TipoEventoCalendario tipo) {
  switch (tipo) {
    case TipoEventoCalendario.medicacao:
      return Colors.blue;
    case TipoEventoCalendario.consulta:
      return Colors.redAccent;
    case TipoEventoCalendario.cuidado:
      return Colors.teal;
  }
}

class EventoCalendario {
  const EventoCalendario({
    required this.tipo,
    required this.titulo,
    required this.subtitulo,
    required this.registoId,
  });

  final TipoEventoCalendario tipo;
  final String titulo;
  final String subtitulo;
  final int registoId;
}

bool _mesmoDia(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

bool _medicacaoAtivaNoDia(RegistoMedicacao medicacao, DateTime dia) {
  if (!medicacao.ativo) return false;

  final inicio = medicacao.dataInicio;
  if (inicio != null && dia.isBefore(DateTime(inicio.year, inicio.month, inicio.day))) {
    return false;
  }

  final fim = medicacao.dataFim;
  if (fim != null && dia.isAfter(DateTime(fim.year, fim.month, fim.day))) {
    return false;
  }

  return medicacao.diasSemana.isEmpty || medicacao.diasSemana.contains(dia.weekday);
}

/// Calcula os eventos (medicação, consultas, cuidados diários) que caem em
/// [dia], para alimentar o calendário mensal.
List<EventoCalendario> eventosDoDia(
  DateTime dia, {
  required List<RegistoMedicacao> medicacoes,
  required List<RegistoConsulta> consultas,
  required List<RegistoCuidadoDiario> cuidados,
}) {
  final eventos = <EventoCalendario>[];

  for (final medicacao in medicacoes) {
    if (!_medicacaoAtivaNoDia(medicacao, dia)) continue;
    for (final minutos in medicacao.horariosMinutos) {
      eventos.add(
        EventoCalendario(
          tipo: TipoEventoCalendario.medicacao,
          titulo: medicacao.nomeMedicamento,
          subtitulo: formatarHorario(minutos),
          registoId: medicacao.id,
        ),
      );
    }
  }

  for (final consulta in consultas) {
    if (!_mesmoDia(consulta.dataHora, dia)) continue;
    final horas = consulta.dataHora.hour.toString().padLeft(2, '0');
    final minutos = consulta.dataHora.minute.toString().padLeft(2, '0');
    eventos.add(
      EventoCalendario(
        tipo: TipoEventoCalendario.consulta,
        titulo: consulta.especialidade,
        subtitulo: '$horas:$minutos',
        registoId: consulta.id,
      ),
    );
  }

  for (final cuidado in cuidados) {
    if (!_mesmoDia(cuidado.timestamp, dia)) continue;
    eventos.add(
      EventoCalendario(
        tipo: TipoEventoCalendario.cuidado,
        titulo: tipoCuidadoDiarioLabel(cuidado.tipo),
        subtitulo: cuidado.notaRapida ?? '',
        registoId: cuidado.id,
      ),
    );
  }

  return eventos;
}
