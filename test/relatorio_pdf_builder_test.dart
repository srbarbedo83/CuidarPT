import 'package:flutter_test/flutter_test.dart';

import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/data/models/registo_consulta.dart';
import 'package:cuidarpt/data/models/registo_cuidado_diario.dart';
import 'package:cuidarpt/data/models/registo_medicacao.dart';
import 'package:cuidarpt/features/relatorios/services/relatorio_pdf_builder.dart';

void main() {
  test('construir gera bytes de um PDF válido, mesmo sem registos', () async {
    final agora = DateTime.now();
    final idoso = Idoso()
      ..id = 1
      ..nome = 'Ana'
      ..criadoEm = agora
      ..atualizadoEm = agora;

    final bytes = await RelatorioPdfBuilder.construir(
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
}
