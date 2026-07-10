import 'package:cuidarpt/data/models/registo_consulta.dart';
import 'package:cuidarpt/data/models/registo_medicacao.dart';
import 'package:cuidarpt/features/idosos/services/proximo_evento.dart';
import 'package:flutter_test/flutter_test.dart';

RegistoMedicacao _medicacao(String nome, List<int> horariosMinutos) {
  return RegistoMedicacao()
    ..idosoId = 1
    ..nomeMedicamento = nome
    ..horariosMinutos = horariosMinutos
    ..ativo = true;
}

RegistoConsulta _consulta(String especialidade, DateTime dataHora) {
  return RegistoConsulta()
    ..idosoId = 1
    ..especialidade = especialidade
    ..dataHora = dataHora
    ..lembreteAtivo = true
    ..criadoEm = dataHora
    ..atualizadoEm = dataHora;
}

void main() {
  group('proximosEventos', () {
    test('devolve lista vazia sem medicação nem consultas futuras', () {
      final agora = DateTime(2026, 7, 9, 12);
      expect(proximosEventos(agora, medicacoes: const [], consultas: const []), isEmpty);
    });

    test('ordena medicação e consultas por proximidade', () {
      final agora = DateTime(2026, 7, 9, 8, 0);
      final medicacoes = [_medicacao('Paracetamol', [10 * 60])];
      final consultas = [_consulta('Cardiologia', DateTime(2026, 7, 9, 9, 0))];

      final eventos = proximosEventos(agora, medicacoes: medicacoes, consultas: consultas);

      expect(eventos, hasLength(2));
      expect(eventos.first.titulo, 'Cardiologia');
      expect(eventos.last.titulo, 'Paracetamol');
    });

    test('ignora consultas com lembrete desativado', () {
      final agora = DateTime(2026, 7, 9, 8, 0);
      final consulta = _consulta('Cardiologia', DateTime(2026, 7, 9, 9, 0))..lembreteAtivo = false;

      expect(proximosEventos(agora, medicacoes: const [], consultas: [consulta]), isEmpty);
    });
  });

  group('proximoEvento', () {
    test('devolve o mais próximo entre os vários eventos', () {
      final agora = DateTime(2026, 7, 9, 8, 0);
      final medicacoes = [_medicacao('Paracetamol', [10 * 60])];
      final consultas = [_consulta('Cardiologia', DateTime(2026, 7, 9, 9, 0))];

      final evento = proximoEvento(agora, medicacoes: medicacoes, consultas: consultas);

      expect(evento?.titulo, 'Cardiologia');
    });
  });

  group('eventoUrgente', () {
    final agora = DateTime(2026, 7, 9, 8, 0);

    test('true dentro do limiar (por omissão 3 horas)', () {
      expect(eventoUrgente(agora, agora.add(const Duration(hours: 2))), isTrue);
    });

    test('true exatamente no limiar', () {
      expect(eventoUrgente(agora, agora.add(const Duration(hours: 3))), isTrue);
    });

    test('false fora do limiar', () {
      expect(eventoUrgente(agora, agora.add(const Duration(hours: 4))), isFalse);
    });

    test('false para eventos já passados', () {
      expect(eventoUrgente(agora, agora.subtract(const Duration(minutes: 5))), isFalse);
    });

    test('respeita um limiar personalizado', () {
      expect(
        eventoUrgente(agora, agora.add(const Duration(hours: 1)), limiar: const Duration(minutes: 30)),
        isFalse,
      );
    });
  });
}
