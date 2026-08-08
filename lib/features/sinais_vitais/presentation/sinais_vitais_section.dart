import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/gradiente_premium.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../../shared/widgets/seccao_colapsavel.dart';
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
    final l10n = AppLocalizations.of(context);
    final permite = ref.watch(featureLimitsProvider).permiteSinaisVitais;

    if (!permite) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.monitor_heart_outlined),
            title: Text(l10n.homeAcaoSinaisVitais),
            subtitle: GradientText(
              l10n.sinaisVitaisUpsellDescricao,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const GradientIcon(Icons.star_outline),
            onTap: () => mostrarLimiteAtingido(
              context,
              mensagem: l10n.comumSinaisVitaisPremiumMensagem,
            ),
          ),
        ),
      );
    }

    final registosAsync = ref.watch(sinaisVitaisListProvider(idoso.id));

    return SeccaoColapsavel(
      titulo: l10n.homeAcaoSinaisVitais,
      icone: Icons.monitor_heart_outlined,
      acoes: [
        IconButton(
          icon: Icon(Icons.show_chart, color: Theme.of(context).colorScheme.primary),
          tooltip: l10n.sinaisVitaisTooltipHistorico,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SinaisVitaisHistoricoScreen(idoso: idoso)),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: l10n.sinaisVitaisTooltipNovoRegisto,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso)),
          ),
        ),
      ],
      child: registosAsync.when(
        data: (registos) {
          if (registos.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(l10n.sinaisVitaisSemRegistos),
            );
          }
          final hoje = DateTime.now();
          final temRegistoHoje = registos.any((r) => _mesmoDia(r.timestamp, hoje));
          final temAlerta = registos.any((r) => alertasSinaisVitais(l10n, r).isNotEmpty);
          return Column(
            children: [
              if (!temRegistoHoje)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(l10n.sinaisVitaisSemRegistoHoje),
                ),
              _SinaisVitaisLista(idoso: idoso, registos: registos),
              if (temAlerta)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    alertaSinaisVitaisAviso(l10n),
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
          child: Text(l10n.sinaisVitaisErroCarregar('$erro')),
        ),
      ),
    );
  }
}

const _maxRegistosCondensados = 3;

/// Lista de registos de sinais vitais com a mesma minimização/expansão
/// usada noutras secções com potencialmente muitas entradas.
class _SinaisVitaisLista extends StatefulWidget {
  const _SinaisVitaisLista({required this.idoso, required this.registos});

  final Idoso idoso;
  final List<RegistoSinaisVitais> registos;

  @override
  State<_SinaisVitaisLista> createState() => _SinaisVitaisListaState();
}

class _SinaisVitaisListaState extends State<_SinaisVitaisLista> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final registos = widget.registos;
    final mostrarExpandir = registos.length > _maxRegistosCondensados;
    final visiveis = _expandido ? registos : registos.take(_maxRegistosCondensados).toList();
    return Column(
      children: [
        for (final registo in visiveis) _SinaisVitaisTile(idoso: widget.idoso, registo: registo),
        if (mostrarExpandir)
          TextButton(
            onPressed: () => setState(() => _expandido = !_expandido),
            child: Text(_expandido ? l10n.idosoDetailVerMenos : l10n.sinaisVitaisVerTodos(registos.length)),
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
    final l10n = AppLocalizations.of(context);
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.sinaisVitaisApagarTitulo),
        content: Text(l10n.sinaisVitaisApagarConfirmacao),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.comumCancelar)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.comumApagar)),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(registoSinaisVitaisRepositoryProvider).delete(registo.id);
    }
  }

  String _resumo(AppLocalizations l10n) {
    final partes = <String>[
      if (registo.pressaoSistolica != null && registo.pressaoDiastolica != null)
        '${registo.pressaoSistolica}/${registo.pressaoDiastolica} mmHg',
      if (registo.temperatura != null) '${registo.temperatura}°C',
      if (registo.glicemia != null) '${registo.glicemia} mg/dL',
      if (registo.frequenciaCardiaca != null) '${registo.frequenciaCardiaca} bpm',
      if (registo.peso != null) '${registo.peso} kg',
    ];
    return partes.isEmpty ? l10n.sinaisVitaisSemValores : partes.join(' · ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final alertas = alertasSinaisVitais(l10n, registo);
    final gravidade = piorGravidade(alertas);
    final cor = switch (gravidade) {
      GravidadeAlerta.grave => Colors.red.shade700,
      GravidadeAlerta.atencao => Colors.amber.shade800,
      null => Colors.green.shade700,
    };

    return ListTile(
      leading: Icon(
        gravidade == null ? Icons.check_circle_outline : Icons.warning_amber_rounded,
        color: cor,
      ),
      title: Text(_resumo(l10n)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat('dd/MM/yyyy HH:mm').format(registo.timestamp)),
          if (alertas.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                alertas.map((a) => a.mensagem).join(' · '),
                style: TextStyle(color: cor, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
      isThreeLine: alertas.isNotEmpty,
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: l10n.sinaisVitaisApagarTitulo,
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => SinaisVitaisFormScreen(idoso: idoso, registo: registo)),
      ),
    );
  }
}
