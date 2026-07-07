import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../providers/sinais_vitais_providers.dart';

/// Ecrã de criação/edição de um registo de sinais vitais de [idoso].
///
/// Se [registo] for `null`, cria um novo registo; caso contrário, edita o
/// registo existente (mesmo `id`).
class SinaisVitaisFormScreen extends ConsumerStatefulWidget {
  const SinaisVitaisFormScreen({super.key, required this.idoso, this.registo});

  final Idoso idoso;
  final RegistoSinaisVitais? registo;

  @override
  ConsumerState<SinaisVitaisFormScreen> createState() => _SinaisVitaisFormScreenState();
}

class _SinaisVitaisFormScreenState extends ConsumerState<SinaisVitaisFormScreen> {
  late final TextEditingController _sistolicaController;
  late final TextEditingController _diastolicaController;
  late final TextEditingController _temperaturaController;
  late final TextEditingController _glicemiaController;
  late final TextEditingController _frequenciaCardiacaController;
  late final TextEditingController _notasController;

  late DateTime _timestamp;
  bool _aGuardar = false;

  bool get _aEditar => widget.registo != null;

  @override
  void initState() {
    super.initState();
    final registo = widget.registo;
    _sistolicaController =
        TextEditingController(text: registo?.pressaoSistolica?.toString() ?? '');
    _diastolicaController =
        TextEditingController(text: registo?.pressaoDiastolica?.toString() ?? '');
    _temperaturaController = TextEditingController(text: registo?.temperatura?.toString() ?? '');
    _glicemiaController = TextEditingController(text: registo?.glicemia?.toString() ?? '');
    _frequenciaCardiacaController =
        TextEditingController(text: registo?.frequenciaCardiaca?.toString() ?? '');
    _notasController = TextEditingController(text: registo?.notas ?? '');
    _timestamp = registo?.timestamp ?? DateTime.now();
  }

  @override
  void dispose() {
    _sistolicaController.dispose();
    _diastolicaController.dispose();
    _temperaturaController.dispose();
    _glicemiaController.dispose();
    _frequenciaCardiacaController.dispose();
    _notasController.dispose();
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

    final notas = _notasController.text.trim();
    final registo = widget.registo ?? RegistoSinaisVitais();
    registo
      ..idosoId = widget.idoso.id
      ..pressaoSistolica = int.tryParse(_sistolicaController.text.trim())
      ..pressaoDiastolica = int.tryParse(_diastolicaController.text.trim())
      ..temperatura = double.tryParse(_temperaturaController.text.trim().replaceAll(',', '.'))
      ..glicemia = int.tryParse(_glicemiaController.text.trim())
      ..frequenciaCardiaca = int.tryParse(_frequenciaCardiacaController.text.trim())
      ..notas = notas.isEmpty ? null : notas
      ..timestamp = _timestamp;

    await ref.read(registoSinaisVitaisRepositoryProvider).save(registo);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_aEditar ? 'Editar sinais vitais' : 'Novos sinais vitais')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
        children: [
          Text('Pressão arterial (mmHg)', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _sistolicaController,
                  decoration: const InputDecoration(labelText: 'Sistólica (máxima)'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _diastolicaController,
                  decoration: const InputDecoration(labelText: 'Diastólica (mínima)'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _temperaturaController,
            decoration: const InputDecoration(labelText: 'Temperatura (°C)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _glicemiaController,
            decoration: const InputDecoration(labelText: 'Glicemia (mg/dL)'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _frequenciaCardiacaController,
            decoration: const InputDecoration(labelText: 'Frequência cardíaca (bpm)'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Data e hora'),
            subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(_timestamp)),
            trailing: const Icon(Icons.calendar_today),
            onTap: _escolherDataHora,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _notasController,
            decoration: const InputDecoration(labelText: 'Notas'),
            maxLines: 3,
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
