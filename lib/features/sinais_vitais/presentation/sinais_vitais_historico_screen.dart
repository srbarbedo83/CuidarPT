import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/sinais_vitais_providers.dart';
import '../services/sinais_vitais_historico.dart';

class SinaisVitaisHistoricoScreen extends ConsumerStatefulWidget {
  const SinaisVitaisHistoricoScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<SinaisVitaisHistoricoScreen> createState() => _SinaisVitaisHistoricoScreenState();
}

class _SinaisVitaisHistoricoScreenState extends ConsumerState<SinaisVitaisHistoricoScreen> {
  int _dias = 7;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final registos = ref.watch(sinaisVitaisListProvider(widget.idoso.id)).valueOrNull ?? const [];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.sinaisVitaisHistoricoTitulo)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 7, label: Text(l10n.sinaisVitaisHistorico7Dias)),
                ButtonSegment(value: 30, label: Text(l10n.sinaisVitaisHistorico30Dias)),
              ],
              selected: {_dias},
              onSelectionChanged: (selecao) => setState(() => _dias = selecao.first),
            ),
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoPressaoSistolica,
            unidade: 'mmHg',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.pressaoSistolica),
            corBarra: Colors.red.shade300,
            maximoEscala: 200,
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoPressaoDiastolica,
            unidade: 'mmHg',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.pressaoDiastolica),
            corBarra: Colors.red.shade200,
            maximoEscala: 130,
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoTemperaturaTitulo,
            unidade: '°C',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.temperatura),
            corBarra: Colors.orange.shade300,
            maximoEscala: 40,
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoGlicemia,
            unidade: 'mg/dL',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.glicemia),
            corBarra: Colors.purple.shade300,
            maximoEscala: 250,
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoFrequenciaCardiaca,
            unidade: 'bpm',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.frequenciaCardiaca),
            corBarra: Colors.pink.shade300,
            maximoEscala: 160,
          ),
          const SizedBox(height: 12),
          _GraficoSinalVitalCard(
            titulo: l10n.sinaisVitaisHistoricoPeso,
            unidade: 'kg',
            pontos: sinalVitalPorDia(registos, dias: _dias, valor: (r) => r.peso),
            corBarra: Colors.teal.shade300,
            maximoEscala: 150,
          ),
        ],
      ),
    );
  }
}

class _GraficoSinalVitalCard extends StatelessWidget {
  const _GraficoSinalVitalCard({
    required this.titulo,
    required this.unidade,
    required this.pontos,
    required this.corBarra,
    required this.maximoEscala,
  });

  final String titulo;
  final String unidade;
  final List<PontoSinalVital> pontos;
  final Color corBarra;
  final double maximoEscala;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final media = mediaSinalVital(pontos);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(titulo, style: Theme.of(context).textTheme.titleMedium)),
                if (media != null)
                  Text(
                    l10n.sinaisVitaisHistoricoMedia(media.toStringAsFixed(1), unidade),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (media == null)
              Text(
                l10n.sinaisVitaisHistoricoSemRegistos,
                style: Theme.of(context).textTheme.bodySmall,
              )
            else
              SizedBox(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final ponto in pontos)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Tooltip(
                            message: ponto.media != null
                                ? '${DateFormat('dd/MM').format(ponto.dia)}: ${ponto.media!.toStringAsFixed(1)} $unidade'
                                : DateFormat('dd/MM').format(ponto.dia),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: ponto.media == null
                                    ? 0.05
                                    : (ponto.media! / maximoEscala).clamp(0.08, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ponto.media == null ? Colors.grey.shade300 : corBarra,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
