import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../subscricao/feature_limits.dart';
import '../providers/sinais_vitais_providers.dart';
import '../services/alertas_sinais_vitais.dart';
import 'sinais_vitais_form_screen.dart';
import 'sinais_vitais_historico_screen.dart';

bool _mesmoDia(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

/// Secção Premium do perfil do idoso para registar sinais vitais do dia
/// (pressão arterial, temperatura, glicemia, frequência cardíaca).
class SinaisVitaisSection extends ConsumerWidget {
  const SinaisVitaisSection({super.key, required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permite = ref.watch(featureLimitsProvider).permiteSinaisVitais;

    if (!permite) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.monitor_heart_outlined),
            title: const Text('Sinais vitais'),
            subtitle: const Text(
              'Funcionalidade Premium: pressão, temperatura, glicemia, frequência cardíaca.',
            ),
            trailing: const Icon(Icons.star_outline),
            onTap: () => mostrarLimiteAtingido(
              context,
              mensagem: 'Registar sinais vitais é uma funcionalidade Premium. '
                  'Subscreve o Premium para a usares.',
            ),
          ),
        ),
      );
    }

    final registosAsync = ref.watch(sinaisVitaisListProvider(idoso.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: Row(
            children: [
              Expanded(child: Text('Sinais vitais', style: Theme.of(context).textTheme.titleMedium)),
              IconButton(
                icon: const Icon(Icons.show_chart),
                tooltip: 'Histórico em gráfico',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SinaisVitaisHistoricoScreen(idoso: idoso)),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Novo registo de sinais vitais',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso)),
                ),
              ),
            ],
          ),
        ),
        registosAsync.when(
          data: (registos) {
            if (registos.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Ainda não há registos de sinais vitais.'),
              );
            }
            final hoje = DateTime.now();
            final temRegistoHoje = registos.any((r) => _mesmoDia(r.timestamp, hoje));
            final temAlerta = registos.any((r) => alertasSinaisVitais(r).isNotEmpty);
            return Column(
              children: [
                if (!temRegistoHoje)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('Ainda não registou sinais vitais hoje.'),
                  ),
                for (final registo in registos) _SinaisVitaisTile(idoso: idoso, registo: registo),
                if (temAlerta)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      alertaSinaisVitaisAviso,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (erro, _) => Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Erro ao carregar sinais vitais: $erro'),
          ),
        ),
      ],
    );
  }
}

class _SinaisVitaisTile extends ConsumerWidget {
  const _SinaisVitaisTile({required this.idoso, required this.registo});

  final Idoso idoso;
  final RegistoSinaisVitais registo;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar registo'),
        content: const Text('Queres mesmo apagar este registo de sinais vitais?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(registoSinaisVitaisRepositoryProvider).delete(registo.id);
    }
  }

  String _resumo() {
    final partes = <String>[
      if (registo.pressaoSistolica != null && registo.pressaoDiastolica != null)
        '${registo.pressaoSistolica}/${registo.pressaoDiastolica} mmHg',
      if (registo.temperatura != null) '${registo.temperatura}°C',
      if (registo.glicemia != null) '${registo.glicemia} mg/dL',
      if (registo.frequenciaCardiaca != null) '${registo.frequenciaCardiaca} bpm',
    ];
    return partes.isEmpty ? 'Sem valores registados' : partes.join(' · ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertas = alertasSinaisVitais(registo);

    return ListTile(
      leading: Icon(
        alertas.isEmpty ? Icons.monitor_heart_outlined : Icons.warning_amber_rounded,
        color: alertas.isEmpty ? null : Colors.amber.shade800,
      ),
      title: Text(_resumo()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat('dd/MM/yyyy HH:mm').format(registo.timestamp)),
          if (alertas.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                alertas.join(' · '),
                style: TextStyle(color: Colors.amber.shade800, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
      isThreeLine: alertas.isNotEmpty,
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar registo',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso, registo: registo)),
      ),
    );
  }
}
