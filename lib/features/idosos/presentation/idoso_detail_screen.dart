import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/horarios.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../medicacao/presentation/medicacao_form_screen.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../medicacao/services/medicacao_scheduler.dart';
import 'idoso_form_screen.dart';

class IdosoDetailScreen extends ConsumerWidget {
  const IdosoDetailScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicacaoAsync = ref.watch(medicacaoListProvider(idoso.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(idoso.nome),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar perfil',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => IdosoFormScreen(idoso: idoso)),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _CabecalhoIdoso(idoso: idoso),
          const Divider(height: 32),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text('Medicação', style: Theme.of(context).textTheme.titleMedium),
          ),
          medicacaoAsync.when(
            data: (registos) {
              if (registos.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Ainda não há medicação registada.'),
                );
              }
              return Column(
                children: registos
                    .map((registo) => _MedicacaoTile(idoso: idoso, registo: registo))
                    .toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (erro, _) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Erro ao carregar medicação: $erro'),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso)),
        ),
        tooltip: 'Adicionar medicação',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CabecalhoIdoso extends StatelessWidget {
  const _CabecalhoIdoso({required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context) {
    final fotoPath = idoso.fotoPath;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: fotoPath != null ? FileImage(File(fotoPath)) : null,
            child: fotoPath == null ? const Icon(Icons.elderly) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (idoso.dataNascimento != null)
                  Text('Nascimento: ${DateFormat('dd/MM/yyyy').format(idoso.dataNascimento!)}'),
                if (idoso.contactoEmergenciaNome != null || idoso.contactoEmergenciaTelefone != null)
                  Text(
                    'Emergência: ${idoso.contactoEmergenciaNome ?? ''} '
                    '${idoso.contactoEmergenciaTelefone ?? ''}'.trim(),
                  ),
                if (idoso.notas != null && idoso.notas!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(idoso.notas!, style: Theme.of(context).textTheme.bodySmall),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicacaoTile extends ConsumerWidget {
  const _MedicacaoTile({required this.idoso, required this.registo});

  final Idoso idoso;
  final RegistoMedicacao registo;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar medicação'),
        content: Text('Queres mesmo apagar "${registo.nomeMedicamento}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await MedicacaoScheduler.cancelar(registo);
      await ref.read(registoMedicacaoRepositoryProvider).delete(registo.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horarios = registo.horariosMinutos.map(formatarHorario).join(', ');
    return ListTile(
      leading: Icon(
        Icons.medication_outlined,
        color: registo.ativo ? null : Theme.of(context).disabledColor,
      ),
      title: Text(registo.nomeMedicamento),
      subtitle: Text(
        '${registo.dose != null ? '${registo.dose} · ' : ''}$horarios · '
        '${formatarDiasSemana(registo.diasSemana)}'
        '${registo.ativo ? '' : ' · pausada'}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar medicação',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso, registo: registo)),
      ),
    );
  }
}
