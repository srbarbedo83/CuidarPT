import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/item_rotina.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../l10n/app_localizations.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../providers/rotina_providers.dart';

bool _mesmoDia(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

List<String> _sugestoesHigiene(AppLocalizations l10n) => [
      l10n.rotinaSugestaoBanho,
      l10n.rotinaSugestaoEscovarDentes,
      l10n.rotinaSugestaoHigieneIntima,
      l10n.rotinaSugestaoPentearCabelo,
    ];

List<String> _sugestoesAlimentacao(AppLocalizations l10n) => [
      l10n.rotinaSugestaoPequenoAlmoco,
      l10n.rotinaSugestaoAlmoco,
      l10n.rotinaSugestaoLanche,
      l10n.rotinaSugestaoJantar,
      l10n.rotinaSugestaoHidratacao,
    ];

List<String> _sugestoesSono(AppLocalizations l10n) => [
      l10n.rotinaSugestaoSesta,
      l10n.rotinaSugestaoDeitarNoite,
      l10n.rotinaSugestaoAcordar,
    ];

List<String> _sugestoesAtividade(AppLocalizations l10n) => [
      l10n.rotinaSugestaoPasseio,
      l10n.rotinaSugestaoExercicios,
      l10n.rotinaSugestaoAlongamentos,
    ];

String _labelCategoria(AppLocalizations l10n, CategoriaRotina categoria) {
  switch (categoria) {
    case CategoriaRotina.higiene:
      return l10n.rotinaCategoriaHigiene;
    case CategoriaRotina.alimentacao:
      return l10n.rotinaCategoriaAlimentacao;
    case CategoriaRotina.sono:
      return l10n.rotinaCategoriaSono;
    case CategoriaRotina.atividade:
      return l10n.rotinaCategoriaAtividade;
  }
}

List<String> _sugestoesPorCategoria(AppLocalizations l10n, CategoriaRotina categoria) {
  switch (categoria) {
    case CategoriaRotina.higiene:
      return _sugestoesHigiene(l10n);
    case CategoriaRotina.alimentacao:
      return _sugestoesAlimentacao(l10n);
    case CategoriaRotina.sono:
      return _sugestoesSono(l10n);
    case CategoriaRotina.atividade:
      return _sugestoesAtividade(l10n);
  }
}

TipoCuidadoDiario _tipoCuidadoParaCategoria(CategoriaRotina categoria) {
  switch (categoria) {
    case CategoriaRotina.higiene:
      return TipoCuidadoDiario.higiene;
    case CategoriaRotina.alimentacao:
      return TipoCuidadoDiario.alimentacao;
    case CategoriaRotina.sono:
      return TipoCuidadoDiario.sono;
    case CategoriaRotina.atividade:
      return TipoCuidadoDiario.atividade;
  }
}

/// Secção Premium de rotina de higiene/alimentação/sono/atividade no
/// perfil do idoso. Minimizada por padrão (ExpansionTile fechado); lista
/// itens recorrentes e permite marcá-los como feitos no dia, um a um ou
/// vários de uma vez através do modo de seleção múltipla.
class RotinaSection extends ConsumerStatefulWidget {
  const RotinaSection({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<RotinaSection> createState() => _RotinaSectionState();
}

class _RotinaSectionState extends ConsumerState<RotinaSection> {
  bool _modoSelecaoMultipla = false;
  final _selecionados = <int>{};

  Idoso get idoso => widget.idoso;

  Future<void> _adicionarItem(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    var categoria = CategoriaRotina.higiene;
    final nomeController = TextEditingController();
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: Text(l10n.rotinaNovoItemTitulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<CategoriaRotina>(
                segments: [
                  ButtonSegment(value: CategoriaRotina.higiene, label: Text(l10n.rotinaCategoriaHigiene)),
                  ButtonSegment(
                    value: CategoriaRotina.alimentacao,
                    label: Text(l10n.rotinaCategoriaAlimentacao),
                  ),
                  ButtonSegment(value: CategoriaRotina.sono, label: Text(l10n.rotinaCategoriaSono)),
                  ButtonSegment(value: CategoriaRotina.atividade, label: Text(l10n.rotinaCategoriaAtividade)),
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
                    for (final sugestao in _sugestoesPorCategoria(l10n, categoria))
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
                decoration: InputDecoration(hintText: l10n.rotinaNovoItemHint),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.comumCancelar),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.comumGuardar),
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
    final l10n = AppLocalizations.of(context);
    final origem = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(l10n.documentosTirarFotografia),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.documentosEscolherGaleria),
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
        ..tipo = _tipoCuidadoParaCategoria(item.categoria)
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
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final itensAsync = ref.watch(itemRotinaListProvider(idoso.id));
    final cuidados = ref.watch(cuidadoDiarioListProvider(idoso.id)).valueOrNull ?? const [];
    final agora = DateTime.now();
    final cuidadosHoje = cuidados.where((c) => _mesmoDia(c.timestamp, agora)).toList();

    return itensAsync.when(
      data: (itens) {
        final ativos = itens.where((i) => i.ativo).toList();
        final pendentes = ativos.where((i) => _conclusaoHoje(i, cuidadosHoje) == null).toList();
        return ExpansionTile(
          title: Text(
            l10n.rotinaTitulo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(ativos.isEmpty ? l10n.rotinaNenhumItem : l10n.rotinaContagemItens(ativos.length)),
          children: [
            if (pendentes.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () => setState(() {
                      _modoSelecaoMultipla = !_modoSelecaoMultipla;
                      _selecionados.clear();
                    }),
                    icon: Icon(_modoSelecaoMultipla ? Icons.close : Icons.checklist),
                    label: Text(_modoSelecaoMultipla ? l10n.comumCancelar : l10n.rotinaSelecionarVarios),
                  ),
                ),
              ),
            for (final item in ativos)
              CheckboxListTile(
                title: Text(item.nome),
                subtitle: Text(_labelCategoria(l10n, item.categoria)),
                value: _modoSelecaoMultipla
                    ? (_conclusaoHoje(item, cuidadosHoje) != null || _selecionados.contains(item.id))
                    : _conclusaoHoje(item, cuidadosHoje) != null,
                onChanged: _modoSelecaoMultipla && _conclusaoHoje(item, cuidadosHoje) != null
                    ? null
                    : (valor) {
                        if (_modoSelecaoMultipla) {
                          setState(() {
                            if (valor == true) {
                              _selecionados.add(item.id);
                            } else {
                              _selecionados.remove(item.id);
                            }
                          });
                        } else {
                          _alternarConcluido(ref, item, valor ?? false, cuidadosHoje);
                        }
                      },
                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.categoria == CategoriaRotina.alimentacao &&
                        _conclusaoHoje(item, cuidadosHoje) != null)
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        tooltip: l10n.rotinaFotoPrato,
                        onPressed: () =>
                            _adicionarFoto(context, ref, _conclusaoHoje(item, cuidadosHoje)!),
                      ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: l10n.rotinaApagarItem,
                      onPressed: () => _apagarItem(ref, item),
                    ),
                  ],
                ),
              ),
            if (_modoSelecaoMultipla)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    onPressed: _selecionados.isEmpty
                        ? null
                        : () async {
                            for (final item in ativos.where((i) => _selecionados.contains(i.id))) {
                              await _alternarConcluido(ref, item, true, cuidadosHoje);
                            }
                            setState(() {
                              _selecionados.clear();
                              _modoSelecaoMultipla = false;
                            });
                          },
                    icon: const Icon(Icons.check),
                    label: Text(
                      _selecionados.isEmpty
                          ? l10n.rotinaMarcarComoFeito
                          : l10n.rotinaMarcarNComoFeito(_selecionados.length),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => _adicionarItem(context, ref),
                  icon: const Icon(Icons.add),
                  label: Text(l10n.rotinaAdicionarItem),
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
