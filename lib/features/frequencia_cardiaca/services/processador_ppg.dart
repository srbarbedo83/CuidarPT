import 'dart:math';

/// Uma amostra de luminosidade captada da câmara num dado instante,
/// relativo ao início da medição.
class AmostraPpg {
  const AmostraPpg({required this.tempo, required this.intensidade});

  final Duration tempo;

  /// Luminosidade média do frame (0-255): com o dedo e o flash a cobrir a
  /// lente, sobe e desce ligeiramente a cada batimento (fotopletismografia).
  final double intensidade;
}

enum StatusPpg { semDedo, aMedir, concluido, erro }

/// Resultado do processamento num dado momento: ou ainda está à espera de
/// deteção estável, ou a meio da janela de medição, ou já tem um BPM, ou
/// falhou.
class ResultadoPpg {
  const ResultadoPpg._(this.status, {this.progresso, this.bpm, this.mensagemErro});

  const ResultadoPpg.semDedo() : this._(StatusPpg.semDedo);
  const ResultadoPpg.aMedir(double progresso) : this._(StatusPpg.aMedir, progresso: progresso);
  const ResultadoPpg.concluido(int bpm) : this._(StatusPpg.concluido, bpm: bpm);
  const ResultadoPpg.erro(String mensagem) : this._(StatusPpg.erro, mensagemErro: mensagem);

  final StatusPpg status;
  final double? progresso;
  final int? bpm;
  final String? mensagemErro;
}

/// Processa uma série de amostras de luminosidade da câmara para estimar
/// os batimentos por minuto (BPM), por fotopletismografia (PPG): deteta se
/// há um dedo a tapar a lente, acumula amostras durante uma janela mínima
/// e conta os picos do sinal para calcular o BPM.
///
/// É uma classe puramente algorítmica — não sabe nada sobre câmaras nem
/// permissões, só recebe [AmostraPpg] já extraídas de cada frame. Isto
/// permite testar a deteção/cálculo sem hardware nenhum.
class ProcessadorPpg {
  ProcessadorPpg({this.janelaMinima = const Duration(seconds: 12)});

  final Duration janelaMinima;
  final List<AmostraPpg> _amostras = [];

  static const _limiarIntensidadeDedo = 60.0;
  static const _amostrasParaDeteccao = 5;
  static const _bpmMinimo = 30;
  static const _bpmMaximo = 220;

  void adicionarAmostra(AmostraPpg amostra) {
    _amostras.add(amostra);
  }

  void reiniciar() {
    _amostras.clear();
  }

  bool get temDedoDetetado {
    if (_amostras.length < _amostrasParaDeteccao) return false;
    final recentes = _amostras.sublist(_amostras.length - _amostrasParaDeteccao);
    final media = recentes.map((a) => a.intensidade).reduce((a, b) => a + b) / recentes.length;
    return media > _limiarIntensidadeDedo;
  }

  ResultadoPpg calcularResultado() {
    if (!temDedoDetetado) return const ResultadoPpg.semDedo();

    final duracao = _amostras.last.tempo - _amostras.first.tempo;
    if (duracao < janelaMinima) {
      final progresso = duracao.inMilliseconds / janelaMinima.inMilliseconds;
      return ResultadoPpg.aMedir(progresso.clamp(0.0, 1.0));
    }

    final suavizadas = _suavizar(_amostras);
    final picos = _detetarPicos(suavizadas);
    if (picos.length < 3) {
      return const ResultadoPpg.erro(
        'Sinal instável. Mantém o dedo bem esticado e parado sobre a câmara e tenta novamente.',
      );
    }

    final intervalos = <int>[];
    for (var i = 1; i < picos.length; i++) {
      intervalos.add((picos[i].tempo - picos[i - 1].tempo).inMilliseconds);
    }
    final intervaloMedio = intervalos.reduce((a, b) => a + b) / intervalos.length;
    if (intervaloMedio <= 0) {
      return const ResultadoPpg.erro('Não foi possível calcular um resultado fiável. Tenta novamente.');
    }

    final bpm = (60000 / intervaloMedio).round();
    if (bpm < _bpmMinimo || bpm > _bpmMaximo) {
      return const ResultadoPpg.erro('Não foi possível obter uma leitura fiável. Tenta novamente.');
    }

    return ResultadoPpg.concluido(bpm);
  }

  /// Média móvel simples para reduzir ruído de alta frequência do sensor.
  List<AmostraPpg> _suavizar(List<AmostraPpg> amostras, {int janela = 3}) {
    if (amostras.length <= janela) return amostras;
    final resultado = <AmostraPpg>[];
    for (var i = 0; i < amostras.length; i++) {
      final inicio = (i - janela ~/ 2).clamp(0, amostras.length - 1);
      final fim = (i + janela ~/ 2).clamp(0, amostras.length - 1);
      final vizinhos = amostras.sublist(inicio, fim + 1);
      final media = vizinhos.map((a) => a.intensidade).reduce((a, b) => a + b) / vizinhos.length;
      resultado.add(AmostraPpg(tempo: amostras[i].tempo, intensidade: media));
    }
    return resultado;
  }

  /// Máximos locais acima da média + um desvio mínimo, espaçados de pelo
  /// menos 300ms (equivalente a um limite de 200 bpm) para não contar o
  /// mesmo batimento duas vezes.
  List<AmostraPpg> _detetarPicos(List<AmostraPpg> amostras) {
    if (amostras.length < 3) return const [];

    final valores = amostras.map((a) => a.intensidade).toList();
    final media = valores.reduce((a, b) => a + b) / valores.length;
    final variancia = valores.map((v) => (v - media) * (v - media)).reduce((a, b) => a + b) / valores.length;
    final desvio = sqrt(variancia);
    final limiar = media + (desvio > 0 ? 0.3 * desvio : 0.5);

    const distanciaMinima = Duration(milliseconds: 300);
    final picos = <AmostraPpg>[];
    for (var i = 1; i < amostras.length - 1; i++) {
      final atual = amostras[i];
      final ehMaximoLocal = atual.intensidade > amostras[i - 1].intensidade &&
          atual.intensidade >= amostras[i + 1].intensidade;
      if (!ehMaximoLocal || atual.intensidade < limiar) continue;
      if (picos.isNotEmpty && atual.tempo - picos.last.tempo < distanciaMinima) continue;
      picos.add(atual);
    }
    return picos;
  }
}
