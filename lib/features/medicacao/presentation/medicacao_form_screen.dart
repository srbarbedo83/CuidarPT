import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/horarios.dart';
import '../../../core/utils/medicacao_opcoes.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_medicacao.dart';
import '../providers/medicacao_providers.dart';
import '../services/medicacao_scheduler.dart';

/// Ecrã de criação/edição de um registo de medicação de [idoso].
///
/// Se [registo] for `null`, cria um novo registo; caso contrário, edita o
/// registo existente (mesmo `id`, mantém `criadoEm`).
class MedicacaoFormScreen extends ConsumerStatefulWidget {
  const MedicacaoFormScreen({super.key, required this.idoso, this.registo});

  final Idoso idoso;
  final RegistoMedicacao? registo;

  @override
  ConsumerState<MedicacaoFormScreen> createState() => _MedicacaoFormScreenState();
}

class _MedicacaoFormScreenState extends ConsumerState<MedicacaoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late final TextEditingController _doseController;
  late final TextEditingController _notasController;
  late String _viaAdministracao;

  late List<int> _horariosMinutos;
  late List<int> _diasSemana;
  DateTime? _dataInicio;
  DateTime? _dataFim;
  bool _ativo = true;
  bool _aGuardar = false;
  String? _erroHorarios;

  bool get _aEditar => widget.registo != null;

  @override
  void initState() {
    super.initState();
    final registo = widget.registo;
    _nomeController = TextEditingController(text: registo?.nomeMedicamento ?? '');
    _doseController = TextEditingController(text: registo?.dose ?? '');
    _notasController = TextEditingController(text: registo?.notas ?? '');
    _viaAdministracao = registo?.viaAdministracao ?? '';
    _horariosMinutos = List.of(registo?.horariosMinutos ?? []);
    _diasSemana = List.of(registo?.diasSemana ?? []);
    _dataInicio = registo?.dataInicio ?? DateTime.now();
    _dataFim = registo?.dataFim;
    _ativo = registo?.ativo ?? true;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _doseController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _adicionarHorario() async {
    final agora = TimeOfDay.now();
    final escolhido = await showTimePicker(context: context, initialTime: agora);
    if (escolhido == null) return;
    final minutos = escolhido.hour * 60 + escolhido.minute;
    if (_horariosMinutos.contains(minutos)) return;
    setState(() {
      _horariosMinutos = [..._horariosMinutos, minutos]..sort();
      _erroHorarios = null;
    });
  }

  void _removerHorario(int minutos) {
    setState(() => _horariosMinutos = _horariosMinutos.where((m) => m != minutos).toList());
  }

  Future<void> _gerarHorariosPorFrequencia(int intervaloHoras) async {
    final primeira = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Primeira toma',
    );
    if (primeira == null) return;
    final primeiraMinutos = primeira.hour * 60 + primeira.minute;
    final quantidade = 24 ~/ intervaloHoras;
    final novosHorarios = <int>{
      for (var i = 0; i < quantidade; i++) (primeiraMinutos + i * intervaloHoras * 60) % 1440,
    };
    setState(() {
      _horariosMinutos = novosHorarios.toList()..sort();
      _erroHorarios = null;
    });
  }

  void _alternarDiaSemana(int dia) {
    setState(() {
      _diasSemana = _diasSemana.contains(dia)
          ? _diasSemana.where((d) => d != dia).toList()
          : [..._diasSemana, dia];
    });
  }

  Future<void> _escolherData({required bool inicio}) async {
    final agora = DateTime.now();
    final escolhida = await showDatePicker(
      context: context,
      initialDate: (inicio ? _dataInicio : _dataFim) ?? agora,
      firstDate: DateTime(2000),
      lastDate: DateTime(agora.year + 5),
      helpText: inicio ? 'Data de início' : 'Data de fim',
    );
    if (escolhida != null) {
      setState(() {
        if (inicio) {
          _dataInicio = escolhida;
        } else {
          _dataFim = escolhida;
        }
      });
    }
  }

  Future<void> _guardar() async {
    final formValido = _formKey.currentState!.validate();
    if (_horariosMinutos.isEmpty) {
      setState(() => _erroHorarios = 'Adiciona pelo menos um horário');
    }
    if (!formValido || _horariosMinutos.isEmpty) return;

    setState(() => _aGuardar = true);

    final agora = DateTime.now();
    final dose = _doseController.text.trim();
    final notas = _notasController.text.trim();
    final via = _viaAdministracao.trim();
    final registo = widget.registo ?? RegistoMedicacao();
    registo
      ..idosoId = widget.idoso.id
      ..nomeMedicamento = _nomeController.text.trim()
      ..dose = dose.isEmpty ? null : dose
      ..viaAdministracao = via.isEmpty ? null : via
      ..horariosMinutos = _horariosMinutos
      ..diasSemana = _diasSemana
      ..dataInicio = _dataInicio
      ..dataFim = _dataFim
      ..ativo = _ativo
      ..notas = notas.isEmpty ? null : notas
      ..atualizadoEm = agora;
    if (!_aEditar) {
      registo.criadoEm = agora;
    }

    final repository = ref.read(registoMedicacaoRepositoryProvider);
    await repository.save(registo);
    await MedicacaoScheduler.reagendar(registo, nomeIdoso: widget.idoso.nome);
    await repository.save(registo);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_aEditar ? 'Editar medicação' : 'Nova medicação')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do medicamento *'),
              textCapitalization: TextCapitalization.sentences,
              validator: (valor) =>
                  (valor == null || valor.trim().isEmpty) ? 'Indica o nome do medicamento' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _doseController,
              decoration: const InputDecoration(
                labelText: 'Dose',
                hintText: 'Ex.: 1 comprimido, 500 mg, 10 gotas',
              ),
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              initialValue: TextEditingValue(text: _viaAdministracao),
              optionsBuilder: (valor) {
                if (valor.text.isEmpty) return viasAdministracaoComuns;
                return viasAdministracaoComuns.where(
                  (v) => v.toLowerCase().contains(valor.text.toLowerCase()),
                );
              },
              onSelected: (selecionado) => setState(() => _viaAdministracao = selecionado),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Via de administração',
                    hintText: 'Ex.: Oral, Intravenosa',
                  ),
                  onChanged: (valor) => _viaAdministracao = valor,
                );
              },
            ),
            const SizedBox(height: 24),
            Text('Horários *', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'Preenchimento rápido por frequência (substitui os horários atuais):',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ActionChip(
                  label: const Text('1x por dia'),
                  onPressed: () => _gerarHorariosPorFrequencia(24),
                ),
                ActionChip(
                  label: const Text('De 12 em 12h'),
                  onPressed: () => _gerarHorariosPorFrequencia(12),
                ),
                ActionChip(
                  label: const Text('De 8 em 8h'),
                  onPressed: () => _gerarHorariosPorFrequencia(8),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final minutos in _horariosMinutos)
                  InputChip(
                    label: Text(formatarHorario(minutos)),
                    onDeleted: () => _removerHorario(minutos),
                  ),
                ActionChip(
                  avatar: const Icon(Icons.add, size: 18),
                  label: const Text('Adicionar horário'),
                  onPressed: _adicionarHorario,
                ),
              ],
            ),
            if (_erroHorarios != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_erroHorarios!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
            const SizedBox(height: 24),
            Text('Dias da semana', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'Não escolhas nenhum para tomar todos os dias.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('Todos os dias'),
                  selected: _diasSemana.isEmpty,
                  onSelected: (_) => setState(() => _diasSemana = []),
                ),
                for (final dia in diasSemanaAbreviados.keys)
                  FilterChip(
                    label: Text(diasSemanaAbreviados[dia]!),
                    selected: _diasSemana.contains(dia),
                    onSelected: (_) => _alternarDiaSemana(dia),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data de início'),
              subtitle: Text(
                _dataInicio != null ? DateFormat('dd/MM/yyyy').format(_dataInicio!) : 'Não definida',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _escolherData(inicio: true),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data de fim (opcional)'),
              subtitle: Text(
                _dataFim != null ? DateFormat('dd/MM/yyyy').format(_dataFim!) : 'Sem data definida',
              ),
              trailing: _dataFim != null
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => setState(() => _dataFim = null),
                    )
                  : const Icon(Icons.calendar_today),
              onTap: () => _escolherData(inicio: false),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Lembretes ativos'),
              subtitle: const Text('Desliga para pausar sem apagar o registo'),
              value: _ativo,
              onChanged: (valor) => setState(() => _ativo = valor),
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
      ),
    );
  }
}
