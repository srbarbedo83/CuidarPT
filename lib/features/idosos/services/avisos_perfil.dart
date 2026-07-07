import '../../../data/models/idoso.dart';

/// Lista frases curtas sobre informação relevante em falta no perfil do
/// idoso, para mostrar um aviso discreto no ecrã inicial.
List<String> avisosPerfilIncompleto(Idoso idoso) {
  final avisos = <String>[];

  final temContactoComInfo = idoso.contactosEmergencia.any(
    (c) => (c.nome != null && c.nome!.isNotEmpty) || (c.telefone != null && c.telefone!.isNotEmpty),
  );
  if (!temContactoComInfo) avisos.add('Sem contacto de emergência');

  if (idoso.dataNascimento == null) avisos.add('Sem data de nascimento');

  return avisos;
}
