import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../providers/idoso_providers.dart';

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
  late final TextEditingController _contactoNomeController;
  late final TextEditingController _contactoTelefoneController;
  late final TextEditingController _notasController;

  DateTime? _dataNascimento;
  String? _fotoPath;
  bool _aGuardar = false;

  bool get _aEditar => widget.idoso != null;

  @override
  void initState() {
    super.initState();
    final idoso = widget.idoso;
    _nomeController = TextEditingController(text: idoso?.nome ?? '');
    _contactoNomeController = TextEditingController(text: idoso?.contactoEmergenciaNome ?? '');
    _contactoTelefoneController =
        TextEditingController(text: idoso?.contactoEmergenciaTelefone ?? '');
    _notasController = TextEditingController(text: idoso?.notas ?? '');
    _dataNascimento = idoso?.dataNascimento;
    _fotoPath = idoso?.fotoPath;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _contactoNomeController.dispose();
    _contactoTelefoneController.dispose();
    _notasController.dispose();
    super.dispose();
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
    final contactoNome = _contactoNomeController.text.trim();
    final contactoTelefone = _contactoTelefoneController.text.trim();
    final notas = _notasController.text.trim();
    idoso
      ..nome = _nomeController.text.trim()
      ..dataNascimento = _dataNascimento
      ..fotoPath = _fotoPath
      ..contactoEmergenciaNome = contactoNome.isEmpty ? null : contactoNome
      ..contactoEmergenciaTelefone = contactoTelefone.isEmpty ? null : contactoTelefone
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
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: GestureDetector(
                onTap: _escolherFoto,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: _fotoPath != null ? FileImage(File(_fotoPath!)) : null,
                  child: _fotoPath == null ? const Icon(Icons.add_a_photo, size: 32) : null,
                ),
              ),
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 16),
            TextFormField(
              controller: _contactoNomeController,
              decoration: const InputDecoration(labelText: 'Contacto de emergência — nome'),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contactoTelefoneController,
              decoration: const InputDecoration(labelText: 'Contacto de emergência — telefone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notasController,
              decoration: const InputDecoration(
                labelText: 'Notas (alergias, condições de saúde)',
              ),
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
