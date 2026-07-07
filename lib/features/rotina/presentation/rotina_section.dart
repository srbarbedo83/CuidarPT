import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/item_rotina.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../providers/rotina_providers.dart';

bool _mesmoDia(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

const _sugestoesHigiene = ['Banho', 'Escovar os dentes', 'Higiene íntima', 'Pentear/arranjar cabelo'];
const _sugestoesAlimentacao = ['Pequeno-almoço', 'Almoço', 'Lanche', 'Jantar', 'Hidratação/Água'];

/// Secção Premium de rotina de higiene/alimentação no perfil do idoso.
/// Minimizada por padrão (ExpansionTile fechado); lista itens recorrentes
/// e permite marcá-los como feitos no dia.
class RotinaSection extends ConsumerWidget {
  const RotinaSection({super.key, required this.idoso});

  final Idoso idoso;

  Future<void> _adicionarItem(BuildContext context, WidgetRef ref) async {
    var categoria = CategoriaRotina.higiene;
    final nomeController = TextEditingController();
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: const Text('Novo item de rotina'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<CategoriaRotina>(
                segments: const [
                  ButtonSegment(value: CategoriaRotina.higiene, label: Text('Higiene')),
                  ButtonSegment(value: CategoriaRotina.alimentacao, label: Text('Alimentação')),
                ],
                selected: {categoria},
                onSelectionChanged: (selecao) => setStateDialog(() => categoria = selecao.first),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final sugestao in categoria == CategoriaRotina.higiene
                        ? _sugestoesHigiene
                        : _sugestoesAlimentacao)
                      ActionChip(
                        label: Text(sugestao),
                        onPressed: () => setStateDialog(() => nomeController.text = sugestao),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(hintText: 'Ex.: Banho, Pequeno-almoço'),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
    if (confirmar != true || nomeController.text.trim().isEmpty) return;

    final item = ItemRotina()
      ..idosoId = idoso.id
      ..categoria = categoria
      ..nome = nomeController.text.trim()
      ..criadoEm = DateTime.now();
    await ref.read(itemRotinaRepositoryProvider).save(item);
  }

  Future<void> _apagarItem(WidgetRef ref, ItemRotina item) {
    return ref.read(itemRotinaRepositoryProvider).delete(item.id);
  }

  Future<void> _adicionarFoto(BuildContext context, WidgetRef ref, RegistoCuidadoDiario registo) async {
    final origem = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Tirar fotografia'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Escolher da galeria'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (origem == null || !context.mounted) return;

    final ficheiro = await ImagePicker().pickImage(source: origem, maxWidth: 1600, imageQuality: 85);
    if (ficheiro == null) return;

    final caminhoAnterior = registo.fotoPath;
    final caminhoGuardado = await PhotoStorage.guardarFotoRefeicao(File(ficheiro.path));
    registo.fotoPath = caminhoGuardado;
    await ref.read(registoCuidadoDiarioRepositoryProvider).save(registo);
    await PhotoStorage.apagarFoto(caminhoAnterior);
  }

  RegistoCuidadoDiario? _conclusaoHoje(ItemRotina item, List<RegistoCuidadoDiario> cuidadosHoje) {
    return cuidadosHoje.firstWhereOrNull((c) => c.itemRotinaId == item.id);
  }

  Future<void> _alternarConcluido(
    WidgetRef ref,
    ItemRotina item,
    bool concluido,
    List<RegistoCuidadoDiario> cuidadosHoje,
  ) async {
    final repository = ref.read(registoCuidadoDiarioRepositoryProvider);
    if (concluido) {
      final registo = RegistoCuidadoDiario()
        ..idosoId = idoso.id
        ..tipo = item.categoria == CategoriaRotina.higiene
            ? TipoCuidadoDiario.higiene
            : TipoCuidadoDiario.alimentacao
        ..itemRotinaId = item.id
        ..notaRapida = item.nome
        ..timestamp = DateTime.now();
      await repository.save(registo);
    } else {
      final existente = _conclusaoHoje(item, cuidadosHoje);
      if (existente != null) await repository.delete(existente.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itensAsync = ref.watch(itemRotinaListProvider(idoso.id));
    final cuidados = ref.watch(cuidadoDiarioListProvider(idoso.id)).valueOrNull ?? const [];
    final agora = DateTime.now();
    final cuidadosHoje = cuidados.where((c) => _mesmoDia(c.timestamp, agora)).toList();

    return itensAsync.when(
      data: (itens) {
        final ativos = itens.where((i) => i.ativo).toList();
        return ExpansionTile(
          title: const Text('Rotina de higiene e alimentação'),
          subtitle: Text(ativos.isEmpty ? 'Nenhum item' : '${ativos.length} itens'),
          children: [
            for (final item in ativos)
              CheckboxListTile(
                title: Text(item.nome),
                subtitle: Text(item.categoria == CategoriaRotina.higiene ? 'Higiene' : 'Alimentação'),
                value: _conclusaoHoje(item, cuidadosHoje) != null,
                onChanged: (valor) => _alternarConcluido(ref, item, valor ?? false, cuidadosHoje),
                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.categoria == CategoriaRotina.alimentacao &&
                        _conclusaoHoje(item, cuidadosHoje) != null)
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        tooltip: 'Foto do prato',
                        onPressed: () =>
                            _adicionarFoto(context, ref, _conclusaoHoje(item, cuidadosHoje)!),
                      ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Apagar item',
                      onPressed: () => _apagarItem(ref, item),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => _adicionarItem(context, ref),
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar item'),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
