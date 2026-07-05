import 'package:isar/isar.dart';

part 'perfil_relatorio.g.dart';

/// Registo único com a personalização dos relatórios PDF (funcionalidade
/// Premium): nome do cuidador profissional e logótipo, reutilizados de
/// relatório para relatório.
@collection
class PerfilRelatorio {
  Id id = 0;

  String? cuidadorNome;
  String? logoPath;
}
