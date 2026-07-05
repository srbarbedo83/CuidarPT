import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../definicoes/presentation/definicoes_screen.dart';
import '../../idosos/presentation/idoso_detail_screen.dart';
import '../../idosos/presentation/idoso_form_screen.dart';
import '../../idosos/providers/idoso_providers.dart';
import '../../subscricao/feature_limits.dart';
import '../../subscricao/providers/subscricao_providers.dart';
import '../../tempo/presentation/info_local_card.dart';

class HomeShellScreen extends ConsumerWidget {
  const HomeShellScreen({super.key});

  Future<void> _adicionarIdoso(BuildContext context, WidgetRef ref, int totalAtual) async {
    final limites = ref.read(featureLimitsProvider);
    final limite = limites.maxPerfisIdoso;
    if (limite != null && totalAtual >= limite) {
      await mostrarLimiteAtingido(
        context,
        mensagem: 'O plano Grátis permite $limite perfil de idoso. '
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
  Widget build(BuildContext context, WidgetRef ref) {
    final idososAsync = ref.watch(idosoListProvider);
    final estadoSubscricao = ref.watch(estadoSubscricaoProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CuidarPT'),
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
            return ListView(
              children: const [
                Padding(padding: EdgeInsets.all(16), child: InfoLocalCard()),
                _EmptyState(),
              ],
            );
          }
          return ListView(
            children: [
              const Padding(padding: EdgeInsets.all(16), child: InfoLocalCard()),
              ...idosos.map((idoso) => _IdosoTile(
                    idoso: idoso,
                    onApagar: () => _apagarIdoso(context, ref, idoso),
                  )),
            ],
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

class _IdosoTile extends StatelessWidget {
  const _IdosoTile({required this.idoso, required this.onApagar});

  final Idoso idoso;
  final VoidCallback onApagar;

  @override
  Widget build(BuildContext context) {
    final fotoPath = idoso.fotoPath;
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
        title: Text(idoso.nome),
        subtitle: Text(_subtitulo(idoso)),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => IdosoDetailScreen(idoso: idoso)),
        ),
      ),
    );
  }

  String _subtitulo(Idoso idoso) {
    final dataNascimento = idoso.dataNascimento;
    if (dataNascimento == null) return 'Data de nascimento não definida';
    return 'Nascimento: ${DateFormat('dd/MM/yyyy').format(dataNascimento)}';
  }
}
