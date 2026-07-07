import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/idoso.dart';
import '../providers/idoso_providers.dart';

/// Secção de notas persistentes do idoso — informação que se mantém ao
/// longo dos dias (ex.: alergias, preferências, indicações gerais),
/// diferente dos registos datados de cuidados diários.
class NotasSection extends ConsumerStatefulWidget {
  const NotasSection({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<NotasSection> createState() => _NotasSectionState();
}

class _NotasSectionState extends ConsumerState<NotasSection> {
  bool _aEditar = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.idoso.notas ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    final texto = _controller.text.trim();
    widget.idoso.notas = texto.isEmpty ? null : texto;
    await ref.read(idosoRepositoryProvider).save(widget.idoso);
    if (mounted) setState(() => _aEditar = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Notas',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(_aEditar ? Icons.close : Icons.edit_outlined),
                tooltip: _aEditar ? 'Cancelar' : 'Editar notas',
                onPressed: () {
                  if (_aEditar) {
                    _controller.text = widget.idoso.notas ?? '';
                  }
                  setState(() => _aEditar = !_aEditar);
                },
              ),
            ],
          ),
          if (_aEditar) ...[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Alergias, preferências, indicações gerais...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              autofocus: true,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(onPressed: _guardar, child: const Text('Guardar')),
            ),
          ] else
            Text(
              (widget.idoso.notas ?? '').isEmpty ? 'Sem notas.' : widget.idoso.notas!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
