// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CuidarPT';

  @override
  String get definicoesIdioma => 'Language';

  @override
  String get definicoesIdiomaSistema => 'System';

  @override
  String get definicoesIdiomaPortugues => 'Português';

  @override
  String get definicoesIdiomaIngles => 'English';

  @override
  String get definicoesIdiomaEspanhol => 'Español';

  @override
  String get onboardingSlide1Titulo => 'Welcome to CuidarPT';

  @override
  String get onboardingSlide1Descricao =>
      'Organize medication, appointments and daily care for those you look after, all in one place.';

  @override
  String get onboardingSlide2Titulo => 'Simple day-to-day records';

  @override
  String get onboardingSlide2Descricao =>
      'Medication with reminders, medical appointments, and quick notes on hygiene, meals and mood.';

  @override
  String get onboardingSlide3Titulo => 'Everything stored on your phone';

  @override
  String get onboardingSlide3Descricao =>
      'No accounts, no servers — your data stays only on your device. Start now with 7 days free of all Premium features.';

  @override
  String get onboardingQuantosIdososTitulo =>
      'How many people will you be caring for?';

  @override
  String get onboardingQuantosIdososOpcaoTresOuMais => '3+';

  @override
  String get onboardingQuantosIdososAvisoComLimite =>
      'The Free plan allows up to 2 profiles. For 3 or more, you\'ll need Premium — already included in your 7 free days.';

  @override
  String get onboardingQuantosIdososAvisoSemLimite =>
      'The Free plan allows up to 2 profiles.';

  @override
  String get onboardingEmailTitulo => 'Your email (optional)';

  @override
  String get onboardingEmailDescricao =>
      'Used only to pre-fill the recipient when you share a report. Stored only on this phone.';

  @override
  String get onboardingEmailHint => 'name@example.com';

  @override
  String get onboardingDisclaimerTitulo => 'Before you start';

  @override
  String get onboardingDisclaimerTexto =>
      'CuidarPT is a care organization tool. It is not a medical device and does not replace assessment, diagnosis or treatment by a health professional. In an emergency, always contact health services.';

  @override
  String get onboardingDisclaimerCheckbox => 'I\'ve read and understood';

  @override
  String get onboardingBotaoComecar => 'Start';

  @override
  String get onboardingBotaoSeguinte => 'Next';
}
