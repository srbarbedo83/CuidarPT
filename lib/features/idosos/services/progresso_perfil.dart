import '../../../data/models/idoso.dart';

/// Progresso de preenchimento do perfil de um idoso — usado para mostrar
/// uma percentagem de completude ("Perfil 75% completo") em vez de uma
/// lista do que falta. Uma barra a meio motiva mais a terminar do que uma
/// lista de avisos, mesmo quando a informação em falta é a mesma.
class ProgressoPerfil {
  const ProgressoPerfil({required this.completos, required this.total, required this.emFalta});

  final int completos;
  final int total;
  final List<String> emFalta;

  double get fracao => total == 0 ? 1 : completos / total;
  int get percentagem => (fracao * 100).round();
  bool get completo => emFalta.isEmpty;
}

ProgressoPerfil progressoPerfilIdoso(Idoso idoso) {
  final temContactoComInfo = idoso.contactosEmergencia.any(
    (c) => (c.nome != null && c.nome!.isNotEmpty) || (c.telefone != null && c.telefone!.isNotEmpty),
  );

  final itens = <String, bool>{
    'Foto': idoso.fotoPath != null,
    'Data de nascimento': idoso.dataNascimento != null,
    'Sexo': idoso.sexo != null,
    'Contacto de emergência': temContactoComInfo,
  };

  final emFalta = [for (final entrada in itens.entries) if (!entrada.value) entrada.key];
  return ProgressoPerfil(completos: itens.length - emFalta.length, total: itens.length, emFalta: emFalta);
}
