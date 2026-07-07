import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/photo_storage.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_documento.dart';
import '../providers/documento_providers.dart';

/// Secção do perfil do idoso para guardar fotografias de receitas e exames.
/// Os ficheiros ficam só na pasta privada da app, nunca saem do telemóvel.
class DocumentosSection extends ConsumerWidget {
  const DocumentosSection({super.key, required this.idoso});

  final Idoso idoso;

  Future<void> _adicionar(BuildContext context, WidgetRef ref) async {
    final origem = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Tirar fotografia'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Escolher da galeria'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (origem == null || !context.mounted) return;

    final ficheiro = await ImagePicker().pickImage(source: origem, maxWidth: 2000, imageQuality: 90);
    if (ficheiro == null || !context.mounted) return;

    final titulo = await _pedirTitulo(context);
    if (titulo == null || !context.mounted) return;

    final caminho = await PhotoStorage.guardarDocumentoIdoso(File(ficheiro.path));
    final agora = DateTime.now();
    final tituloFinal = titulo.trim();
    final documento = RegistoDocumento()
      ..idosoId = idoso.id
      ..titulo = tituloFinal.isEmpty ? 'Documento ${DateFormat('dd/MM/yyyy').format(agora)}' : tituloFinal
      ..caminhoFicheiro = caminho
      ..criadoEm = agora;

    await ref.read(registoDocumentoRepositoryProvider).save(documento);
  }

  Future<String?> _pedirTitulo(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nome do documento'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Ex.: Receita Dr. Silva, Análises 2026'),
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Future<void> _apagar(BuildContext context, WidgetRef ref, RegistoDocumento documento) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar documento'),
        content: Text('Queres mesmo apagar "${documento.titulo}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar != true) return;
    await ref.read(registoDocumentoRepositoryProvider).delete(documento.id);
    await PhotoStorage.apagarFoto(documento.caminhoFicheiro);
  }

  void _ver(BuildContext context, RegistoDocumento documento) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(documento.titulo)),
          body: Center(
            child: InteractiveViewer(child: Image.file(File(documento.caminhoFicheiro))),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentos = ref.watch(documentoListProvider(idoso.id)).valueOrNull ?? const [];

    return ExpansionTile(
      title: Text(
        'Documentos',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(documentos.isEmpty ? 'Nenhum documento' : '${documentos.length} documentos'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Receitas e exames guardados apenas neste telemóvel.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Adicionar documento',
                onPressed: () => _adicionar(context, ref),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (documentos.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Ainda não há documentos guardados.'),
          )
        else
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: documentos.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, indice) {
                final documento = documentos[indice];
                return GestureDetector(
                  onTap: () => _ver(context, documento),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(documento.caminhoFicheiro),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: -8,
                            top: -8,
                            child: IconButton(
                              icon: const Icon(Icons.cancel, size: 20),
                              tooltip: 'Apagar documento',
                              onPressed: () => _apagar(context, ref, documento),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          documento.titulo,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
