import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/contacto_cuidador.dart';
import '../providers/contacto_cuidador_providers.dart';

/// Secção em Definições para gerir a lista local de contactos de outros
/// cuidadores, usada para escolher destinatários ao partilhar um relatório.
class ContactosCuidadoresSection extends ConsumerWidget {
  const ContactosCuidadoresSection({super.key});

  Future<void> _adicionar(BuildContext context, WidgetRef ref) async {
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo contacto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
              textCapitalization: TextCapitalization.words,
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Guardar')),
        ],
      ),
    );
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    if (confirmar != true || nome.isEmpty || email.isEmpty) return;

    final contacto = ContactoCuidador()
      ..nome = nome
      ..email = email;
    await ref.read(contactoCuidadorRepositoryProvider).save(contacto);
  }

  Future<void> _apagar(WidgetRef ref, ContactoCuidador contacto) {
    return ref.read(contactoCuidadorRepositoryProvider).delete(contacto.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactosAsync = ref.watch(contactoCuidadorListProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Contactos de cuidadores', style: Theme.of(context).textTheme.titleMedium),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar contacto',
                  onPressed: () => _adicionar(context, ref),
                ),
              ],
            ),
            Text(
              'Usados para escolher rapidamente com quem partilhar um relatório.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            contactosAsync.when(
              data: (contactos) {
                if (contactos.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Ainda não há contactos guardados.'),
                  );
                }
                return Column(
                  children: contactos
                      .map(
                        (contacto) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(contacto.nome),
                          subtitle: Text(contacto.email),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            tooltip: 'Apagar contacto',
                            onPressed: () => _apagar(ref, contacto),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (erro, _) => Text('Erro ao carregar contactos: $erro'),
            ),
          ],
        ),
      ),
    );
  }
}
