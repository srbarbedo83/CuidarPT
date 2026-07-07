import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/info_profissional.dart';
import '../providers/consulta_providers.dart';
import '../providers/info_profissional_providers.dart';
import '../services/profissionais.dart';

/// Lista de médicos/enfermeiros já registados nas consultas e tratamentos
/// de um idoso — cresce automaticamente à medida que se vão preenchendo
/// nomes, sem precisar de os adicionar manualmente. O contacto, a
/// especialidade, a instituição e as notas de cada profissional podem ser
/// editados aqui.
class ProfissionaisScreen extends ConsumerWidget {
  const ProfissionaisScreen({super.key, required this.idoso});

  final Idoso idoso;

  Future<void> _editar(BuildContext context, WidgetRef ref, Profissional profissional) async {
    final especialidadeController = TextEditingController(text: profissional.especialidadeManual ?? '');
    final instituicaoController = TextEditingController(text: profissional.instituicao ?? '');
    final contactoController = TextEditingController(text: profissional.contacto ?? '');
    final notasController = TextEditingController(text: profissional.notas ?? '');

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(profissional.nome),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: especialidadeController,
                decoration: const InputDecoration(
                  labelText: 'Especialidade',
                  hintText: 'Ex.: Cardiologia',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: instituicaoController,
                decoration: const InputDecoration(
                  labelText: 'Instituição',
                  hintText: 'Ex.: Hospital, clínica, farmácia',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: contactoController,
                decoration: const InputDecoration(labelText: 'Contacto'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: notasController,
                decoration: const InputDecoration(labelText: 'Notas'),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Guardar')),
        ],
      ),
    );
    if (confirmar != true) return;

    final existente = await ref
        .read(infoProfissionalRepositoryProvider)
        .buscarPorNome(idoso.id, profissional.nome);
    final info = existente ?? (InfoProfissional()..idosoId = idoso.id..nome = profissional.nome);
    final especialidade = especialidadeController.text.trim();
    final instituicao = instituicaoController.text.trim();
    final contacto = contactoController.text.trim();
    final notas = notasController.text.trim();
    info
      ..especialidade = especialidade.isEmpty ? null : especialidade
      ..instituicao = instituicao.isEmpty ? null : instituicao
      ..contacto = contacto.isEmpty ? null : contacto
      ..notas = notas.isEmpty ? null : notas;
    await ref.read(infoProfissionalRepositoryProvider).save(info);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultas = ref.watch(consultaListProvider(idoso.id)).valueOrNull ?? const [];
    final infos = ref.watch(infoProfissionalListProvider(idoso.id)).valueOrNull ?? const [];
    final profissionais = profissionaisDoIdoso(consultas, infos: infos);

    return Scaffold(
      appBar: AppBar(title: const Text('Profissionais')),
      body: profissionais.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Ainda não há profissionais registados. Ficam aqui automaticamente '
                  'à medida que preenches o nome do médico/profissional numa consulta '
                  'ou tratamento.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView(
              children: [
                for (final profissional in profissionais)
                  ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: Text(profissional.nome),
                    subtitle: Text(
                      [
                        profissional.especialidades.join(', '),
                        if (profissional.instituicao != null) profissional.instituicao!,
                        if (profissional.contacto != null) profissional.contacto!,
                        if (profissional.notas != null) profissional.notas!,
                      ].join('\n'),
                    ),
                    isThreeLine: profissional.instituicao != null ||
                        profissional.contacto != null ||
                        profissional.notas != null,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (profissional.contacto != null && profissional.contacto!.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.phone_outlined),
                            tooltip: 'Ligar',
                            onPressed: () =>
                                launchUrl(Uri(scheme: 'tel', path: profissional.contacto)),
                          ),
                        const Icon(Icons.edit_outlined),
                      ],
                    ),
                    onTap: () => _editar(context, ref, profissional),
                  ),
              ],
            ),
    );
  }
}
