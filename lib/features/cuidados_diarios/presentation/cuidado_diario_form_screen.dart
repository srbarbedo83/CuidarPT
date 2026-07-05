import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/tipo_cuidado_diario_utils.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../providers/cuidado_diario_providers.dart';

/// Ecrã de registo rápido de um cuidado diário de [idoso].
///
/// Se [registo] for `null`, cria um novo registo; caso contrário, edita o
/// registo existente (mesmo `id`).
class CuidadoDiarioFormScreen extends ConsumerStatefulWidget {
  const CuidadoDiarioFormScreen({super.key, required this.idoso, this.registo});

  final Idoso idoso;
  final RegistoCuidadoDiario? registo;

  @override
  ConsumerState<CuidadoDiarioFormScreen> createState() => _CuidadoDiarioFormScreenState();
}

class _CuidadoDiarioFormScreenState extends ConsumerState<CuidadoDiarioFormScreen> {
  late final TextEditingController _notaController;
  late TipoCuidadoDiario _tipo;
  late DateTime _timestamp;
  int _humorNivel = 3;
  bool _aGuardar = false;

  bool get _aEditar => widget.registo != null;

  @override
  void initState() {
    super.initState();
    final registo = widget.registo;
    _notaController = TextEditingController(text: registo?.notaRapida ?? '');
    _tipo = registo?.tipo ?? TipoCuidadoDiario.higiene;
    _timestamp = registo?.timestamp ?? DateTime.now();
    _humorNivel = registo?.humorNivel ?? 3;
  }

  @override
  void dispose() {
    _notaController.dispose();
    super.dispose();
  }

  Future<void> _escolherDataHora() async {
    final data = await showDatePicker(
      context: context,
      initialDate: _timestamp,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: 'Data do registo',
    );
    if (data == null || !mounted) return;

    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_timestamp),
      helpText: 'Hora do registo',
    );
    if (hora == null) return;

    setState(() => _timestamp = DateTime(data.year, data.month, data.day, hora.hour, hora.minute));
  }

  Future<void> _guardar() async {
    setState(() => _aGuardar = true);

    final nota = _notaController.text.trim();
    final registo = widget.registo ?? RegistoCuidadoDiario();
    registo
      ..idosoId = widget.idoso.id
      ..tipo = _tipo
      ..notaRapida = nota.isEmpty ? null : nota
      ..humorNivel = _tipo == TipoCuidadoDiario.humor ? _humorNivel : null
      ..timestamp = _timestamp;

    await ref.read(registoCuidadoDiarioRepositoryProvider).save(registo);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_aEditar ? 'Editar registo' : 'Novo registo de cuidado')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tipo in TipoCuidadoDiario.values)
                ChoiceChip(
                  avatar: Icon(tipoCuidadoDiarioIcone(tipo), size: 18),
                  label: Text(tipoCuidadoDiarioLabel(tipo)),
                  selected: _tipo == tipo,
                  onSelected: (_) => setState(() => _tipo = tipo),
                ),
            ],
          ),
          if (_tipo == TipoCuidadoDiario.humor) ...[
            const SizedBox(height: 24),
            Text('Nível de humor', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var nivel = 1; nivel <= 5; nivel++)
                  _NivelHumorBotao(
                    nivel: nivel,
                    selecionado: _humorNivel == nivel,
                    onTap: () => setState(() => _humorNivel = nivel),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 24),
          TextFormField(
            controller: _notaController,
            decoration: const InputDecoration(labelText: 'Nota rápida (opcional)'),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Data e hora'),
            subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(_timestamp)),
            trailing: const Icon(Icons.calendar_today),
            onTap: _escolherDataHora,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _aGuardar ? null : _guardar,
            child: _aGuardar
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

class _NivelHumorBotao extends StatelessWidget {
  const _NivelHumorBotao({required this.nivel, required this.selecionado, required this.onTap});

  final int nivel;
  final bool selecionado;
  final VoidCallback onTap;

  static const _emojis = {1: '😞', 2: '🙁', 3: '😐', 4: '🙂', 5: '😄'};

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: selecionado
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Text(_emojis[nivel]!, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
