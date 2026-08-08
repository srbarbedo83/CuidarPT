import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/consulta_opcoes.dart';
import '../../../core/utils/horarios.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    final data = await showDatePicker(
      context: context,
      initialDate: _dataHora,
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 5),
      helpText: l10n.consultaFormDataConsulta,
    );
    if (data == null || !mounted) return;

    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dataHora),
      helpText: l10n.consultaFormHoraConsulta,
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
    final l10n = AppLocalizations.of(context);
    final agora = DateTime.now();
    final escolhida = await showDatePicker(
      context: context,
      initialDate: _proximaConsultaData ?? agora,
      firstDate: DateTime(2000),
      lastDate: DateTime(agora.year + 5),
      helpText: l10n.idosoDetailProximaConsulta,
    );
    if (escolhida != null) {
      setState(() => _proximaConsultaData = escolhida);
    }
  }

  Future<void> _guardar() async {
    final l10n = AppLocalizations.of(context);
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
    await ConsultaScheduler.reagendar(consulta, nomeIdoso: widget.idoso.nome, l10n: l10n);
    await repository.save(consulta);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tituloEcra = _aEditar
        ? (_ehTratamento ? l10n.consultaFormEditarTratamento : l10n.consultaFormEditarConsulta)
        : (_ehTratamento ? l10n.consultaFormNovoTratamento : l10n.consultaFormNovaConsulta);
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
              segments: [
                ButtonSegment(
                  value: TipoRegistoConsulta.consulta,
                  label: Text(l10n.consultaFormTipoConsultaMedica),
                ),
                ButtonSegment(value: TipoRegistoConsulta.tratamento, label: Text(l10n.consultaFormTipoTratamento)),
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
                    labelText: _ehTratamento ? l10n.consultaFormTipoTratamentoLabel : l10n.consultaFormEspecialidadeLabel,
                    hintText: _ehTratamento ? l10n.consultaFormTipoTratamentoHint : l10n.consultaFormEspecialidadeHint,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (valor) => _especialidade = valor,
                  validator: (valor) => (valor == null || valor.trim().isEmpty)
                      ? (_ehTratamento ? l10n.consultaFormTipoTratamentoErro : l10n.consultaFormEspecialidadeErro)
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
                  decoration: InputDecoration(
                    labelText: l10n.consultaFormLocal,
                    hintText: l10n.consultaFormLocalHint,
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
                    labelText: _ehTratamento ? l10n.consultaFormProfissional : l10n.consultaFormNomeMedico,
                    hintText: _ehTratamento ? l10n.consultaFormProfissionalHint : l10n.consultaFormNomeMedicoHint,
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
                title: Text(l10n.consultaFormTratamentoRecorrente),
                subtitle: Text(l10n.consultaFormTratamentoRecorrenteDescricao),
                value: _recorrente,
                onChanged: (valor) => setState(() => _recorrente = valor),
              ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(_ehTratamento && _recorrente ? l10n.consultaFormDataHoraInicio : l10n.consultaFormDataHora),
              subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(_dataHora)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _escolherDataHora,
            ),
            if (_ehTratamento && _recorrente) ...[
              const SizedBox(height: 16),
              Text(l10n.medicacaoFormDiasSemanaTitulo, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                l10n.consultaFormDiasSemanaDescricao,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: Text(l10n.horariosTodosDias),
                    selected: _diasSemanaRecorrencia.isEmpty,
                    onSelected: (_) => setState(() => _diasSemanaRecorrencia = []),
                  ),
                  for (final dia in diasSemanaAbreviados(l10n).keys)
                    FilterChip(
                      label: Text(diasSemanaAbreviados(l10n)[dia]!),
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
                title: Text(
                  _ehTratamento ? l10n.consultaFormProximoTratamento : l10n.consultaFormProximaConsultaOpcional,
                ),
                subtitle: Text(
                  _proximaConsultaData != null
                      ? DateFormat('dd/MM/yyyy').format(_proximaConsultaData!)
                      : l10n.medicacaoFormSemDataDefinida,
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
              title: Text(l10n.consultaFormLembreteAtivo),
              subtitle: Text(
                _ehTratamento && _recorrente
                    ? l10n.consultaFormLembreteRecorrente
                    : _ehTratamento
                        ? l10n.consultaFormLembreteTratamento
                        : l10n.consultaFormLembreteConsulta,
              ),
              value: _lembreteAtivo,
              onChanged: (valor) => setState(() => _lembreteAtivo = valor),
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
      ),
    );
  }
}
