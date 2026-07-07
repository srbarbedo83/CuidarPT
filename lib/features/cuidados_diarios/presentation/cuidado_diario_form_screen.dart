import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../providers/cuidado_diario_providers.dart';

/// Ecrã de registo rápido de uma nota manual de [idoso].
///
/// Higiene, alimentação, sono e humor têm secções próprias no perfil —
/// este ecrã serve só para notas livres.
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
  late DateTime _timestamp;
  bool _aGuardar = false;

  bool get _aEditar => widget.registo != null;

  @override
  void initState() {
    super.initState();
    final registo = widget.registo;
    _notaController = TextEditingController(text: registo?.notaRapida ?? '');
    _timestamp = registo?.timestamp ?? DateTime.now();
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
      ..tipo = TipoCuidadoDiario.outro
      ..notaRapida = nota.isEmpty ? null : nota
      ..timestamp = _timestamp;

    await ref.read(registoCuidadoDiarioRepositoryProvider).save(registo);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_aEditar ? 'Editar nota' : 'Nova nota')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
        children: [
          TextFormField(
            controller: _notaController,
            decoration: const InputDecoration(labelText: 'Nota'),
            maxLines: 4,
            autofocus: true,
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
