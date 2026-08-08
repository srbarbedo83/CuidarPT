import 'package:flutter/material.dart';

import '../../../data/models/idoso.dart';
import '../../../l10n/app_localizations.dart';
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
      appBar: AppBar(title: Text(AppLocalizations.of(context).freqCardiacaTitulo)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: _conteudo(context)),
      ),
    );
  }

  Widget _conteudo(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (_resultado.status) {
      case StatusPpg.semDedo:
        return _aguardandoDedo(context);
      case StatusPpg.aMedir:
        return _aMedir(context, _resultado.progresso ?? 0);
      case StatusPpg.concluido:
        return _resultadoWidget(context);
      case StatusPpg.erro:
        return _erroWidget(context, _resultado.mensagemErro ?? l10n.freqCardiacaErroGenerico);
    }
  }

  Widget _aguardandoDedo(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.touch_app_outlined, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            l10n.freqCardiacaComoMedir,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.freqCardiacaInstrucoesIntro,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 12),
          _passo(context, '1', l10n.freqCardiacaPasso1),
          _passo(context, '2', l10n.freqCardiacaPasso2),
          _passo(context, '3', l10n.freqCardiacaPasso3),
          _passo(context, '4', l10n.freqCardiacaPasso4),
          const SizedBox(height: 20),
          _cartaoDicas(context),
          const SizedBox(height: 16),
          Text(
            l10n.freqCardiacaAvisoNaoMedico,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _passo(BuildContext context, String numero, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              numero,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(texto, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _cartaoDicas(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  l10n.freqCardiacaDicasTitulo,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              l10n.freqCardiacaDicasTexto,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
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
          AppLocalizations.of(context).freqCardiacaAMedir,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _resultadoWidget(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
        Text(l10n.freqCardiacaResultadoTitulo, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          '$bpm BPM',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Chip(
          label: Text(
            labelFaixaFrequenciaCardiaca(l10n, faixa),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: cor,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.freqCardiacaAvisoResultado,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => Navigator.of(context).pop(bpm),
          icon: const Icon(Icons.check),
          label: Text(l10n.freqCardiacaUsarValor),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: _reiniciar,
          child: Text(l10n.freqCardiacaMedirNovamente),
        ),
      ],
    );
  }

  Widget _erroWidget(BuildContext context, String mensagem) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 16),
          Text(mensagem, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 20),
          _cartaoDicas(context),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _reiniciar,
            icon: const Icon(Icons.refresh),
            label: Text(AppLocalizations.of(context).freqCardiacaTentarNovamente),
          ),
        ],
      ),
    );
  }
}
