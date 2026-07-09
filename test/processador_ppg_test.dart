import 'dart:math';

import 'package:cuidarpt/features/frequencia_cardiaca/services/processador_ppg.dart';
import 'package:flutter_test/flutter_test.dart';

/// Gera amostras sinusoidais simulando um sinal PPG estável com [bpm]
/// batimentos por minuto, à taxa de amostragem [amostrasPorSegundo], para
/// [duracao].
List<AmostraPpg> _gerarSinal({
  required int bpm,
  required Duration duracao,
  double amostrasPorSegundo = 30,
  double linhaBase = 150,
  double amplitude = 15,
}) {
  final amostras = <AmostraPpg>[];
  final totalAmostras = (duracao.inMilliseconds / 1000 * amostrasPorSegundo).round();
  final freqHz = bpm / 60;
  for (var i = 0; i < totalAmostras; i++) {
    final tSegundos = i / amostrasPorSegundo;
    final intensidade = linhaBase + amplitude * sin(2 * pi * freqHz * tSegundos);
    amostras.add(AmostraPpg(
      tempo: Duration(milliseconds: (tSegundos * 1000).round()),
      intensidade: intensidade,
    ));
  }
  return amostras;
}

void main() {
  group('ProcessadorPpg', () {
    test('sem amostras suficientes, não deteta dedo', () {
      final processador = ProcessadorPpg();
      processador.adicionarAmostra(const AmostraPpg(tempo: Duration.zero, intensidade: 150));

      expect(processador.temDedoDetetado, isFalse);
      expect(processador.calcularResultado().status, StatusPpg.semDedo);
    });

    test('intensidade baixa (sem dedo sobre a lente) não é detetada', () {
      final processador = ProcessadorPpg();
      for (final amostra in _gerarSinal(bpm: 60, duracao: const Duration(seconds: 2), linhaBase: 10)) {
        processador.adicionarAmostra(amostra);
      }

      expect(processador.temDedoDetetado, isFalse);
      expect(processador.calcularResultado().status, StatusPpg.semDedo);
    });

    test('está a medir (progresso < 1) antes de atingir a janela mínima', () {
      final processador = ProcessadorPpg(janelaMinima: const Duration(seconds: 12));
      for (final amostra in _gerarSinal(bpm: 60, duracao: const Duration(seconds: 4))) {
        processador.adicionarAmostra(amostra);
      }

      final resultado = processador.calcularResultado();

      expect(resultado.status, StatusPpg.aMedir);
      expect(resultado.progresso, greaterThan(0));
      expect(resultado.progresso, lessThan(1));
    });

    test('calcula um BPM próximo do valor real para um sinal de 60 bpm', () {
      final processador = ProcessadorPpg(janelaMinima: const Duration(seconds: 12));
      for (final amostra in _gerarSinal(bpm: 60, duracao: const Duration(seconds: 15))) {
        processador.adicionarAmostra(amostra);
      }

      final resultado = processador.calcularResultado();

      expect(resultado.status, StatusPpg.concluido);
      expect(resultado.bpm, inInclusiveRange(55, 65));
    });

    test('calcula um BPM próximo do valor real para um sinal de 90 bpm', () {
      final processador = ProcessadorPpg(janelaMinima: const Duration(seconds: 12));
      for (final amostra in _gerarSinal(bpm: 90, duracao: const Duration(seconds: 15))) {
        processador.adicionarAmostra(amostra);
      }

      final resultado = processador.calcularResultado();

      expect(resultado.status, StatusPpg.concluido);
      expect(resultado.bpm, inInclusiveRange(83, 97));
    });

    test('sinal constante (sem picos) dá erro em vez de um BPM inventado', () {
      final processador = ProcessadorPpg(janelaMinima: const Duration(seconds: 12));
      for (var i = 0; i < 400; i++) {
        processador.adicionarAmostra(
          AmostraPpg(tempo: Duration(milliseconds: i * 50), intensidade: 150),
        );
      }

      final resultado = processador.calcularResultado();

      expect(resultado.status, StatusPpg.erro);
      expect(resultado.mensagemErro, isNotNull);
    });

    test('reiniciar limpa as amostras acumuladas', () {
      final processador = ProcessadorPpg();
      for (final amostra in _gerarSinal(bpm: 60, duracao: const Duration(seconds: 2))) {
        processador.adicionarAmostra(amostra);
      }
      expect(processador.temDedoDetetado, isTrue);

      processador.reiniciar();

      expect(processador.temDedoDetetado, isFalse);
    });
  });
}
