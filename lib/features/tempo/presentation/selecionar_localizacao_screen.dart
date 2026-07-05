import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/localidade_ipma.dart';
import '../providers/tempo_providers.dart';

class SelecionarLocalizacaoScreen extends ConsumerStatefulWidget {
  const SelecionarLocalizacaoScreen({super.key});

  @override
  ConsumerState<SelecionarLocalizacaoScreen> createState() => _SelecionarLocalizacaoScreenState();
}

class _SelecionarLocalizacaoScreenState extends ConsumerState<SelecionarLocalizacaoScreen> {
  final _filtroController = TextEditingController();
  var _filtro = '';

  @override
  void dispose() {
    _filtroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localidadesAsync = ref.watch(localidadesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Escolher localização')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _filtroController,
              decoration: const InputDecoration(
                labelText: 'Pesquisar distrito/ilha',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (valor) => setState(() => _filtro = valor.trim().toLowerCase()),
            ),
          ),
          Expanded(
            child: localidadesAsync.when(
              data: (localidades) {
                final filtradas = _filtro.isEmpty
                    ? localidades
                    : localidades.where((l) => l.nome.toLowerCase().contains(_filtro)).toList();
                if (filtradas.isEmpty) {
                  return const Center(child: Text('Sem resultados.'));
                }
                return ListView.builder(
                  itemCount: filtradas.length,
                  itemBuilder: (context, indice) => _LocalidadeTile(localidade: filtradas[indice]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (erro, _) => Center(child: Text('Não foi possível obter a lista: $erro')),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocalidadeTile extends ConsumerWidget {
  const _LocalidadeTile({required this.localidade});

  final LocalidadeIpma localidade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(localidade.nome),
      onTap: () async {
        await ref.read(localizacaoSelecionadaRepositoryProvider).selecionar(localidade);
        if (context.mounted) Navigator.of(context).pop();
      },
    );
  }
}
