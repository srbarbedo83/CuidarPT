import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/cuidado_diario_providers.dart';
import '../services/humor_historico.dart';

class GraficoHumorCard extends ConsumerStatefulWidget {
  const GraficoHumorCard({super.key, required this.idosoId});

  final int idosoId;

  @override
  ConsumerState<GraficoHumorCard> createState() => _GraficoHumorCardState();
}

class _GraficoHumorCardState extends ConsumerState<GraficoHumorCard> {
  int _dias = 7;

  Color _corHumor(double media) {
    if (media <= 2) return Colors.red.shade300;
    if (media <= 3.5) return Colors.amber.shade400;
    return Colors.green.shade400;
  }

  @override
  Widget build(BuildContext context) {
    final cuidados = ref.watch(cuidadoDiarioListProvider(widget.idosoId)).valueOrNull ?? const [];
    final pontos = humorPorDia(cuidados, dias: _dias);
    final temAlgumRegisto = pontos.any((p) => p.media != null);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('Humor', style: Theme.of(context).textTheme.titleMedium)),
                SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 7, label: Text('7 dias')),
                    ButtonSegment(value: 30, label: Text('30 dias')),
                  ],
                  selected: {_dias},
                  onSelectionChanged: (selecao) => setState(() => _dias = selecao.first),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!temAlgumRegisto)
              Text(
                'Ainda não há registos de humor neste período.',
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
                                ? '${DateFormat('dd/MM').format(ponto.dia)}: ${ponto.media!.toStringAsFixed(1)}'
                                : DateFormat('dd/MM').format(ponto.dia),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: ponto.media == null
                                    ? 0.05
                                    : (ponto.media! / 5).clamp(0.08, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ponto.media == null
                                        ? Colors.grey.shade300
                                        : _corHumor(ponto.media!),
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
