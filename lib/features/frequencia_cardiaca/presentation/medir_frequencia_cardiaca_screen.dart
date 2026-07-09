import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/idoso.dart';
import '../../../data/models/registo_frequencia_cardiaca.dart';
import '../providers/frequencia_cardiaca_providers.dart';
import '../services/faixa_frequencia_cardiaca.dart';
import '../services/medicao_ppg_camera.dart';
import '../services/processador_ppg.dart';

class MedirFrequenciaCardiacaScreen extends ConsumerStatefulWidget {
  const MedirFrequenciaCardiacaScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<MedirFrequenciaCardiacaScreen> createState() => _MedirFrequenciaCardiacaScreenState();
}

class _MedirFrequenciaCardiacaScreenState extends ConsumerState<MedirFrequenciaCardiacaScreen> {
  MedicaoPpgCamera? _fonte;
  ResultadoPpg _resultado = const ResultadoPpg.semDedo();
  bool _aGuardar = false;

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

  Future<void> _guardar() async {
    final bpm = _resultado.bpm;
    if (bpm == null) return;
    setState(() => _aGuardar = true);
    final registo = RegistoFrequenciaCardiaca()
      ..idosoId = widget.idoso.id
      ..bpm = bpm
      ..fonte = FonteFrequenciaCardiaca.camera
      ..timestamp = DateTime.now();
    await ref.read(registoFrequenciaCardiacaRepositoryProvider).save(registo);
    if (mounted) Navigator.of(context).pop();
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
          onPressed: _aGuardar ? null : _guardar,
          icon: _aGuardar
              ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.save_outlined),
          label: const Text('Guardar no histórico'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: _aGuardar ? null : _reiniciar,
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
