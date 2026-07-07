import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../consultas/presentation/consulta_form_screen.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../cuidados_diarios/presentation/cuidado_diario_form_screen.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../../medicacao/presentation/medicacao_form_screen.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../services/eventos_calendario.dart';

class CalendarioScreen extends ConsumerStatefulWidget {
  const CalendarioScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<CalendarioScreen> createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends ConsumerState<CalendarioScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  bool _mesmoDia(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final medicacoes = ref.watch(medicacaoListProvider(widget.idoso.id)).valueOrNull ?? const [];
    final consultas = ref.watch(consultaListProvider(widget.idoso.id)).valueOrNull ?? const [];
    final cuidados = ref.watch(cuidadoDiarioListProvider(widget.idoso.id)).valueOrNull ?? const [];

    List<EventoCalendario> eventosDoDiaSelecionado() {
      return eventosDoDia(_selectedDay, medicacoes: medicacoes, consultas: consultas, cuidados: cuidados);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Calendário · ${widget.idoso.nome}')),
      body: Column(
        children: [
          TableCalendar<EventoCalendario>(
            locale: 'pt_PT',
            firstDay: DateTime(2000),
            lastDay: DateTime(DateTime.now().year + 5),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {CalendarFormat.month: 'Mês'},
            startingDayOfWeek: StartingDayOfWeek.monday,
            selectedDayPredicate: (dia) => _mesmoDia(dia, _selectedDay),
            eventLoader: (dia) =>
                eventosDoDia(dia, medicacoes: medicacoes, consultas: consultas, cuidados: cuidados),
            onDaySelected: (selecionado, focado) {
              setState(() {
                _selectedDay = selecionado;
                _focusedDay = focado;
              });
            },
            onPageChanged: (focado) => _focusedDay = focado,
            calendarBuilders: CalendarBuilders<EventoCalendario>(
              markerBuilder: (context, dia, eventosDoDia) {
                if (eventosDoDia.isEmpty) return null;
                final tipos = eventosDoDia.map((e) => e.tipo).toSet();
                return Positioned(
                  bottom: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final tipo in tipos)
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: corTipoEventoCalendario(tipo),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _ListaEventosDia(
              dia: _selectedDay,
              eventos: eventosDoDiaSelecionado(),
              idoso: widget.idoso,
              medicacoes: medicacoes,
              consultas: consultas,
              cuidados: cuidados,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListaEventosDia extends StatelessWidget {
  const _ListaEventosDia({
    required this.dia,
    required this.eventos,
    required this.idoso,
    required this.medicacoes,
    required this.consultas,
    required this.cuidados,
  });

  final DateTime dia;
  final List<EventoCalendario> eventos;
  final Idoso idoso;
  final List<RegistoMedicacao> medicacoes;
  final List<RegistoConsulta> consultas;
  final List<RegistoCuidadoDiario> cuidados;

  IconData _icone(TipoEventoCalendario tipo) {
    switch (tipo) {
      case TipoEventoCalendario.medicacao:
        return Icons.medication_outlined;
      case TipoEventoCalendario.consulta:
        return Icons.event_note_outlined;
      case TipoEventoCalendario.cuidado:
        return Icons.favorite_outline;
    }
  }

  void _abrir(BuildContext context, EventoCalendario evento) {
    switch (evento.tipo) {
      case TipoEventoCalendario.medicacao:
        final registo = medicacoes.where((m) => m.id == evento.registoId).firstOrNull;
        if (registo == null) return;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso, registo: registo)),
        );
      case TipoEventoCalendario.consulta:
        final registo = consultas.where((c) => c.id == evento.registoId).firstOrNull;
        if (registo == null) return;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso, consulta: registo)),
        );
      case TipoEventoCalendario.cuidado:
        final registo = cuidados.where((c) => c.id == evento.registoId).firstOrNull;
        if (registo == null) return;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CuidadoDiarioFormScreen(idoso: idoso, registo: registo)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (eventos.isEmpty) {
      return const Center(child: Text('Sem eventos neste dia.'));
    }
    return ListView.builder(
      itemCount: eventos.length,
      itemBuilder: (context, indice) {
        final evento = eventos[indice];
        return ListTile(
          leading: Icon(_icone(evento.tipo), color: corTipoEventoCalendario(evento.tipo)),
          title: Text(evento.titulo),
          subtitle: evento.subtitulo.isNotEmpty ? Text(evento.subtitulo) : null,
          onTap: () => _abrir(context, evento),
        );
      },
    );
  }
}
