import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/consulta_opcoes.dart';
import '../../../core/utils/horarios.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../providers/consulta_providers.dart';
import '../services/consulta_scheduler.dart';
import '../services/profissionais.dart';

/// Ecrã de criação/edição de uma consulta médica de [idoso].
///
/// Se [consulta] for `null`, cria um novo registo; caso contrário, edita o
/// registo existente (mesmo `id`, mantém `criadoEm`).
class ConsultaFormScreen extends ConsumerStatefulWidget {
  const ConsultaFormScreen({super.key, required this.idoso, this.consulta});

  final Idoso idoso;
  final RegistoConsulta? consulta;

  @override
  ConsumerState<ConsultaFormScreen> createState() => _ConsultaFormScreenState();
}

class _ConsultaFormScreenState extends ConsumerState<ConsultaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TipoRegistoConsulta _tipo;
  late String _especialidade;
  late String _local;
  late String _medico;
  late final TextEditingController _notasController;

  late DateTime _dataHora;
  DateTime? _proximaConsultaData;
  bool _recorrente = false;
  late List<int> _diasSemanaRecorrencia;
  bool _lembreteAtivo = true;
  bool _aGuardar = false;

  bool get _aEditar => widget.consulta != null;
  bool get _ehTratamento => _tipo == TipoRegistoConsulta.tratamento;

  @override
  void initState() {
    super.initState();
    final consulta = widget.consulta;
    _tipo = consulta?.tipo ?? TipoRegistoConsulta.consulta;
    _especialidade = consulta?.especialidade ?? '';
    _local = consulta?.local ?? '';
    _medico = consulta?.nomeMedico ?? '';
    _notasController = TextEditingController(text: consulta?.notas ?? '');
    _dataHora = consulta?.dataHora ?? DateTime.now();
    _proximaConsultaData = consulta?.proximaConsultaData;
    _recorrente = consulta?.recorrente ?? false;
    _diasSemanaRecorrencia = List.of(consulta?.diasSemanaRecorrencia ?? []);
    _lembreteAtivo = consulta?.lembreteAtivo ?? true;
  }

  @override
  void dispose() {
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _escolherDataHora() async {
    final data = await showDatePicker(
      context: context,
      initialDate: _dataHora,
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 5),
      helpText: 'Data da consulta',
    );
    if (data == null || !mounted) return;

    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dataHora),
      helpText: 'Hora da consulta',
    );
    if (hora == null) return;

    setState(() => _dataHora = DateTime(data.year, data.month, data.day, hora.hour, hora.minute));
  }

  void _alternarDiaSemanaRecorrencia(int dia) {
    setState(() {
      _diasSemanaRecorrencia = _diasSemanaRecorrencia.contains(dia)
          ? _diasSemanaRecorrencia.where((d) => d != dia).toList()
          : [..._diasSemanaRecorrencia, dia];
    });
  }

  Future<void> _escolherProximaConsulta() async {
    final agora = DateTime.now();
    final escolhida = await showDatePicker(
      context: context,
      initialDate: _proximaConsultaData ?? agora,
      firstDate: DateTime(2000),
      lastDate: DateTime(agora.year + 5),
      helpText: 'Próxima consulta',
    );
    if (escolhida != null) {
      setState(() => _proximaConsultaData = escolhida);
    }
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _aGuardar = true);

    final agora = DateTime.now();
    final local = _local.trim();
    final medico = _medico.trim();
    final notas = _notasController.text.trim();
    final consulta = widget.consulta ?? RegistoConsulta();
    consulta
      ..idosoId = widget.idoso.id
      ..tipo = _tipo
      ..especialidade = _especialidade.trim()
      ..local = local.isEmpty ? null : local
      ..nomeMedico = medico.isEmpty ? null : medico
      ..dataHora = _dataHora
      ..notas = notas.isEmpty ? null : notas
      ..proximaConsultaData = _ehTratamento && _recorrente ? null : _proximaConsultaData
      ..recorrente = _ehTratamento && _recorrente
      ..diasSemanaRecorrencia = _ehTratamento && _recorrente ? _diasSemanaRecorrencia : []
      ..lembreteAtivo = _lembreteAtivo
      ..atualizadoEm = agora;
    if (!_aEditar) {
      consulta.criadoEm = agora;
    }

    final repository = ref.read(registoConsultaRepositoryProvider);
    await repository.save(consulta);
    await ConsultaScheduler.reagendar(consulta, nomeIdoso: widget.idoso.nome);
    await repository.save(consulta);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tituloEcra = _aEditar
        ? (_ehTratamento ? 'Editar tratamento' : 'Editar consulta')
        : (_ehTratamento ? 'Novo tratamento' : 'Nova consulta');
    final opcoesEspecialidade = _ehTratamento ? tratamentosComuns : especialidadesComuns;
    final consultasDoIdoso = ref.watch(consultaListProvider(widget.idoso.id)).valueOrNull ?? const [];
    final nomesProfissionais = profissionaisDoIdoso(consultasDoIdoso).map((p) => p.nome).toList();

    return Scaffold(
      appBar: AppBar(title: Text(tituloEcra)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
          children: [
            SegmentedButton<TipoRegistoConsulta>(
              segments: const [
                ButtonSegment(value: TipoRegistoConsulta.consulta, label: Text('Consulta médica')),
                ButtonSegment(value: TipoRegistoConsulta.tratamento, label: Text('Tratamento')),
              ],
              selected: {_tipo},
              onSelectionChanged: (selecao) => setState(() => _tipo = selecao.first),
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              key: ValueKey(_tipo),
              initialValue: TextEditingValue(text: _especialidade),
              optionsBuilder: (valor) {
                if (valor.text.isEmpty) return opcoesEspecialidade;
                return opcoesEspecialidade.where(
                  (e) => e.toLowerCase().contains(valor.text.toLowerCase()),
                );
              },
              onSelected: (selecionado) => setState(() => _especialidade = selecionado),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: _ehTratamento ? 'Tipo de tratamento *' : 'Especialidade *',
                    hintText: _ehTratamento
                        ? 'Ex.: Fisioterapia, Enfermagem'
                        : 'Ex.: Clínica geral, Cardiologia',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (valor) => _especialidade = valor,
                  validator: (valor) => (valor == null || valor.trim().isEmpty)
                      ? (_ehTratamento ? 'Indica o tipo de tratamento' : 'Indica a especialidade')
                      : null,
                );
              },
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              initialValue: TextEditingValue(text: _local),
              optionsBuilder: (valor) {
                final opcoes = [...locaisComuns, ...hospitaisComuns];
                if (valor.text.isEmpty) return opcoes;
                return opcoes.where((l) => l.toLowerCase().contains(valor.text.toLowerCase()));
              },
              onSelected: (selecionado) => setState(() => _local = selecionado),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Local',
                    hintText: 'Ex.: Centro de Saúde, Hospital, Clínica privada',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (valor) => _local = valor,
                );
              },
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              initialValue: TextEditingValue(text: _medico),
              optionsBuilder: (valor) {
                if (valor.text.isEmpty) return nomesProfissionais;
                return nomesProfissionais.where(
                  (nome) => nome.toLowerCase().contains(valor.text.toLowerCase()),
                );
              },
              onSelected: (selecionado) => setState(() => _medico = selecionado),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: _ehTratamento ? 'Profissional' : 'Nome do médico',
                    hintText: _ehTratamento ? 'Ex.: Enf. Maria Santos' : 'Ex.: Dr. António Silva',
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: (valor) => _medico = valor,
                );
              },
            ),
            const SizedBox(height: 16),
            if (_ehTratamento)
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Tratamento recorrente'),
                subtitle: const Text('Repete-se diariamente ou em dias específicos da semana'),
                value: _recorrente,
                onChanged: (valor) => setState(() => _recorrente = valor),
              ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(_ehTratamento && _recorrente ? 'Data e hora de início' : 'Data e hora'),
              subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(_dataHora)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _escolherDataHora,
            ),
            if (_ehTratamento && _recorrente) ...[
              const SizedBox(height: 16),
              Text('Dias da semana', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                'Não escolhas nenhum para repetir todos os dias.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Todos os dias'),
                    selected: _diasSemanaRecorrencia.isEmpty,
                    onSelected: (_) => setState(() => _diasSemanaRecorrencia = []),
                  ),
                  for (final dia in diasSemanaAbreviados.keys)
                    FilterChip(
                      label: Text(diasSemanaAbreviados[dia]!),
                      selected: _diasSemanaRecorrencia.contains(dia),
                      onSelected: (_) => _alternarDiaSemanaRecorrencia(dia),
                    ),
                ],
              ),
            ],
            if (!(_ehTratamento && _recorrente)) ...[
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title:
                    Text(_ehTratamento ? 'Próximo tratamento (opcional)' : 'Próxima consulta (opcional)'),
                subtitle: Text(
                  _proximaConsultaData != null
                      ? DateFormat('dd/MM/yyyy').format(_proximaConsultaData!)
                      : 'Sem data definida',
                ),
                trailing: _proximaConsultaData != null
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _proximaConsultaData = null),
                      )
                    : const Icon(Icons.calendar_today),
                onTap: _escolherProximaConsulta,
              ),
            ],
            const SizedBox(height: 16),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Lembrete ativo'),
              subtitle: Text(
                _ehTratamento && _recorrente
                    ? 'Avisa todos os dias (ou nos dias escolhidos) à hora definida'
                    : _ehTratamento
                        ? 'Avisa antes do tratamento e do próximo, se forem futuros'
                        : 'Avisa antes da consulta e da próxima consulta, se forem futuras',
              ),
              value: _lembreteAtivo,
              onChanged: (valor) => setState(() => _lembreteAtivo = valor),
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
