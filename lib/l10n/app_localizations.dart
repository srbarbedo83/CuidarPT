import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// Nome da app, mostrado no topo do ecrã inicial.
  ///
  /// In pt, this message translates to:
  /// **'CuidarPT'**
  String get appTitle;

  /// Título da secção de idioma nas Definições.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get definicoesIdioma;

  /// Opção para seguir o idioma do telemóvel.
  ///
  /// In pt, this message translates to:
  /// **'Sistema'**
  String get definicoesIdiomaSistema;

  /// No description provided for @definicoesIdiomaPortugues.
  ///
  /// In pt, this message translates to:
  /// **'Português'**
  String get definicoesIdiomaPortugues;

  /// No description provided for @definicoesIdiomaIngles.
  ///
  /// In pt, this message translates to:
  /// **'English'**
  String get definicoesIdiomaIngles;

  /// No description provided for @definicoesIdiomaEspanhol.
  ///
  /// In pt, this message translates to:
  /// **'Español'**
  String get definicoesIdiomaEspanhol;

  /// No description provided for @onboardingSlide1Titulo.
  ///
  /// In pt, this message translates to:
  /// **'Bem-vindo ao CuidarPT'**
  String get onboardingSlide1Titulo;

  /// No description provided for @onboardingSlide1Descricao.
  ///
  /// In pt, this message translates to:
  /// **'Organize a medicação, as consultas e os cuidados diários de quem cuida, tudo num só lugar.'**
  String get onboardingSlide1Descricao;

  /// No description provided for @onboardingSlide2Titulo.
  ///
  /// In pt, this message translates to:
  /// **'Registos simples do dia a dia'**
  String get onboardingSlide2Titulo;

  /// No description provided for @onboardingSlide2Descricao.
  ///
  /// In pt, this message translates to:
  /// **'Medicação com lembretes, consultas médicas e notas rápidas de higiene, alimentação e humor.'**
  String get onboardingSlide2Descricao;

  /// No description provided for @onboardingSlide3Titulo.
  ///
  /// In pt, this message translates to:
  /// **'Tudo guardado no seu telemóvel'**
  String get onboardingSlide3Titulo;

  /// No description provided for @onboardingSlide3Descricao.
  ///
  /// In pt, this message translates to:
  /// **'Sem contas nem servidores — os dados ficam só no seu dispositivo. Comece já com 7 dias grátis de todas as funcionalidades Premium.'**
  String get onboardingSlide3Descricao;

  /// No description provided for @onboardingQuantosIdososTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Quantos idosos vais acompanhar?'**
  String get onboardingQuantosIdososTitulo;

  /// No description provided for @onboardingQuantosIdososOpcaoTresOuMais.
  ///
  /// In pt, this message translates to:
  /// **'3+'**
  String get onboardingQuantosIdososOpcaoTresOuMais;

  /// No description provided for @onboardingQuantosIdososAvisoComLimite.
  ///
  /// In pt, this message translates to:
  /// **'O plano Grátis permite até 2 perfis de idosos. Para 3 ou mais, vais precisar do Premium — já incluído nos teus 7 dias grátis.'**
  String get onboardingQuantosIdososAvisoComLimite;

  /// No description provided for @onboardingQuantosIdososAvisoSemLimite.
  ///
  /// In pt, this message translates to:
  /// **'O plano Grátis permite até 2 perfis de idosos.'**
  String get onboardingQuantosIdososAvisoSemLimite;

  /// No description provided for @onboardingEmailTitulo.
  ///
  /// In pt, this message translates to:
  /// **'O teu email (opcional)'**
  String get onboardingEmailTitulo;

  /// No description provided for @onboardingEmailDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Usamos apenas para pré-preencher o destinatário quando partilhas um relatório. Fica guardado só neste telemóvel.'**
  String get onboardingEmailDescricao;

  /// No description provided for @onboardingEmailHint.
  ///
  /// In pt, this message translates to:
  /// **'nome@exemplo.com'**
  String get onboardingEmailHint;

  /// No description provided for @onboardingDisclaimerTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Antes de começar'**
  String get onboardingDisclaimerTitulo;

  /// No description provided for @onboardingDisclaimerTexto.
  ///
  /// In pt, this message translates to:
  /// **'O CuidarPT é uma ferramenta de organização de cuidados. Não é um dispositivo médico e não substitui a avaliação, o diagnóstico ou o tratamento de um profissional de saúde. Em caso de emergência, contacte sempre os serviços de saúde.'**
  String get onboardingDisclaimerTexto;

  /// No description provided for @onboardingDisclaimerCheckbox.
  ///
  /// In pt, this message translates to:
  /// **'Li e percebi'**
  String get onboardingDisclaimerCheckbox;

  /// No description provided for @onboardingBotaoComecar.
  ///
  /// In pt, this message translates to:
  /// **'Começar'**
  String get onboardingBotaoComecar;

  /// No description provided for @onboardingBotaoSeguinte.
  ///
  /// In pt, this message translates to:
  /// **'Seguinte'**
  String get onboardingBotaoSeguinte;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
