import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_frequencia_cardiaca.dart';
import '../providers/frequencia_cardiaca_providers.dart';
import '../services/faixa_frequencia_cardiaca.dart';
import 'medir_frequencia_cardiaca_screen.dart';

const _maxRegistosCondensados = 3;

/// Secção do perfil do idoso para medir e ver o histórico de frequência
/// cardíaca. Mostra só os últimos registos por omissão, com opção de
/// expandir para ver o histórico completo.
class FrequenciaCardiacaSection extends ConsumerStatefulWidget {
  const FrequenciaCardiacaSection({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<FrequenciaCardiacaSection> createState() => _FrequenciaCardiacaSectionState();
}

class _FrequenciaCardiacaSectionState extends ConsumerState<FrequenciaCardiacaSection> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    final registosAsync = ref.watch(frequenciaCardiacaListProvider(widget.idoso.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Frequência cardíaca',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                tooltip: 'Medir frequência cardíaca',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => MedirFrequenciaCardiacaScreen(idoso: widget.idoso)),
                ),
              ),
            ],
          ),
        ),
        registosAsync.when(
          data: (registos) {
            if (registos.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Ainda não há medições de frequência cardíaca.'),
              );
            }
            final mostrarExpandir = registos.length > _maxRegistosCondensados;
            final visiveis = _expandido ? registos : registos.take(_maxRegistosCondensados).toList();
            return Column(
              children: [
                for (final registo in visiveis) _FrequenciaCardiacaTile(idoso: widget.idoso, registo: registo),
                if (mostrarExpandir)
                  TextButton(
                    onPressed: () => setState(() => _expandido = !_expandido),
                    child: Text(_expandido ? 'Ver menos' : 'Ver histórico completo (${registos.length})'),
                  ),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (erro, _) => Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Erro ao carregar frequência cardíaca: $erro'),
          ),
        ),
      ],
    );
  }
}

class _FrequenciaCardiacaTile extends ConsumerWidget {
  const _FrequenciaCardiacaTile({required this.idoso, required this.registo});

  final Idoso idoso;
  final RegistoFrequenciaCardiaca registo;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar medição'),
        content: const Text('Queres mesmo apagar esta medição de frequência cardíaca?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Apagar')),
        ],
      ),
    );
    if (confirmar == true) {
      await ref.read(registoFrequenciaCardiacaRepositoryProvider).delete(registo.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataNascimento = idoso.dataNascimento;
    final idade = dataNascimento != null ? calcularIdadeAnos(dataNascimento) : null;
    final faixa = classificarFrequenciaCardiaca(registo.bpm, idadeAnos: idade);
    final cor = switch (faixa) {
      FaixaFrequenciaCardiaca.normal => Colors.green.shade700,
      FaixaFrequenciaCardiaca.baixa => Colors.amber.shade800,
      FaixaFrequenciaCardiaca.elevada => Colors.red.shade700,
    };

    return ListTile(
      leading: Icon(Icons.favorite, color: cor),
      title: Text('${registo.bpm} BPM · ${labelFaixaFrequenciaCardiaca(faixa)}'),
      subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(registo.timestamp)),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar medição',
        onPressed: () => _confirmarApagar(context, ref),
      ),
    );
  }
}
