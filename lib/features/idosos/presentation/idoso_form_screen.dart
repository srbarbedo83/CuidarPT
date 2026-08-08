import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/contacto_emergencia.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/preferencias_idoso.dart';
import '../../../shared/widgets/premium_upsell.dart';
import '../../subscricao/feature_limits.dart';
import '../providers/idoso_providers.dart';

class _ContactoControllers {
  _ContactoControllers({String? nome, String? telefone})
      : nomeController = TextEditingController(text: nome),
        telefoneController = TextEditingController(text: telefone);

  final TextEditingController nomeController;
  final TextEditingController telefoneController;

  void dispose() {
    nomeController.dispose();
    telefoneController.dispose();
  }
}

/// Ecrã de criação/edição do perfil de um idoso.
///
/// Se [idoso] for `null`, cria um novo registo; caso contrário, edita o
/// registo existente (mesmo `id`, mantém `criadoEm`).
class IdosoFormScreen extends ConsumerStatefulWidget {
  const IdosoFormScreen({super.key, this.idoso});

  final Idoso? idoso;

  @override
  ConsumerState<IdosoFormScreen> createState() => _IdosoFormScreenState();
}

class _IdosoFormScreenState extends ConsumerState<IdosoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late final List<_ContactoControllers> _contactos;
  late final TextEditingController _notasController;
  late final TextEditingController _comidaPreferidaController;
  late final TextEditingController _musicaController;
  late final TextEditingController _interessesController;

  DateTime? _dataNascimento;
  Sexo? _sexo;
  String? _fotoPath;
  bool _mobilidadeReduzida = false;
  bool _acamado = false;
  bool _rotinasAtivas = false;
  bool _aGuardar = false;

  bool get _aEditar => widget.idoso != null;

  @override
  void initState() {
    super.initState();
    final idoso = widget.idoso;
    _nomeController = TextEditingController(text: idoso?.nome ?? '');
    _contactos = (idoso?.contactosEmergencia ?? [])
        .map((c) => _ContactoControllers(nome: c.nome, telefone: c.telefone))
        .toList();
    if (_contactos.isEmpty) _contactos.add(_ContactoControllers());
    _notasController = TextEditingController(text: idoso?.notas ?? '');
    _comidaPreferidaController =
        TextEditingController(text: idoso?.preferencias?.comidaPreferida ?? '');
    _musicaController = TextEditingController(text: idoso?.preferencias?.musica ?? '');
    _interessesController = TextEditingController(text: idoso?.preferencias?.interesses ?? '');
    _dataNascimento = idoso?.dataNascimento;
    _sexo = idoso?.sexo;
    _fotoPath = idoso?.fotoPath;
    _mobilidadeReduzida = idoso?.mobilidadeReduzida ?? false;
    _acamado = idoso?.acamado ?? false;
    _rotinasAtivas = idoso?.rotinasAtivas ?? false;
  }

  Future<void> _alternarRotinas(bool valor) async {
    if (valor && !ref.read(featureLimitsProvider).permiteRotinas) {
      await mostrarLimiteAtingido(
        context,
        mensagem: 'A rotina de higiene e alimentação é uma funcionalidade Premium. '
            'Subscreve o Premium para a ativares.',
      );
      return;
    }
    setState(() => _rotinasAtivas = valor);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    for (final contacto in _contactos) {
      contacto.dispose();
    }
    _notasController.dispose();
    _comidaPreferidaController.dispose();
    _musicaController.dispose();
    _interessesController.dispose();
    super.dispose();
  }

  void _adicionarContacto() {
    setState(() => _contactos.add(_ContactoControllers()));
  }

  void _removerContacto(int indice) {
    setState(() => _contactos.removeAt(indice).dispose());
  }

  Future<void> _escolherFoto() async {
    final ficheiro = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1280,
      imageQuality: 85,
    );
    if (ficheiro == null || !mounted) return;
    final caminhoAnterior = _fotoPath;
    final caminhoGuardado = await PhotoStorage.guardarFotoIdoso(File(ficheiro.path));
    if (!mounted) return;
    setState(() => _fotoPath = caminhoGuardado);
    await PhotoStorage.apagarFoto(caminhoAnterior);
  }

  Future<void> _escolherDataNascimento() async {
    final agora = DateTime.now();
    final escolhida = await showDatePicker(
      context: context,
      initialDate: _dataNascimento ?? DateTime(agora.year - 75, agora.month, agora.day),
      firstDate: DateTime(1900),
      lastDate: agora,
      helpText: 'Data de nascimento',
    );
    if (escolhida != null) {
      setState(() => _dataNascimento = escolhida);
    }
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _aGuardar = true);

    final agora = DateTime.now();
    final idoso = widget.idoso ?? Idoso();
    final notas = _notasController.text.trim();
    final comidaPreferida = _comidaPreferidaController.text.trim();
    final musica = _musicaController.text.trim();
    final interesses = _interessesController.text.trim();
    final preferencias = (comidaPreferida.isEmpty && musica.isEmpty && interesses.isEmpty)
        ? null
        : (PreferenciasIdoso()
          ..comidaPreferida = comidaPreferida.isEmpty ? null : comidaPreferida
          ..musica = musica.isEmpty ? null : musica
          ..interesses = interesses.isEmpty ? null : interesses);
    final contactos = _contactos
        .map((c) {
          final nome = c.nomeController.text.trim();
          final telefone = c.telefoneController.text.trim();
          return ContactoEmergencia()
            ..nome = nome.isEmpty ? null : nome
            ..telefone = telefone.isEmpty ? null : telefone;
        })
        .where((c) => c.nome != null || c.telefone != null)
        .toList();
    idoso
      ..nome = _nomeController.text.trim()
      ..sexo = _sexo
      ..dataNascimento = _dataNascimento
      ..fotoPath = _fotoPath
      ..mobilidadeReduzida = _mobilidadeReduzida
      ..acamado = _acamado
      ..preferencias = preferencias
      ..rotinasAtivas = _rotinasAtivas
      ..contactosEmergencia = contactos
      ..notas = notas.isEmpty ? null : notas
      ..atualizadoEm = agora;
    if (!_aEditar) {
      idoso.criadoEm = agora;
    }

    await ref.read(idosoRepositoryProvider).save(idoso);

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_aEditar ? 'Editar perfil' : 'Novo perfil de idoso')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
          children: [
            _CartaoSeccao(
              titulo: 'Identificação',
              icone: Icons.badge_outlined,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _escolherFoto,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: _fotoPath != null ? FileImage(File(_fotoPath!)) : null,
                          child: _fotoPath == null ? const Icon(Icons.add_a_photo, size: 32) : null,
                        ),
                        if (_mobilidadeReduzida)
                          Positioned(
                            right: -4,
                            bottom: -4,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              child: const Icon(Icons.accessible, color: Colors.white, size: 18),
                            ),
                          ),
                        if (_acamado)
                          Positioned(
                            left: -4,
                            bottom: -4,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              child: const Icon(Icons.bed, color: Colors.white, size: 18),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.accessible),
                  title: const Text('Mobilidade reduzida'),
                  value: _mobilidadeReduzida,
                  onChanged: (valor) => setState(() => _mobilidadeReduzida = valor),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.bed_outlined),
                  title: const Text('Acamado'),
                  value: _acamado,
                  onChanged: (valor) => setState(() => _acamado = valor),
                ),
                const SizedBox(height: 16),
                Text('Sexo', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                SegmentedButton<Sexo>(
                  segments: const [
                    ButtonSegment(value: Sexo.masculino, label: Text('Masculino')),
                    ButtonSegment(value: Sexo.feminino, label: Text('Feminino')),
                  ],
                  selected: _sexo == null ? {} : {_sexo!},
                  emptySelectionAllowed: true,
                  onSelectionChanged: (selecao) =>
                      setState(() => _sexo = selecao.isEmpty ? null : selecao.first),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome *'),
                  textCapitalization: TextCapitalization.words,
                  validator: (valor) =>
                      (valor == null || valor.trim().isEmpty) ? 'Indica o nome do idoso' : null,
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Data de nascimento'),
                  subtitle: Text(
                    _dataNascimento != null
                        ? DateFormat('dd/MM/yyyy').format(_dataNascimento!)
                        : 'Não definida',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: _escolherDataNascimento,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _CartaoSeccao(
              titulo: 'Contactos de emergência',
              icone: Icons.emergency_outlined,
              corTitulo: Colors.red.shade700,
              children: [
                for (var indice = 0; indice < _contactos.length; indice++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _contactos[indice].nomeController,
                                decoration: const InputDecoration(labelText: 'Nome'),
                                textCapitalization: TextCapitalization.words,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _contactos[indice].telefoneController,
                                decoration: const InputDecoration(labelText: 'Telefone'),
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                        if (_contactos.length > 1)
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            tooltip: 'Remover contacto',
                            onPressed: () => _removerContacto(indice),
                          ),
                      ],
                    ),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _adicionarContacto,
                    icon: const Icon(Icons.add),
                    label: const Text('Adicionar contacto'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _CartaoSeccao(
              titulo: 'Saúde',
              icone: Icons.health_and_safety_outlined,
              children: [
                TextFormField(
                  controller: _notasController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (alergias, condições de saúde)',
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _CartaoSeccao(
              titulo: 'Preferências e hábitos',
              icone: Icons.favorite_outline,
              children: [
                TextFormField(
                  controller: _comidaPreferidaController,
                  decoration: const InputDecoration(
                    labelText: 'Comida preferida',
                    prefixIcon: Icon(Icons.restaurant_outlined),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _musicaController,
                  decoration: const InputDecoration(
                    labelText: 'Música',
                    prefixIcon: Icon(Icons.music_note_outlined),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _interessesController,
                  decoration: const InputDecoration(
                    labelText: 'Interesses pessoais',
                    prefixIcon: Icon(Icons.interests_outlined),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Rotina de higiene, alimentação e sono'),
                  subtitle: const Text(
                    'Funcionalidade Premium. Regista itens recorrentes (ex.: banho, '
                    'refeições, sesta) e marca-os como feitos no dia.',
                  ),
                  value: _rotinasAtivas,
                  onChanged: _alternarRotinas,
                ),
              ],
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

/// Caixa visual para agrupar um conjunto de campos do formulário por tipo
/// (identificação, contactos de emergência, saúde, preferências), com um
/// ícone e título no topo.
class _CartaoSeccao extends StatelessWidget {
  const _CartaoSeccao({
    required this.titulo,
    required this.children,
    this.icone,
    this.corTitulo,
  });

  final String titulo;
  final List<Widget> children;
  final IconData? icone;
  final Color? corTitulo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                if (icone != null) ...[
                  Icon(icone, color: corTitulo, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: corTitulo,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}
