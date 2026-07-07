import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/estado_subscricao.dart';
import '../../../data/models/preferencias_app.dart';
import '../../contactos_cuidadores/presentation/contactos_cuidadores_section.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/providers/subscricao_providers.dart';
import '../providers/definicoes_providers.dart';
import '../providers/preferencias_providers.dart';

class DefinicoesScreen extends ConsumerWidget {
  const DefinicoesScreen({super.key});

  Future<void> _mostrarInfoSubscricao(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Subscrição Premium'),
        content: const Text(
          'A compra do Premium via Google Play estará disponível numa '
          'próxima atualização.\n\n'
          'Preços previstos: €1,99/mês, €9,99/6 meses ou €19,99/ano.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Entendido')),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(estadoSubscricaoProvider).valueOrNull;
    final limites = ref.watch(featureLimitsProvider);
    final idosos = ref.watch(idosoListProvider).valueOrNull ?? const [];
    final packageInfo = ref.watch(packageInfoProvider).valueOrNull;
    final tema = ref.watch(temaPreferidoProvider);
    final escalaTexto = ref.watch(escalaTextoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Definições')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SeccaoAparencia(
            tema: tema,
            escalaTexto: escalaTexto,
            onTemaAlterado: (valor) => ref.read(preferenciasRepositoryProvider).definirTema(valor),
            onEscalaAlterada: (valor) => ref.read(preferenciasRepositoryProvider).definirEscalaTexto(valor),
          ),
          const SizedBox(height: 16),
          _SeccaoSubscricao(estado: estado, onSubscrever: () => _mostrarInfoSubscricao(context)),
          const SizedBox(height: 16),
          _SeccaoPerfis(totalIdosos: idosos.length, maxPerfisIdoso: limites.maxPerfisIdoso),
          const SizedBox(height: 16),
          const ContactosCuidadoresSection(),
          const SizedBox(height: 16),
          _SeccaoSobre(versao: packageInfo?.version),
        ],
      ),
    );
  }
}

Future<void> _abrirGestaoSubscricao() {
  return launchUrl(
    Uri.parse('https://play.google.com/store/account/subscriptions'),
    mode: LaunchMode.externalApplication,
  );
}

class _SeccaoAparencia extends StatelessWidget {
  const _SeccaoAparencia({
    required this.tema,
    required this.escalaTexto,
    required this.onTemaAlterado,
    required this.onEscalaAlterada,
  });

  final TemaPreferido tema;
  final double escalaTexto;
  final ValueChanged<TemaPreferido> onTemaAlterado;
  final ValueChanged<double> onEscalaAlterada;

  static final _opcoesEscala = <double, String>{0.85: 'Pequeno', 1.0: 'Médio', 1.3: 'Grande'};

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aparência', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text('Tema', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SegmentedButton<TemaPreferido>(
              segments: const [
                ButtonSegment(value: TemaPreferido.sistema, label: Text('Sistema')),
                ButtonSegment(value: TemaPreferido.claro, label: Text('Claro')),
                ButtonSegment(value: TemaPreferido.escuro, label: Text('Escuro')),
              ],
              selected: {tema},
              onSelectionChanged: (selecao) => onTemaAlterado(selecao.first),
            ),
            const SizedBox(height: 16),
            Text('Tamanho da letra', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SegmentedButton<double>(
              segments: _opcoesEscala.entries
                  .map((entry) => ButtonSegment(value: entry.key, label: Text(entry.value)))
                  .toList(),
              selected: {escalaTexto},
              onSelectionChanged: (selecao) => onEscalaAlterada(selecao.first),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeccaoSubscricao extends StatelessWidget {
  const _SeccaoSubscricao({required this.estado, required this.onSubscrever});

  final EstadoSubscricao? estado;
  final VoidCallback onSubscrever;

  @override
  Widget build(BuildContext context) {
    final estadoAtual = estado;
    final String status;
    if (estadoAtual == null) {
      status = 'A carregar...';
    } else if (estadoAtual.trialAtivo) {
      status = 'Período experimental Premium — faltam ${estadoAtual.diasRestantesTrial} dia(s).';
    } else if (estadoAtual.premiumAtivo) {
      status = 'Plano Premium ativo.';
    } else {
      status = 'Plano Grátis.';
    }

    final semSubscricaoPaga = estadoAtual == null || !estadoAtual.premiumAtivo;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subscrição', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(status),
            const SizedBox(height: 12),
            Text('O que inclui o Premium:', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            const _ItemBeneficio('Perfis de idosos ilimitados'),
            const _ItemBeneficio('Relatórios PDF personalizáveis (nome/logótipo)'),
            const _ItemBeneficio('Histórico e período de relatório ilimitados'),
            const _ItemBeneficio('Avisos meteorológicos oficiais'),
            const SizedBox(height: 8),
            Text(
              '€1,99/mês · €9,99/6 meses · €19,99/ano',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (semSubscricaoPaga) ...[
              const SizedBox(height: 12),
              FilledButton(onPressed: onSubscrever, child: const Text('Subscrever Premium')),
            ] else ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _abrirGestaoSubscricao,
                child: const Text('Gerir ou cancelar subscrição'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ItemBeneficio extends StatelessWidget {
  const _ItemBeneficio(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 16),
          const SizedBox(width: 6),
          Expanded(child: Text(texto, style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class _SeccaoPerfis extends StatelessWidget {
  const _SeccaoPerfis({required this.totalIdosos, required this.maxPerfisIdoso});

  final int totalIdosos;
  final int? maxPerfisIdoso;

  @override
  Widget build(BuildContext context) {
    final limiteTexto = maxPerfisIdoso == null ? 'ilimitados' : '$maxPerfisIdoso';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perfis de idosos', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$totalIdosos de $limiteTexto perfis em uso.'),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ver perfis'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeccaoSobre extends StatelessWidget {
  const _SeccaoSobre({required this.versao});

  final String? versao;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sobre', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('CuidarPT${versao != null ? ' — versão $versao' : ''}'),
            const SizedBox(height: 4),
            Text(
              'Todos os dados ficam guardados apenas neste telemóvel.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
