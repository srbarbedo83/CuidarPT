import 'package:isar_community/isar.dart';

part 'preferencias_app.g.dart';

enum TemaPreferido { sistema, claro, escuro }

/// Registo único com as preferências de acessibilidade/aparência da app
/// (tamanho de letra, tema). Guardado localmente, tal como todo o resto.
@collection
class PreferenciasApp {
  Id id = 0;

  @Enumerated(EnumType.name)
  TemaPreferido tema = TemaPreferido.sistema;

  /// Fator de escala do texto: 0.85 (pequeno), 1.0 (médio), 1.3 (grande).
  double escalaTexto = 1.0;

  /// `true` depois de o utilizador confirmar, no onboarding, que percebeu
  /// que a app não substitui aconselhamento, diagnóstico ou tratamento
  /// médico profissional.
  bool disclaimerSaudeAceite = false;
}
