import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/services/notification_service.dart';
import '../../../data/models/estado_subscricao.dart';
import '../../../data/models/preferencias_app.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../contactos_cuidadores/presentation/contactos_cuidadores_section.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../sinais_vitais/providers/sinais_vitais_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/presentation/comprar_premium_sheet.dart';
import '../../subscricao/providers/subscricao_providers.dart';
import '../providers/definicoes_providers.dart';
import '../providers/preferencias_providers.dart';

class DefinicoesScreen extends ConsumerWidget {
  const DefinicoesScreen({super.key});

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
          _SeccaoSubscricao(estado: estado, onSubscrever: () => mostrarCompraPremium(context)),
          const SizedBox(height: 16),
          _SeccaoPerfis(totalIdosos: idosos.length, maxPerfisIdoso: limites.maxPerfisIdoso),
          const SizedBox(height: 16),
          const _SeccaoNotificacoes(),
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

/// Antes de mandar o utilizador para a Play Store para cancelar, mostra um
/// resumo honesto do que já construiu na app e do que perde ao cancelar —
/// tudo verdadeiro (nada de urgência ou dados falsos), só para a decisão
/// ser informada. Os dados locais nunca são apagados por cancelar.
Future<void> _confirmarCancelamento(BuildContext context, WidgetRef ref) async {
  final idosos = ref.read(idosoListProvider).valueOrNull ?? const [];
  var totalMedicacoes = 0;
  var totalConsultas = 0;
  var totalSinaisVitais = 0;
  for (final idoso in idosos) {
    totalMedicacoes += (ref.read(medicacaoListProvider(idoso.id)).valueOrNull ?? const []).length;
    totalConsultas += (ref.read(consultaListProvider(idoso.id)).valueOrNull ?? const []).length;
    totalSinaisVitais += (ref.read(sinaisVitaisListProvider(idoso.id)).valueOrNull ?? const []).length;
  }

  final continuar = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Antes de cancelares'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (idosos.isNotEmpty) ...[
              const Text('Já construíste isto na app:'),
              const SizedBox(height: 6),
              Text('• ${idosos.length} ${idosos.length == 1 ? 'perfil de idoso' : 'perfis de idosos'}'),
              if (totalMedicacoes > 0)
                Text(
                  '• $totalMedicacoes ${totalMedicacoes == 1 ? 'medicação registada' : 'medicações registadas'}',
                ),
              if (totalConsultas > 0)
                Text('• $totalConsultas ${totalConsultas == 1 ? 'consulta/tratamento' : 'consultas/tratamentos'}'),
              if (totalSinaisVitais > 0)
                Text(
                  '• $totalSinaisVitais ${totalSinaisVitais == 1 ? 'registo de sinais vitais' : 'registos de sinais vitais'}',
                ),
              const SizedBox(height: 16),
            ],
            const Text('Ao cancelar o Premium, deixas de poder:'),
            const SizedBox(height: 6),
            const Text('• Ver mais de 2 perfis de idosos'),
            const Text('• Registar sinais vitais'),
            const Text('• Personalizar relatórios PDF'),
            const Text('• Ver histórico e período de relatório sem limite'),
            const SizedBox(height: 16),
            Text(
              'Os teus dados continuam guardados no telemóvel — cancelar não apaga nada.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Voltar'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Continuar para a Play Store'),
        ),
      ],
    ),
  );

  if (continuar == true) await _abrirGestaoSubscricao();
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

class _SeccaoSubscricao extends ConsumerWidget {
  const _SeccaoSubscricao({required this.estado, required this.onSubscrever});

  final EstadoSubscricao? estado;
  final VoidCallback onSubscrever;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPressed: () => _confirmarCancelamento(context, ref),
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

/// Ajuda a diagnosticar lembretes que não chegam: o botão de teste isola
/// se o problema é de permissões/sistema (nem este aparece) ou de
/// agendamento (este aparece, mas os lembretes futuros não).
class _SeccaoNotificacoes extends StatelessWidget {
  const _SeccaoNotificacoes();

  Future<void> _testar(BuildContext context) async {
    await NotificationService.instance.mostrarTeste();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notificação de teste enviada — verifica a barra de notificações.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notificações', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Os lembretes de medicação e consultas são notificações locais, agendadas '
              'diretamente neste telemóvel.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => _testar(context),
              child: const Text('Testar notificação agora'),
            ),
            const SizedBox(height: 12),
            Text(
              'Se a notificação de teste não aparecer, ou se os lembretes agendados '
              'não chegarem: verifica em Definições do Android → Apps → CuidarPT → '
              'Notificações, se estão permitidas; e em Bateria, se a otimização de '
              'bateria está desativada para o CuidarPT (em alguns telemóveis chama-se '
              '"sem restrições" ou "permitir em segundo plano"). Muitas marcas '
              '(Xiaomi, Samsung, Huawei, etc.) bloqueiam lembretes de apps em segundo '
              'plano por omissão.',
              style: Theme.of(context).textTheme.bodySmall,
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
            Text(
              'Sobre',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('CuidarPT${versao != null ? ' — versão $versao' : ''}'),
            const SizedBox(height: 4),
            Text(
              'Todos os dados ficam guardados apenas neste telemóvel.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'O CuidarPT não é um dispositivo médico e não substitui a avaliação, '
              'o diagnóstico ou o tratamento de um profissional de saúde.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => launchUrl(
                Uri.parse('https://srbarbedo83.github.io/CuidarPT/privacidade.html'),
              ),
              child: Text(
                'Política de privacidade',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
