import 'package:cuidarpt/data/models/contacto_emergencia.dart';
import 'package:cuidarpt/data/models/idoso.dart';
import 'package:cuidarpt/features/idosos/services/progresso_perfil.dart';
import 'package:flutter_test/flutter_test.dart';

Idoso _idosoVazio() {
  final agora = DateTime.now();
  return Idoso()
    ..id = 1
    ..nome = 'Ana'
    ..criadoEm = agora
    ..atualizadoEm = agora;
}

void main() {
  group('progressoPerfilIdoso', () {
    test('perfil sem nada preenchido está a 0%', () {
      final progresso = progressoPerfilIdoso(_idosoVazio());

      expect(progresso.percentagem, 0);
      expect(progresso.completo, isFalse);
      expect(progresso.emFalta, containsAll(['Foto', 'Data de nascimento', 'Sexo', 'Contacto de emergência']));
    });

    test('perfil parcialmente preenchido mostra a percentagem correta', () {
      final idoso = _idosoVazio()
        ..fotoPath = '/tmp/foto.jpg'
        ..dataNascimento = DateTime(1950, 1, 1);

      final progresso = progressoPerfilIdoso(idoso);

      expect(progresso.completos, 2);
      expect(progresso.total, 4);
      expect(progresso.percentagem, 50);
      expect(progresso.completo, isFalse);
    });

    test('perfil completo está a 100%', () {
      final idoso = _idosoVazio()
        ..fotoPath = '/tmp/foto.jpg'
        ..dataNascimento = DateTime(1950, 1, 1)
        ..sexo = Sexo.feminino
        ..contactosEmergencia = [ContactoEmergencia()..nome = 'Filha'];

      final progresso = progressoPerfilIdoso(idoso);

      expect(progresso.percentagem, 100);
      expect(progresso.completo, isTrue);
      expect(progresso.emFalta, isEmpty);
    });

    test('contacto de emergência vazio (sem nome nem telefone) conta como sem contacto', () {
      final idoso = _idosoVazio()..contactosEmergencia = [ContactoEmergencia()];

      final progresso = progressoPerfilIdoso(idoso);

      expect(progresso.emFalta, contains('Contacto de emergência'));
    });
  });
}
