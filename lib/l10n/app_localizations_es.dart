// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CuidarPT';

  @override
  String get definicoesIdioma => 'Idioma';

  @override
  String get definicoesIdiomaSistema => 'Sistema';

  @override
  String get definicoesIdiomaPortugues => 'Português';

  @override
  String get definicoesIdiomaIngles => 'English';

  @override
  String get definicoesIdiomaEspanhol => 'Español';

  @override
  String get onboardingSlide1Titulo => 'Bienvenido a CuidarPT';

  @override
  String get onboardingSlide1Descricao =>
      'Organiza la medicación, las citas y los cuidados diarios de quien cuidas, todo en un solo lugar.';

  @override
  String get onboardingSlide2Titulo => 'Registros sencillos del día a día';

  @override
  String get onboardingSlide2Descricao =>
      'Medicación con recordatorios, citas médicas y notas rápidas de higiene, alimentación y estado de ánimo.';

  @override
  String get onboardingSlide3Titulo => 'Todo guardado en tu móvil';

  @override
  String get onboardingSlide3Descricao =>
      'Sin cuentas ni servidores: los datos quedan solo en tu dispositivo. Empieza ya con 7 días gratis de todas las funciones Premium.';

  @override
  String get onboardingQuantosIdososTitulo =>
      '¿A cuántas personas vas a cuidar?';

  @override
  String get onboardingQuantosIdososOpcaoTresOuMais => '3+';

  @override
  String get onboardingQuantosIdososAvisoComLimite =>
      'El plan Gratis permite hasta 2 perfiles. Para 3 o más, necesitarás Premium, ya incluido en tus 7 días gratis.';

  @override
  String get onboardingQuantosIdososAvisoSemLimite =>
      'El plan Gratis permite hasta 2 perfiles.';

  @override
  String get onboardingEmailTitulo => 'Tu email (opcional)';

  @override
  String get onboardingEmailDescricao =>
      'Solo lo usamos para rellenar el destinatario cuando compartes un informe. Se guarda únicamente en este móvil.';

  @override
  String get onboardingEmailHint => 'nombre@ejemplo.com';

  @override
  String get onboardingDisclaimerTitulo => 'Antes de empezar';

  @override
  String get onboardingDisclaimerTexto =>
      'CuidarPT es una herramienta de organización de cuidados. No es un dispositivo médico y no sustituye la evaluación, el diagnóstico ni el tratamiento de un profesional de la salud. En caso de emergencia, contacta siempre con los servicios de salud.';

  @override
  String get onboardingDisclaimerCheckbox => 'Lo he leído y entendido';

  @override
  String get onboardingBotaoComecar => 'Empezar';

  @override
  String get onboardingBotaoSeguinte => 'Siguiente';
}
