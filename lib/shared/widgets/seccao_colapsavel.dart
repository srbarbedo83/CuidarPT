import 'package:flutter/material.dart';

/// Secção com um cabeçalho (título + ações, ex.: adicionar) e um conteúdo
/// que pode ser minimizado, para não sobrecarregar o ecrã quando há muitas
/// entradas (medicação, consultas, sinais vitais, etc.).
class SeccaoColapsavel extends StatefulWidget {
  const SeccaoColapsavel({
    super.key,
    required this.titulo,
    required this.child,
    this.acoes = const [],
    this.expandidoPorOmissao = true,
  });

  final String titulo;
  final Widget child;
  final List<Widget> acoes;
  final bool expandidoPorOmissao;

  @override
  State<SeccaoColapsavel> createState() => _SeccaoColapsavelState();
}

class _SeccaoColapsavelState extends State<SeccaoColapsavel> {
  late var _expandido = widget.expandidoPorOmissao;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.titulo,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ...widget.acoes,
              IconButton(
                icon: Icon(_expandido ? Icons.expand_less : Icons.expand_more),
                tooltip: _expandido ? 'Minimizar' : 'Expandir',
                onPressed: () => setState(() => _expandido = !_expandido),
              ),
            ],
          ),
        ),
        if (_expandido) widget.child,
      ],
    );
  }
}
