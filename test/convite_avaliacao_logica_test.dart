import 'package:cuidarpt/features/avaliacao/services/convite_avaliacao_logica.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('deveMostrarConviteAvaliacao', () {
    final instalacao = DateTime(2026, 1, 1);

    test('não mostra antes do 2º dia de uso', () {
      final resultado = deveMostrarConviteAvaliacao(
        agora: instalacao.add(const Duration(days: 1)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: null,
      );
      expect(resultado, isFalse);
    });

    test('mostra a partir do 2º dia se nunca foi mostrado', () {
      final resultado = deveMostrarConviteAvaliacao(
        agora: instalacao.add(const Duration(days: 2)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: null,
      );
      expect(resultado, isTrue);
    });

    test('não mostra de novo antes de passar uma semana', () {
      final ultimaVez = instalacao.add(const Duration(days: 2));
      final resultado = deveMostrarConviteAvaliacao(
        agora: ultimaVez.add(const Duration(days: 3)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: ultimaVez,
      );
      expect(resultado, isFalse);
    });

    test('mostra novamente passada uma semana desde a última vez', () {
      final ultimaVez = instalacao.add(const Duration(days: 2));
      final resultado = deveMostrarConviteAvaliacao(
        agora: ultimaVez.add(const Duration(days: 7)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: ultimaVez,
      );
      expect(resultado, isTrue);
    });

    test('forcar ignora o intervalo semanal mas não o mínimo de instalação', () {
      final ultimaVez = instalacao.add(const Duration(days: 2));
      final aindaCedo = deveMostrarConviteAvaliacao(
        agora: instalacao.add(const Duration(days: 1)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: null,
        forcar: true,
      );
      expect(aindaCedo, isFalse);

      final passadoUmDia = deveMostrarConviteAvaliacao(
        agora: ultimaVez.add(const Duration(days: 1)),
        instalacaoEm: instalacao,
        ultimaVezMostrado: ultimaVez,
        forcar: true,
      );
      expect(passadoUmDia, isTrue);
    });
  });
}
