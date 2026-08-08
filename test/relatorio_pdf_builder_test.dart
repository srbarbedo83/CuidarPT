import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/data/models/registo_consulta.dart';
import 'package:cuidarpt/data/models/registo_cuidado_diario.dart';
import 'package:cuidarpt/data/models/registo_medicacao.dart';
import 'package:cuidarpt/data/models/registo_sinais_vitais.dart';
import 'package:cuidarpt/features/relatorios/services/relatorio_pdf_builder.dart';
import 'package:cuidarpt/features/relatorios/services/seccoes_relatorio.dart';
import 'package:cuidarpt/l10n/app_localizations_pt.dart';

final _l10n = AppLocalizationsPt();

void main() {
  test('construir gera bytes de um PDF válido, mesmo sem registos', () async {
    final agora = DateTime.now();
    final idoso = Idoso()
      ..id = 1
      ..nome = 'Ana'
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final bytes = await RelatorioPdfBuilder.construir(
      l10n: _l10n,
      idoso: idoso,
      inicio: agora.subtract(const Duration(days: 7)),
      fim: agora,
      medicacoesAtivas: const [],
      consultas: const [],
      cuidados: const [],
    );

    expect(bytes, isNotEmpty);
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
  });

  test('construir inclui os registos de medicação, consultas e cuidados fornecidos', () async {
    final agora = DateTime.now();
    final idoso = Idoso()
      ..id = 1
      ..nome = 'Ana'
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final medicacao = RegistoMedicacao()
      ..id = 1
      ..idosoId = 1
      ..nomeMedicamento = 'Paracetamol'
      ..horariosMinutos = [480]
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final consulta = RegistoConsulta()
      ..id = 1
      ..idosoId = 1
      ..especialidade = 'Cardiologia'
      ..dataHora = agora
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final cuidado = RegistoCuidadoDiario()
      ..id = 1
      ..idosoId = 1
      ..tipo = TipoCuidadoDiario.humor
      ..humorNivel = 4
      ..timestamp = agora;

    final bytes = await RelatorioPdfBuilder.construir(
      l10n: _l10n,
      idoso: idoso,
      inicio: agora.subtract(const Duration(days: 7)),
      fim: agora,
      medicacoesAtivas: [medicacao],
      consultas: [consulta],
      cuidados: [cuidado],
      cuidadorNome: 'Joana Silva',
    );

    expect(bytes, isNotEmpty);
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
  });

  test('construir respeita as secções escolhidas (sinais vitais e notas)', () async {
    final agora = DateTime.now();
    final idoso = Idoso()
      ..id = 1
      ..nome = 'Ana'
      ..notas = 'Alérgica a penicilina'
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final sinaisVitais = RegistoSinaisVitais()
      ..id = 1
      ..idosoId = 1
      ..pressaoSistolica = 120
      ..pressaoDiastolica = 80
      ..peso = 70.5
      ..timestamp = agora;

    final comTudo = await RelatorioPdfBuilder.construir(
      l10n: _l10n,
      idoso: idoso,
      inicio: agora.subtract(const Duration(days: 7)),
      fim: agora,
      medicacoesAtivas: const [],
      consultas: const [],
      cuidados: const [],
      sinaisVitais: [sinaisVitais],
      seccoes: const {SeccaoRelatorio.sinaisVitais, SeccaoRelatorio.notas},
    );
    expect(String.fromCharCodes(comTudo.take(5)), '%PDF-');

    final semNenhuma = await RelatorioPdfBuilder.construir(
      l10n: _l10n,
      idoso: idoso,
      inicio: agora.subtract(const Duration(days: 7)),
      fim: agora,
      medicacoesAtivas: const [],
      consultas: const [],
      cuidados: const [],
      sinaisVitais: [sinaisVitais],
      seccoes: const {},
    );
    expect(String.fromCharCodes(semNenhuma.take(5)), '%PDF-');
  });
}
