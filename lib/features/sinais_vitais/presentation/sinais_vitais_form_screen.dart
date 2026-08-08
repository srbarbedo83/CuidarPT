import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../l10n/app_localizations.dart';
import '../../frequencia_cardiaca/presentation/medir_frequencia_cardiaca_screen.dart';
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
  late final TextEditingController _pesoController;
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
    _pesoController = TextEditingController(text: registo?.peso?.toString() ?? '');
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
    _pesoController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _escolherDataHora() async {
    final l10n = AppLocalizations.of(context);
    final data = await showDatePicker(
      context: context,
      initialDate: _timestamp,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: l10n.sinaisVitaisFormDataRegisto,
    );
    if (data == null || !mounted) return;

    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_timestamp),
      helpText: l10n.sinaisVitaisFormHoraRegisto,
    );
    if (hora == null) return;

    setState(() => _timestamp = DateTime(data.year, data.month, data.day, hora.hour, hora.minute));
  }

  Future<void> _medirComCamara() async {
    final bpm = await Navigator.of(context).push<int>(
      MaterialPageRoute(builder: (_) => MedirFrequenciaCardiacaScreen(idoso: widget.idoso)),
    );
    if (bpm != null && mounted) {
      setState(() => _frequenciaCardiacaController.text = bpm.toString());
    }
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
      ..peso = double.tryParse(_pesoController.text.trim().replaceAll(',', '.'))
      ..notas = notas.isEmpty ? null : notas
      ..timestamp = _timestamp;

    await ref.read(registoSinaisVitaisRepositoryProvider).save(registo);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_aEditar ? l10n.sinaisVitaisFormEditarTitulo : l10n.sinaisVitaisFormNovoTitulo),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
        children: [
          Text(l10n.sinaisVitaisFormPressaoTitulo, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _sistolicaController,
                  decoration: InputDecoration(labelText: l10n.sinaisVitaisFormSistolica),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _diastolicaController,
                  decoration: InputDecoration(labelText: l10n.sinaisVitaisFormDiastolica),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _temperaturaController,
            decoration: InputDecoration(labelText: l10n.sinaisVitaisFormTemperatura),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _glicemiaController,
            decoration: InputDecoration(labelText: l10n.sinaisVitaisFormGlicemia),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _frequenciaCardiacaController,
                  decoration: InputDecoration(labelText: l10n.sinaisVitaisFormFrequencia),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                onPressed: _medirComCamara,
                icon: const Icon(Icons.favorite_outline),
                tooltip: l10n.sinaisVitaisFormMedirCamara,
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _pesoController,
            decoration: InputDecoration(labelText: l10n.sinaisVitaisFormPeso),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.sinaisVitaisFormDataHora),
            subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(_timestamp)),
            trailing: const Icon(Icons.calendar_today),
            onTap: _escolherDataHora,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _notasController,
            decoration: InputDecoration(labelText: l10n.sinaisVitaisFormNotas),
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
                : Text(l10n.comumGuardar),
          ),
        ],
      ),
    );
  }
}
