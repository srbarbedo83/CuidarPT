import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../avaliacao/presentation/convite_avaliacao.dart';
import '../../definicoes/presentation/definicoes_screen.dart';
import '../../idosos/presentation/idoso_detail_screen.dart';
import '../../idosos/presentation/idoso_form_screen.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../idosos/services/avisos_perfil.dart';
import '../../relatorios/presentation/relatorio_screen.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/providers/subscricao_providers.dart';

class HomeShellScreen extends ConsumerStatefulWidget {
  const HomeShellScreen({super.key});

  @override
  ConsumerState<HomeShellScreen> createState() => _HomeShellScreenState();
}

class _HomeShellScreenState extends ConsumerState<HomeShellScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) mostrarConviteAvaliacaoSeNecessario(context, ref);
    });
  }

  Future<void> _adicionarIdoso(BuildContext context, WidgetRef ref, int totalAtual) async {
    final limites = ref.read(featureLimitsProvider);
    final limite = limites.maxPerfisIdoso;
    if (limite != null && totalAtual >= limite) {
      await mostrarLimiteAtingido(
        context,
        mensagem: 'O plano Grátis permite $limite ${limite == 1 ? 'perfil' : 'perfis'} de idoso. '
            'Subscreve o Premium para adicionares mais perfis.',
      );
      return;
    }
    if (context.mounted) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const IdosoFormScreen()),
      );
    }
  }

  Future<void> _apagarIdoso(BuildContext context, WidgetRef ref, Idoso idoso) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar perfil'),
        content: Text('Queres mesmo apagar o perfil de ${idoso.nome}?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(idosoRepositoryProvider).delete(idoso.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final idososAsync = ref.watch(idosoListProvider);
    final estadoSubscricao = ref.watch(estadoSubscricaoProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CuidarPT', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          if (estadoSubscricao != null && estadoSubscricao.trialAtivo)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  'Trial: ${estadoSubscricao.diasRestantesTrial}d',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Definições',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DefinicoesScreen()),
            ),
          ),
        ],
      ),
      body: idososAsync.when(
        data: (idosos) {
          if (idosos.isEmpty) {
            return const _EmptyState();
          }
          if (idosos.length == 1) {
            final unico = idosos.single;
            return ListView(
              children: [
                _IdosoCardDestacado(idoso: unico, onApagar: () => _apagarIdoso(context, ref, unico)),
              ],
            );
          }
          return ListView(
            children: idosos
                .map((idoso) => _IdosoTile(
                      idoso: idoso,
                      onApagar: () => _apagarIdoso(context, ref, idoso),
                    ))
                .toList(),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (erro, stackTrace) => Center(child: Text('Erro ao carregar perfis: $erro')),
      ),
      floatingActionButton: idososAsync.maybeWhen(
        data: (idosos) => FloatingActionButton(
          onPressed: () => _adicionarIdoso(context, ref, idosos.length),
          tooltip: 'Adicionar perfil de idoso',
          child: const Icon(Icons.add),
        ),
        orElse: () => null,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.elderly, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              'Ainda não tens nenhum perfil de idoso.\nToca no botão + para criar o primeiro.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

String _subtituloIdoso(Idoso idoso) {
  final dataNascimento = idoso.dataNascimento;
  if (dataNascimento == null) return 'Data de nascimento não definida';
  return 'Nascimento: ${DateFormat('dd/MM/yyyy').format(dataNascimento)}';
}

class _IdosoCardDestacado extends StatelessWidget {
  const _IdosoCardDestacado({required this.idoso, required this.onApagar});

  final Idoso idoso;
  final VoidCallback onApagar;

  @override
  Widget build(BuildContext context) {
    final fotoPath = idoso.fotoPath;
    final avisos = avisosPerfilIncompleto(idoso);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => IdosoDetailScreen(idoso: idoso)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: fotoPath != null ? FileImage(File(fotoPath)) : null,
                      child: fotoPath == null ? const Icon(Icons.elderly, size: 56) : null,
                    ),
                    if (idoso.mobilidadeReduzida)
                      Positioned(
                        right: -4,
                        bottom: -4,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: const Icon(Icons.accessible, color: Colors.white, size: 20),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        idoso.nome,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (avisos.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Tooltip(
                          message: avisos.join('\n'),
                          child: Icon(Icons.warning_amber_rounded, size: 20, color: Colors.amber.shade800),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(_subtituloIdoso(idoso), style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
                      ),
                      icon: const Icon(Icons.picture_as_pdf_outlined),
                      label: const Text('Gerar relatório'),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onApagar,
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Apagar perfil',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IdosoTile extends StatelessWidget {
  const _IdosoTile({required this.idoso, required this.onApagar});

  final Idoso idoso;
  final VoidCallback onApagar;

  @override
  Widget build(BuildContext context) {
    final fotoPath = idoso.fotoPath;
    final avisos = avisosPerfilIncompleto(idoso);
    return Dismissible(
      key: ValueKey(idoso.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        onApagar();
        return false;
      },
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Icon(Icons.delete_outline),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: fotoPath != null ? FileImage(File(fotoPath)) : null,
          child: fotoPath == null ? const Icon(Icons.elderly) : null,
        ),
        title: Row(
          children: [
            Flexible(child: Text(idoso.nome, style: const TextStyle(fontWeight: FontWeight.bold))),
            if (avisos.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Tooltip(
                  message: avisos.join('\n'),
                  child: Icon(Icons.warning_amber_rounded, size: 16, color: Colors.amber.shade800),
                ),
              ),
          ],
        ),
        subtitle: Text(_subtituloIdoso(idoso)),
        trailing: IconButton(
          icon: const Icon(Icons.picture_as_pdf_outlined),
          tooltip: 'Gerar relatório',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => IdosoDetailScreen(idoso: idoso)),
        ),
      ),
    );
  }
}
