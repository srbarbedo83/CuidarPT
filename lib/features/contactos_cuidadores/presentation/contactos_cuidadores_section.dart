import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/contacto_cuidador.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/contacto_cuidador_providers.dart';

/// Secção em Definições para gerir a lista local de contactos de outros
/// cuidadores, usada para escolher destinatários ao partilhar um relatório.
class ContactosCuidadoresSection extends ConsumerWidget {
  const ContactosCuidadoresSection({super.key});

  Future<void> _adicionar(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.contactosCuidadoresNovoTitulo),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: l10n.comumNome),
              textCapitalization: TextCapitalization.words,
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: l10n.comumEmail),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.comumCancelar)),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.comumGuardar)),
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
    final l10n = AppLocalizations.of(context);
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
                  child: Text(l10n.contactosCuidadoresTitulo, style: Theme.of(context).textTheme.titleMedium),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: l10n.contactosCuidadoresAdicionarTooltip,
                  onPressed: () => _adicionar(context, ref),
                ),
              ],
            ),
            Text(
              l10n.contactosCuidadoresDescricao,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            contactosAsync.when(
              data: (contactos) {
                if (contactos.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(l10n.contactosCuidadoresSemContactos),
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
                            tooltip: l10n.contactosCuidadoresApagarTooltip,
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
              error: (erro, _) => Text(l10n.contactosCuidadoresErro('$erro')),
            ),
          ],
        ),
      ),
    );
  }
}
