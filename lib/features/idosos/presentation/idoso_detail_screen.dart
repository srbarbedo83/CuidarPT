import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/horarios.dart';
import '../../../core/utils/tipo_cuidado_diario_utils.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../consultas/presentation/consulta_form_screen.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../consultas/services/consulta_scheduler.dart';
import '../../cuidados_diarios/presentation/cuidado_diario_form_screen.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../../medicacao/presentation/medicacao_form_screen.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../medicacao/services/medicacao_scheduler.dart';
import '../../relatorios/presentation/relatorio_screen.dart';
import 'idoso_form_screen.dart';

const _maxCuidadosRecentesVisiveis = 15;

class IdosoDetailScreen extends ConsumerWidget {
  const IdosoDetailScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicacaoAsync = ref.watch(medicacaoListProvider(idoso.id));
    final consultasAsync = ref.watch(consultaListProvider(idoso.id));
    final cuidadosAsync = ref.watch(cuidadoDiarioListProvider(idoso.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(idoso.nome),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: 'Gerar relatório',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
            ),
          ),
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
          _CabecalhoSeccao(
            titulo: 'Medicação',
            tooltip: 'Adicionar medicação',
            onAdicionar: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MedicacaoFormScreen(idoso: idoso)),
            ),
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
          const Divider(height: 32),
          _CabecalhoSeccao(
            titulo: 'Consultas',
            tooltip: 'Adicionar consulta',
            onAdicionar: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso)),
            ),
          ),
          consultasAsync.when(
            data: (consultas) {
              if (consultas.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Ainda não há consultas registadas.'),
                );
              }
              return Column(
                children: consultas
                    .map((consulta) => _ConsultaTile(idoso: idoso, consulta: consulta))
                    .toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (erro, _) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Erro ao carregar consultas: $erro'),
            ),
          ),
          const Divider(height: 32),
          _CabecalhoSeccao(
            titulo: 'Cuidados diários',
            tooltip: 'Registar cuidado',
            onAdicionar: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CuidadoDiarioFormScreen(idoso: idoso)),
            ),
          ),
          cuidadosAsync.when(
            data: (registos) {
              if (registos.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Ainda não há cuidados diários registados.'),
                );
              }
              final visiveis = registos.take(_maxCuidadosRecentesVisiveis).toList();
              return Column(
                children: [
                  ...visiveis.map((registo) => _CuidadoDiarioTile(idoso: idoso, registo: registo)),
                  if (registos.length > visiveis.length)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'A mostrar os $_maxCuidadosRecentesVisiveis registos mais recentes.',
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
              child: Text('Erro ao carregar cuidados diários: $erro'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _CabecalhoSeccao extends StatelessWidget {
  const _CabecalhoSeccao({required this.titulo, required this.tooltip, required this.onAdicionar});

  final String titulo;
  final String tooltip;
  final VoidCallback onAdicionar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      child: Row(
        children: [
          Expanded(child: Text(titulo, style: Theme.of(context).textTheme.titleMedium)),
          IconButton(icon: const Icon(Icons.add), tooltip: tooltip, onPressed: onAdicionar),
        ],
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

class _ConsultaTile extends ConsumerWidget {
  const _ConsultaTile({required this.idoso, required this.consulta});

  final Idoso idoso;
  final RegistoConsulta consulta;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar consulta'),
        content: Text('Queres mesmo apagar a consulta de "${consulta.especialidade}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ConsultaScheduler.cancelar(consulta);
      await ref.read(registoConsultaRepositoryProvider).delete(consulta.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proxima = consulta.proximaConsultaData;
    return ListTile(
      leading: const Icon(Icons.event_note_outlined),
      title: Text(consulta.especialidade),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy HH:mm').format(consulta.dataHora)}'
        '${consulta.local != null ? ' · ${consulta.local}' : ''}'
        '${proxima != null ? ' · próxima: ${DateFormat('dd/MM/yyyy').format(proxima)}' : ''}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar consulta',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ConsultaFormScreen(idoso: idoso, consulta: consulta)),
      ),
    );
  }
}

class _CuidadoDiarioTile extends ConsumerWidget {
  const _CuidadoDiarioTile({required this.idoso, required this.registo});

  final Idoso idoso;
  final RegistoCuidadoDiario registo;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar registo'),
        content: const Text('Queres mesmo apagar este registo de cuidado diário?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(registoCuidadoDiarioRepositoryProvider).delete(registo.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nota = registo.notaRapida;
    final humor = registo.humorNivel;
    return ListTile(
      leading: Icon(tipoCuidadoDiarioIcone(registo.tipo)),
      title: Text(
        '${tipoCuidadoDiarioLabel(registo.tipo)}${humor != null ? ' · nível $humor/5' : ''}',
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy HH:mm').format(registo.timestamp)}'
        '${nota != null && nota.isNotEmpty ? ' · $nota' : ''}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar registo',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CuidadoDiarioFormScreen(idoso: idoso, registo: registo)),
      ),
    );
  }
}
