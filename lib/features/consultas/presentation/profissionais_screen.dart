import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/idoso.dart';
import '../providers/consulta_providers.dart';
import '../services/profissionais.dart';

/// Lista de médicos/enfermeiros já registados nas consultas e tratamentos
/// de um idoso — cresce automaticamente à medida que se vão preenchendo
/// nomes, sem precisar de os adicionar manualmente.
class ProfissionaisScreen extends ConsumerWidget {
  const ProfissionaisScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultas = ref.watch(consultaListProvider(idoso.id)).valueOrNull ?? const [];
    final profissionais = profissionaisDoIdoso(consultas);

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
                    subtitle: Text(profissional.especialidades.join(', ')),
                  ),
              ],
            ),
    );
  }
}
