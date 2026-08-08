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

  @override
  String get comumCancelar => 'Cancel';

  @override
  String get comumApagar => 'Delete';

  @override
  String get comumGuardar => 'Save';

  @override
  String get comumDefinicoes => 'Settings';

  @override
  String get comumSinaisVitaisPremiumMensagem =>
      'Recording vital signs is a Premium feature. Subscribe to Premium to use it.';

  @override
  String proximoEventoFaltamDias(int dias) {
    String _temp0 = intl.Intl.pluralLogic(
      dias,
      locale: localeName,
      other: '$dias days left',
      one: '1 day left',
    );
    return '$_temp0';
  }

  @override
  String proximoEventoFaltamHoras(int horas) {
    return '${horas}h left';
  }

  @override
  String proximoEventoFaltamMinutos(int minutos) {
    return '$minutos min left';
  }

  @override
  String homeTrialDias(int dias) {
    return 'Trial: ${dias}d';
  }

  @override
  String homeErroCarregarPerfis(String erro) {
    return 'Error loading profiles: $erro';
  }

  @override
  String get homeCriarNovoPerfil => 'Create new profile';

  @override
  String get homeEmptyStateTexto =>
      'You don\'t have any profiles yet.\nTap \"Create new profile\" to create the first one.';

  @override
  String homeLimiteIdososMensagem(int limite) {
    String _temp0 = intl.Intl.pluralLogic(
      limite,
      locale: localeName,
      other:
          'The Free plan allows $limite profiles. Subscribe to Premium to add more profiles.',
      one:
          'The Free plan allows 1 profile. Subscribe to Premium to add more profiles.',
    );
    return '$_temp0';
  }

  @override
  String get homeApagarPerfilTitulo => 'Delete profile';

  @override
  String homeApagarPerfilConfirmacao(String nome) {
    return 'Are you sure you want to delete $nome\'s profile?';
  }

  @override
  String get homeLembretesTitulo => 'Reminders';

  @override
  String homeLembretesContagem(int total) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total upcoming',
      one: '1 upcoming',
    );
    return '$_temp0';
  }

  @override
  String get homeEscolherIdosoTitulo => 'For which person?';

  @override
  String get homeAcaoMedicacao => 'Medication';

  @override
  String get homeAcaoConsulta => 'Appointment';

  @override
  String get homeAcaoSinaisVitais => 'Vital signs';

  @override
  String get homeAcaoRelatorio => 'Report';

  @override
  String get homeIdosoSemDataNascimento => 'Date of birth not set';

  @override
  String homeIdosoDataNascimento(String data) {
    return 'Born: $data';
  }

  @override
  String get idosoDetailLigarEmergencia => 'Call emergency contact';

  @override
  String get idosoDetailCalendario => 'Calendar';

  @override
  String get idosoDetailGerarRelatorio => 'Generate report';

  @override
  String get idosoDetailEditarPerfil => 'Edit profile';

  @override
  String get idosoDetailProfissionais => 'Professionals';

  @override
  String get idosoDetailAdicionarMedicacao => 'Add medication';

  @override
  String idosoDetailErroCarregarMedicacao(String erro) {
    return 'Error loading medication: $erro';
  }

  @override
  String get idosoDetailConsultasTratamentosTitulo =>
      'Appointments and treatments';

  @override
  String get idosoDetailAdicionarConsulta => 'Add appointment or treatment';

  @override
  String idosoDetailErroCarregarConsultas(String erro) {
    return 'Error loading appointments: $erro';
  }

  @override
  String get idosoDetailGerarRelatorioDiario => 'Generate daily report';

  @override
  String get idosoDetailProximaToma => 'Next dose';

  @override
  String get idosoDetailProximaConsulta => 'Next appointment';

  @override
  String idosoDetailEmergenciaContacto(String nome, String telefone) {
    return 'Emergency: $nome $telefone';
  }

  @override
  String get idosoDetailMudarHumor => 'Change';

  @override
  String get humorComDores => 'In pain';

  @override
  String get humorCansado => 'Tired';

  @override
  String get humorSonolento => 'Sleepy';

  @override
  String get humorNormal => 'Normal';

  @override
  String get humorEnergico => 'Energetic';

  @override
  String get humorContente => 'Happy';

  @override
  String get idosoDetailVerMenos => 'See less';

  @override
  String idosoDetailVerTodas(int total) {
    return 'See all ($total)';
  }

  @override
  String get idosoDetailSemMedicacao => 'No medication recorded yet.';

  @override
  String get idosoDetailSemConsultas =>
      'No appointments or treatments recorded yet.';

  @override
  String idosoDetailApagarItemConfirmacao(String nome) {
    return 'Are you sure you want to delete \"$nome\"?';
  }

  @override
  String get idosoDetailApagarMedicacaoTitulo => 'Delete medication';

  @override
  String get idosoDetailApagarTratamentoTitulo => 'Delete treatment';

  @override
  String get idosoDetailApagarConsultaTitulo => 'Delete appointment';

  @override
  String get idosoDetailStatusPausada => 'paused';

  @override
  String idosoDetailProximaData(String data) {
    return 'next: $data';
  }

  @override
  String get idosoDetailComoSenteHojeTitulo => 'How are you feeling today?';
}
