import 'package:flutter/material.dart';

import '../../../data/models/idoso.dart';
import '../services/faixa_frequencia_cardiaca.dart';
import '../services/medicao_ppg_camera.dart';
import '../services/processador_ppg.dart';

/// Mede a frequência cardíaca pela câmara e devolve o BPM obtido (via
/// [Navigator.pop]) para quem chamou preencher — usado a partir do
/// formulário de Sinais Vitais, não guarda nada sozinho.
class MedirFrequenciaCardiacaScreen extends StatefulWidget {
  const MedirFrequenciaCardiacaScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  State<MedirFrequenciaCardiacaScreen> createState() => _MedirFrequenciaCardiacaScreenState();
}

class _MedirFrequenciaCardiacaScreenState extends State<MedirFrequenciaCardiacaScreen> {
  MedicaoPpgCamera? _fonte;
  ResultadoPpg _resultado = const ResultadoPpg.semDedo();

  @override
  void initState() {
    super.initState();
    _iniciarMedicao();
  }

  @override
  void dispose() {
    _fonte?.parar();
    super.dispose();
  }

  void _iniciarMedicao() {
    final fonte = MedicaoPpgCamera();
    _fonte = fonte;
    fonte.iniciar().listen((resultado) {
      if (!mounted) return;
      setState(() => _resultado = resultado);
    });
  }

  Future<void> _reiniciar() async {
    await _fonte?.parar();
    if (!mounted) return;
    setState(() => _resultado = const ResultadoPpg.semDedo());
    _iniciarMedicao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medir frequência cardíaca')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: _conteudo(context)),
      ),
    );
  }

  Widget _conteudo(BuildContext context) {
    switch (_resultado.status) {
      case StatusPpg.semDedo:
        return _aguardandoDedo(context);
      case StatusPpg.aMedir:
        return _aMedir(context, _resultado.progresso ?? 0);
      case StatusPpg.concluido:
        return _resultadoWidget(context);
      case StatusPpg.erro:
        return _erroWidget(context, _resultado.mensagemErro ?? 'Ocorreu um erro.');
    }
  }

  Widget _aguardandoDedo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.touch_app_outlined, size: 96, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 24),
        Text(
          'Coloca a ponta do dedo, bem esticado, a tapar completamente a lente da câmara traseira e o flash.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'A app não é um dispositivo médico — o valor é apenas informativo.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _aMedir(BuildContext context, double progresso) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(value: progresso, strokeWidth: 6),
              Icon(Icons.favorite, size: 48, color: Theme.of(context).colorScheme.primary),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'A medir... mantém o dedo parado sobre a câmara.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _resultadoWidget(BuildContext context) {
    final bpm = _resultado.bpm!;
    final dataNascimento = widget.idoso.dataNascimento;
    final idade = dataNascimento != null ? calcularIdadeAnos(dataNascimento) : null;
    final faixa = classificarFrequenciaCardiaca(bpm, idadeAnos: idade);
    final cor = switch (faixa) {
      FaixaFrequenciaCardiaca.normal => Colors.green.shade700,
      FaixaFrequenciaCardiaca.baixa => Colors.amber.shade800,
      FaixaFrequenciaCardiaca.elevada => Colors.red.shade700,
    };

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Frequência cardíaca', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          '$bpm BPM',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Chip(
          label: Text(
            labelFaixaFrequenciaCardiaca(faixa),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: cor,
        ),
        const SizedBox(height: 16),
        Text(
          'Este valor é apenas informativo e não é um diagnóstico. Em caso de dúvida '
          'ou sintomas, consulta um profissional de saúde.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => Navigator.of(context).pop(bpm),
          icon: const Icon(Icons.check),
          label: const Text('Usar este valor'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: _reiniciar,
          child: const Text('Medir novamente'),
        ),
      ],
    );
  }

  Widget _erroWidget(BuildContext context, String mensagem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 16),
        Text(mensagem, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: _reiniciar,
          icon: const Icon(Icons.refresh),
          label: const Text('Tentar novamente'),
        ),
      ],
    );
  }
}
