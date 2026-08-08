import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/services/notification_service.dart';
import '../../../data/models/estado_subscricao.dart';
import '../../../data/models/preferencias_app.dart';
import '../../../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    final estado = ref.watch(estadoSubscricaoProvider).valueOrNull;
    final limites = ref.watch(featureLimitsProvider);
    final idosos = ref.watch(idosoListProvider).valueOrNull ?? const [];
    final packageInfo = ref.watch(packageInfoProvider).valueOrNull;
    final tema = ref.watch(temaPreferidoProvider);
    final escalaTexto = ref.watch(escalaTextoProvider);
    final idioma = ref.watch(idiomaPreferidoProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.comumDefinicoes)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SeccaoAparencia(
            tema: tema,
            escalaTexto: escalaTexto,
            idioma: idioma,
            onTemaAlterado: (valor) => ref.read(preferenciasRepositoryProvider).definirTema(valor),
            onEscalaAlterada: (valor) => ref.read(preferenciasRepositoryProvider).definirEscalaTexto(valor),
            onIdiomaAlterado: (valor) => ref.read(preferenciasRepositoryProvider).definirIdioma(valor),
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
  final l10n = AppLocalizations.of(context);
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
      title: Text(l10n.definicoesCancelarAntesTitulo),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (idosos.isNotEmpty) ...[
              Text(l10n.definicoesJaConstruiste),
              const SizedBox(height: 6),
              Text('• ${l10n.definicoesPerfilIdoso(idosos.length)}'),
              if (totalMedicacoes > 0) Text('• ${l10n.definicoesMedicacaoRegistada(totalMedicacoes)}'),
              if (totalConsultas > 0) Text('• ${l10n.definicoesConsultaTratamento(totalConsultas)}'),
              if (totalSinaisVitais > 0) Text('• ${l10n.definicoesRegistoSinaisVitais(totalSinaisVitais)}'),
              const SizedBox(height: 16),
            ],
            Text(l10n.definicoesAoCancelarPremium),
            const SizedBox(height: 6),
            Text('• ${l10n.definicoesPerdeVerPerfis}'),
            Text('• ${l10n.definicoesPerdeSinaisVitais}'),
            Text('• ${l10n.definicoesPerdeRelatoriosPersonalizados}'),
            Text('• ${l10n.definicoesPerdeHistoricoIlimitado}'),
            const SizedBox(height: 16),
            Text(
              l10n.definicoesDadosContinuamGuardados,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.definicoesVoltar),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.definicoesContinuarPlayStore),
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
    required this.idioma,
    required this.onTemaAlterado,
    required this.onEscalaAlterada,
    required this.onIdiomaAlterado,
  });

  final TemaPreferido tema;
  final double escalaTexto;
  final IdiomaPreferido idioma;
  final ValueChanged<TemaPreferido> onTemaAlterado;
  final ValueChanged<double> onEscalaAlterada;
  final ValueChanged<IdiomaPreferido> onIdiomaAlterado;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final opcoesEscala = <double, String>{
      0.85: l10n.definicoesTamanhoPequeno,
      1.0: l10n.definicoesTamanhoMedio,
      1.3: l10n.definicoesTamanhoGrande,
    };
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.definicoesAparencia, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(l10n.definicoesTema, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SegmentedButton<TemaPreferido>(
              segments: [
                ButtonSegment(value: TemaPreferido.sistema, label: Text(l10n.definicoesIdiomaSistema)),
                ButtonSegment(value: TemaPreferido.claro, label: Text(l10n.definicoesTemaClaro)),
                ButtonSegment(value: TemaPreferido.escuro, label: Text(l10n.definicoesTemaEscuro)),
              ],
              selected: {tema},
              onSelectionChanged: (selecao) => onTemaAlterado(selecao.first),
            ),
            const SizedBox(height: 16),
            Text(l10n.definicoesTamanhoLetra, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SegmentedButton<double>(
              segments: opcoesEscala.entries
                  .map((entry) => ButtonSegment(value: entry.key, label: Text(entry.value)))
                  .toList(),
              selected: {escalaTexto},
              onSelectionChanged: (selecao) => onEscalaAlterada(selecao.first),
            ),
            const SizedBox(height: 16),
            Text(l10n.definicoesIdioma, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SegmentedButton<IdiomaPreferido>(
              segments: [
                ButtonSegment(value: IdiomaPreferido.sistema, label: Text(l10n.definicoesIdiomaSistema)),
                ButtonSegment(value: IdiomaPreferido.pt, label: Text(l10n.definicoesIdiomaPortugues)),
                ButtonSegment(value: IdiomaPreferido.en, label: Text(l10n.definicoesIdiomaIngles)),
                ButtonSegment(value: IdiomaPreferido.es, label: Text(l10n.definicoesIdiomaEspanhol)),
              ],
              selected: {idioma},
              onSelectionChanged: (selecao) => onIdiomaAlterado(selecao.first),
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
    final l10n = AppLocalizations.of(context);
    final estadoAtual = estado;
    final String status;
    if (estadoAtual == null) {
      status = l10n.definicoesACarregar;
    } else if (estadoAtual.trialAtivo) {
      status = l10n.definicoesTrialAtivo(estadoAtual.diasRestantesTrial);
    } else if (estadoAtual.premiumAtivo) {
      status = l10n.definicoesPlanoPremiumAtivo;
    } else {
      status = l10n.definicoesPlanoGratis;
    }

    final semSubscricaoPaga = estadoAtual == null || !estadoAtual.premiumAtivo;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.definicoesSubscricaoTitulo, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(status),
            const SizedBox(height: 12),
            Text(l10n.definicoesOQueInclui, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            _ItemBeneficio(l10n.definicoesBeneficioPerfis),
            _ItemBeneficio(l10n.definicoesBeneficioRelatorios),
            _ItemBeneficio(l10n.definicoesBeneficioHistorico),
            _ItemBeneficio(l10n.definicoesBeneficioMeteorologia),
            const SizedBox(height: 8),
            Text(
              l10n.definicoesPrecos,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (semSubscricaoPaga) ...[
              const SizedBox(height: 12),
              FilledButton(onPressed: onSubscrever, child: Text(l10n.premiumSubscreverTitulo)),
            ] else ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => _confirmarCancelamento(context, ref),
                child: Text(l10n.definicoesGerirCancelar),
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
    final l10n = AppLocalizations.of(context);
    final limiteTexto = maxPerfisIdoso == null ? l10n.definicoesIlimitados : '$maxPerfisIdoso';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.definicoesPerfisIdosos, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(l10n.definicoesPerfisEmUso(totalIdosos, limiteTexto)),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.definicoesVerPerfis),
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
    final l10n = AppLocalizations.of(context);
    await NotificationService.instance.mostrarTeste(l10n);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.definicoesNotificacaoTesteEnviada)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.definicoesNotificacoes, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              l10n.definicoesNotificacoesDescricao,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => _testar(context),
              child: Text(l10n.definicoesTestarNotificacao),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.definicoesTroubleshootingNotificacoes,
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
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.definicoesSobre,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('${l10n.appTitle}${versao != null ? l10n.definicoesVersaoSufixo(versao!) : ''}'),
            const SizedBox(height: 4),
            Text(
              l10n.definicoesDadosSoTelemovel,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.definicoesAvisoNaoDispositivoMedico,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => launchUrl(
                Uri.parse('https://srbarbedo83.github.io/CuidarPT/privacidade.html'),
              ),
              child: Text(
                l10n.definicoesPoliticaPrivacidade,
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
