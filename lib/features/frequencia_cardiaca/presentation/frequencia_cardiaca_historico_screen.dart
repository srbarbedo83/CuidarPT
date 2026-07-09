import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../providers/frequencia_cardiaca_providers.dart';
import '../services/frequencia_cardiaca_historico.dart';

const _maximoEscalaBpm = 180.0;

/// Gráficos de frequência cardíaca (7/30/90 dias) com média, mínimo, máximo
/// e tendência — as cores seguem sempre o tema (claro/escuro) da app.
class FrequenciaCardiacaHistoricoScreen extends ConsumerStatefulWidget {
  const FrequenciaCardiacaHistoricoScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<FrequenciaCardiacaHistoricoScreen> createState() =>
      _FrequenciaCardiacaHistoricoScreenState();
}

class _FrequenciaCardiacaHistoricoScreenState extends ConsumerState<FrequenciaCardiacaHistoricoScreen> {
  int _dias = 7;

  @override
  Widget build(BuildContext context) {
    final registos = ref.watch(frequenciaCardiacaListProvider(widget.idoso.id)).valueOrNull ?? const [];
    final pontos = pontosFrequenciaCardiaca(registos, dias: _dias);
    final media = mediaFrequenciaCardiaca(pontos);
    final minimo = minimoFrequenciaCardiaca(pontos);
    final maximo = maximoFrequenciaCardiaca(pontos);
    final tendencia = calcularTendencia(pontos);
    final cor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de frequência cardíaca')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 7, label: Text('7 dias')),
                ButtonSegment(value: 30, label: Text('30 dias')),
                ButtonSegment(value: 90, label: Text('90 dias')),
              ],
              selected: {_dias},
              onSelectionChanged: (selecao) => setState(() => _dias = selecao.first),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Frequência cardíaca', style: Theme.of(context).textTheme.titleMedium),
                      ),
                      if (tendencia != null)
                        Chip(
                          avatar: Icon(_iconeTendencia(tendencia), size: 16),
                          label: Text(labelTendenciaFrequenciaCardiaca(tendencia)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (media == null)
                    Text(
                      'Ainda não há medições neste período.',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  else ...[
                    Wrap(
                      spacing: 16,
                      runSpacing: 4,
                      children: [
                        _EstatisticaTexto(rotulo: 'Média', valor: '${media.toStringAsFixed(0)} bpm'),
                        _EstatisticaTexto(rotulo: 'Mínimo', valor: '$minimo bpm'),
                        _EstatisticaTexto(rotulo: 'Máximo', valor: '$maximo bpm'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final ponto in pontos)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: Tooltip(
                                  message: ponto.media != null
                                      ? '${DateFormat('dd/MM').format(ponto.dia)}: '
                                          '${ponto.media!.toStringAsFixed(0)} bpm '
                                          '(mín. ${ponto.minimo}, máx. ${ponto.maximo})'
                                      : DateFormat('dd/MM').format(ponto.dia),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: FractionallySizedBox(
                                      heightFactor: ponto.media == null
                                          ? 0.05
                                          : (ponto.media! / _maximoEscalaBpm).clamp(0.08, 1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ponto.media == null ? Theme.of(context).disabledColor : cor,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconeTendencia(TendenciaFrequenciaCardiaca tendencia) {
    return switch (tendencia) {
      TendenciaFrequenciaCardiaca.subida => Icons.trending_up,
      TendenciaFrequenciaCardiaca.descida => Icons.trending_down,
      TendenciaFrequenciaCardiaca.estavel => Icons.trending_flat,
    };
  }
}

class _EstatisticaTexto extends StatelessWidget {
  const _EstatisticaTexto({required this.rotulo, required this.valor});

  final String rotulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(rotulo, style: Theme.of(context).textTheme.bodySmall),
        Text(valor, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
