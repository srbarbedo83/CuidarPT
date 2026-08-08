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

  @override
  String get premiumUpsellTitulo => 'Premium feature';

  @override
  String get premiumUpsellBotao => 'Got it';

  @override
  String get alertaPressaoMuitoElevada =>
      'Very high blood pressure (possible hypertensive crisis)';

  @override
  String get alertaPressaoElevada => 'High blood pressure (hypertension)';

  @override
  String get alertaPressaoBaixa => 'Low blood pressure (hypotension)';

  @override
  String get alertaFebreAlta => 'High fever';

  @override
  String get alertaFebre => 'Fever';

  @override
  String get alertaHipotermia => 'Very low body temperature (hypothermia)';

  @override
  String get alertaGlicemiaBaixa => 'Low blood sugar (hypoglycemia)';

  @override
  String get alertaGlicemiaMuitoElevada => 'Very high blood sugar';

  @override
  String get alertaGlicemiaElevada => 'High blood sugar';

  @override
  String get alertaFrequenciaBaixa => 'Low heart rate (bradycardia)';

  @override
  String get alertaFrequenciaElevada => 'High heart rate (tachycardia)';

  @override
  String get alertaSinaisVitaisAviso =>
      'General WHO reference values for resting adults. Does not replace medical assessment.';

  @override
  String get sinaisVitaisUpsellDescricao =>
      'Premium feature: blood pressure, temperature, blood sugar, heart rate.';

  @override
  String get sinaisVitaisTooltipHistorico => 'History chart';

  @override
  String get sinaisVitaisTooltipNovoRegisto => 'New vital signs record';

  @override
  String get sinaisVitaisSemRegistos => 'No vital signs recorded yet.';

  @override
  String get sinaisVitaisSemRegistoHoje => 'No vital signs recorded today yet.';

  @override
  String sinaisVitaisVerTodos(int total) {
    return 'See all ($total)';
  }

  @override
  String get sinaisVitaisApagarTitulo => 'Delete record';

  @override
  String get sinaisVitaisApagarConfirmacao =>
      'Are you sure you want to delete this vital signs record?';

  @override
  String get sinaisVitaisSemValores => 'No values recorded';

  @override
  String sinaisVitaisErroCarregar(String erro) {
    return 'Error loading vital signs: $erro';
  }

  @override
  String get sinaisVitaisFormEditarTitulo => 'Edit vital signs';

  @override
  String get sinaisVitaisFormNovoTitulo => 'New vital signs';

  @override
  String get sinaisVitaisFormDataRegisto => 'Record date';

  @override
  String get sinaisVitaisFormHoraRegisto => 'Record time';

  @override
  String get sinaisVitaisFormPressaoTitulo => 'Blood pressure (mmHg)';

  @override
  String get sinaisVitaisFormSistolica => 'Systolic (top)';

  @override
  String get sinaisVitaisFormDiastolica => 'Diastolic (bottom)';

  @override
  String get sinaisVitaisFormTemperatura => 'Temperature (°C)';

  @override
  String get sinaisVitaisFormGlicemia => 'Blood sugar (mg/dL)';

  @override
  String get sinaisVitaisFormFrequencia => 'Heart rate (bpm)';

  @override
  String get sinaisVitaisFormMedirCamara => 'Measure with the camera';

  @override
  String get sinaisVitaisFormPeso => 'Weight (kg)';

  @override
  String get sinaisVitaisFormDataHora => 'Date and time';

  @override
  String get sinaisVitaisFormNotas => 'Notes';

  @override
  String get sinaisVitaisHistoricoTitulo => 'Vital signs history';

  @override
  String get sinaisVitaisHistorico7Dias => '7 days';

  @override
  String get sinaisVitaisHistorico30Dias => '30 days';

  @override
  String get sinaisVitaisHistoricoPressaoSistolica => 'Systolic pressure';

  @override
  String get sinaisVitaisHistoricoPressaoDiastolica => 'Diastolic pressure';

  @override
  String get sinaisVitaisHistoricoTemperaturaTitulo => 'Temperature';

  @override
  String get sinaisVitaisHistoricoGlicemia => 'Blood sugar';

  @override
  String get sinaisVitaisHistoricoFrequenciaCardiaca => 'Heart rate';

  @override
  String get sinaisVitaisHistoricoPeso => 'Weight';

  @override
  String sinaisVitaisHistoricoMedia(String valor, String unidade) {
    return 'Average: $valor $unidade';
  }

  @override
  String get sinaisVitaisHistoricoSemRegistos =>
      'No records yet in this period.';

  @override
  String get comumNome => 'Name';

  @override
  String get comumEmail => 'Email';

  @override
  String get documentosTirarFotografia => 'Take photo';

  @override
  String get documentosEscolherGaleria => 'Choose from gallery';

  @override
  String get documentosNomeTitulo => 'Document name';

  @override
  String get documentosNomeHint =>
      'E.g.: Dr. Smith\'s prescription, 2026 blood tests';

  @override
  String documentosTituloOmissao(String data) {
    return 'Document $data';
  }

  @override
  String get documentosApagarTitulo => 'Delete document';

  @override
  String documentosApagarConfirmacao(String titulo) {
    return 'Are you sure you want to delete \"$titulo\"?';
  }

  @override
  String get documentosTitulo => 'Documents';

  @override
  String get documentosNenhum => 'No documents';

  @override
  String documentosContagem(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documents',
      one: '1 document',
    );
    return '$_temp0';
  }

  @override
  String get documentosDescricao =>
      'Prescriptions and test results stored only on this phone.';

  @override
  String get documentosAdicionarTooltip => 'Add document';

  @override
  String get documentosSemDocumentos => 'No documents saved yet.';

  @override
  String get contactosCuidadoresNovoTitulo => 'New contact';

  @override
  String get contactosCuidadoresTitulo => 'Caregiver contacts';

  @override
  String get contactosCuidadoresAdicionarTooltip => 'Add contact';

  @override
  String get contactosCuidadoresDescricao =>
      'Used to quickly choose who to share a report with.';

  @override
  String get contactosCuidadoresSemContactos => 'No contacts saved yet.';

  @override
  String get contactosCuidadoresApagarTooltip => 'Delete contact';

  @override
  String contactosCuidadoresErro(String erro) {
    return 'Error loading contacts: $erro';
  }

  @override
  String get rotinaCategoriaHigiene => 'Hygiene';

  @override
  String get rotinaCategoriaAlimentacao => 'Meals';

  @override
  String get rotinaCategoriaSono => 'Sleep';

  @override
  String get rotinaCategoriaAtividade => 'Activity';

  @override
  String get rotinaSugestaoBanho => 'Bath';

  @override
  String get rotinaSugestaoEscovarDentes => 'Brush teeth';

  @override
  String get rotinaSugestaoHigieneIntima => 'Personal hygiene';

  @override
  String get rotinaSugestaoPentearCabelo => 'Comb/style hair';

  @override
  String get rotinaSugestaoPequenoAlmoco => 'Breakfast';

  @override
  String get rotinaSugestaoAlmoco => 'Lunch';

  @override
  String get rotinaSugestaoLanche => 'Snack';

  @override
  String get rotinaSugestaoJantar => 'Dinner';

  @override
  String get rotinaSugestaoHidratacao => 'Hydration/Water';

  @override
  String get rotinaSugestaoSesta => 'Nap';

  @override
  String get rotinaSugestaoDeitarNoite => 'Go to bed';

  @override
  String get rotinaSugestaoAcordar => 'Wake up';

  @override
  String get rotinaSugestaoPasseio => 'Walk';

  @override
  String get rotinaSugestaoExercicios => 'Exercises';

  @override
  String get rotinaSugestaoAlongamentos => 'Stretching';

  @override
  String get rotinaNovoItemTitulo => 'New routine item';

  @override
  String get rotinaNovoItemHint => 'E.g.: Bath, Breakfast';

  @override
  String get rotinaTitulo => 'Hygiene, meals, sleep and activity routine';

  @override
  String get rotinaNenhumItem => 'No items';

  @override
  String rotinaContagemItens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get rotinaSelecionarVarios => 'Select multiple';

  @override
  String get rotinaFotoPrato => 'Meal photo';

  @override
  String get rotinaApagarItem => 'Delete item';

  @override
  String get rotinaMarcarComoFeito => 'Mark as done';

  @override
  String rotinaMarcarNComoFeito(int count) {
    return 'Mark $count as done';
  }

  @override
  String get rotinaAdicionarItem => 'Add item';

  @override
  String get humorGraficoTitulo => 'Mood';

  @override
  String get humorGraficoSemRegistos => 'No mood records yet in this period.';

  @override
  String get diaSegAbrev => 'Mon';

  @override
  String get diaTerAbrev => 'Tue';

  @override
  String get diaQuaAbrev => 'Wed';

  @override
  String get diaQuiAbrev => 'Thu';

  @override
  String get diaSexAbrev => 'Fri';

  @override
  String get diaSabAbrev => 'Sat';

  @override
  String get diaDomAbrev => 'Sun';

  @override
  String get horariosTodosDias => 'Every day';

  @override
  String get medicacaoFormEditarTitulo => 'Edit medication';

  @override
  String get medicacaoFormNovoTitulo => 'New medication';

  @override
  String get medicacaoFormNome => 'Medication name *';

  @override
  String get medicacaoFormNomeErro => 'Enter the medication name';

  @override
  String get medicacaoFormDose => 'Dose';

  @override
  String get medicacaoFormDoseHint => 'E.g.: 1 tablet, 500 mg, 10 drops';

  @override
  String get medicacaoFormVia => 'Route of administration';

  @override
  String get medicacaoFormViaHint => 'E.g.: Oral, Intravenous';

  @override
  String get medicacaoFormHorariosTitulo => 'Times *';

  @override
  String get medicacaoFormPreenchimentoRapido =>
      'Quick fill by frequency (replaces current times):';

  @override
  String get medicacaoForm1xDia => 'Once a day';

  @override
  String get medicacaoForm12h => 'Every 12h';

  @override
  String get medicacaoForm8h => 'Every 8h';

  @override
  String get medicacaoFormPrimeiraToma => 'First dose';

  @override
  String get medicacaoFormAdicionarHorario => 'Add time';

  @override
  String get medicacaoFormErroHorarios => 'Add at least one time';

  @override
  String get medicacaoFormDiasSemanaTitulo => 'Days of the week';

  @override
  String get medicacaoFormDiasSemanaDescricao =>
      'Leave none selected to take it every day.';

  @override
  String get medicacaoFormDataInicio => 'Start date';

  @override
  String get medicacaoFormDataFim => 'End date (optional)';

  @override
  String get medicacaoFormNaoDefinida => 'Not set';

  @override
  String get medicacaoFormSemDataDefinida => 'No date set';

  @override
  String get medicacaoFormLembretesAtivos => 'Reminders active';

  @override
  String get medicacaoFormLembretesDescricao =>
      'Turn off to pause without deleting the record';

  @override
  String get consultaFormEditarTratamento => 'Edit treatment';

  @override
  String get consultaFormEditarConsulta => 'Edit appointment';

  @override
  String get consultaFormNovoTratamento => 'New treatment';

  @override
  String get consultaFormNovaConsulta => 'New appointment';

  @override
  String get consultaFormDataConsulta => 'Appointment date';

  @override
  String get consultaFormHoraConsulta => 'Appointment time';

  @override
  String get consultaFormTipoConsultaMedica => 'Medical appointment';

  @override
  String get consultaFormTipoTratamento => 'Treatment';

  @override
  String get consultaFormTipoTratamentoLabel => 'Treatment type *';

  @override
  String get consultaFormEspecialidadeLabel => 'Specialty *';

  @override
  String get consultaFormTipoTratamentoHint => 'E.g.: Physiotherapy, Nursing';

  @override
  String get consultaFormEspecialidadeHint =>
      'E.g.: General practice, Cardiology';

  @override
  String get consultaFormTipoTratamentoErro => 'Enter the treatment type';

  @override
  String get consultaFormEspecialidadeErro => 'Enter the specialty';

  @override
  String get consultaFormLocal => 'Location';

  @override
  String get consultaFormLocalHint =>
      'E.g.: Health center, Hospital, Private clinic';

  @override
  String get consultaFormProfissional => 'Professional';

  @override
  String get consultaFormNomeMedico => 'Doctor\'s name';

  @override
  String get consultaFormProfissionalHint => 'E.g.: Nurse Mary Smith';

  @override
  String get consultaFormNomeMedicoHint => 'E.g.: Dr. John Smith';

  @override
  String get consultaFormTratamentoRecorrente => 'Recurring treatment';

  @override
  String get consultaFormTratamentoRecorrenteDescricao =>
      'Repeats daily or on specific days of the week';

  @override
  String get consultaFormDataHoraInicio => 'Start date and time';

  @override
  String get consultaFormDataHora => 'Date and time';

  @override
  String get consultaFormDiasSemanaDescricao =>
      'Leave none selected to repeat every day.';

  @override
  String get consultaFormProximoTratamento => 'Next treatment (optional)';

  @override
  String get consultaFormProximaConsultaOpcional =>
      'Next appointment (optional)';

  @override
  String get consultaFormLembreteAtivo => 'Reminder active';

  @override
  String get consultaFormLembreteRecorrente =>
      'Notifies every day (or on the chosen days) at the set time';

  @override
  String get consultaFormLembreteTratamento =>
      'Notifies before the treatment and the next one, if in the future';

  @override
  String get consultaFormLembreteConsulta =>
      'Notifies before the appointment and the next one, if in the future';

  @override
  String get profissionaisEspecialidadeLabel => 'Specialty';

  @override
  String get profissionaisEspecialidadeHint => 'E.g.: Cardiology';

  @override
  String get profissionaisInstituicao => 'Institution';

  @override
  String get profissionaisInstituicaoHint => 'E.g.: Hospital, clinic, pharmacy';

  @override
  String get profissionaisContacto => 'Contact';

  @override
  String get profissionaisVazio =>
      'No professionals recorded yet. They\'ll appear here automatically as you fill in the doctor\'s/professional\'s name in an appointment or treatment.';

  @override
  String get profissionaisLigarTooltip => 'Call';

  @override
  String get tipoCuidadoHumor => 'Mood';

  @override
  String get tipoCuidadoOutro => 'Other';

  @override
  String get relatorioSeccaoCuidados => 'Routine / daily care';

  @override
  String get relatorioSeccaoNotas => 'Persistent notes';

  @override
  String get relatorioPartilharTitulo => 'Share with whom?';

  @override
  String relatorioEuMesmo(String email) {
    return 'Myself ($email)';
  }

  @override
  String get relatorioNenhum => 'None';

  @override
  String get relatorioContinuar => 'Continue';

  @override
  String get relatorioTitulo => 'Generate report';

  @override
  String get relatorioPeriodoTitulo => 'Period';

  @override
  String get relatorioPeriodoHoje => 'Today';

  @override
  String get relatorioPeriodoUltimos7Dias => 'Last 7 days';

  @override
  String get relatorioPeriodoUltimos30Dias => 'Last 30 days';

  @override
  String get relatorioPeriodoPersonalizado => 'Custom period';

  @override
  String get relatorioPeriodoPersonalizadoUpsell =>
      'Choosing a custom period is a Premium feature. The Free plan has the last 7 or 30 days.';

  @override
  String get relatorioPeriodoHelpText => 'Report period';

  @override
  String relatorioIntervalo(String inicio, String fim) {
    return '$inicio to $fim';
  }

  @override
  String get relatorioSeccoesTitulo => 'Sections to include';

  @override
  String get relatorioSeccoesDescricao =>
      'Medication and appointments are always part of the report.';

  @override
  String get relatorioPersonalizacaoTitulo => 'Customization';

  @override
  String get relatorioPersonalizacaoUpsell =>
      'Adding your name and logo to the report is a Premium feature.';

  @override
  String get relatorioNomeCuidador => 'Professional caregiver name (optional)';

  @override
  String get relatorioAdicionarLogo => 'Add logo';

  @override
  String get relatorioAlterarLogo => 'Change logo';

  @override
  String get relatorioLogoUpsell =>
      'Customizing the report with a logo is a Premium feature.';

  @override
  String get relatorioGerarBotao => 'Generate report';

  @override
  String get relatorioPreviewTitulo => 'Report';

  @override
  String relatorioPdfTitulo(String nome) {
    return 'Care report - $nome';
  }

  @override
  String relatorioPdfPeriodo(String inicio, String fim) {
    return 'Period: $inicio to $fim';
  }

  @override
  String relatorioPdfGeradoEm(String dataHora) {
    return 'Generated on: $dataHora';
  }

  @override
  String relatorioPdfCuidador(String nome) {
    return 'Caregiver: $nome';
  }

  @override
  String get relatorioPdfMedicacaoTitulo => 'Current medication';

  @override
  String get relatorioPdfSemMedicacao => 'No active medication recorded.';

  @override
  String get relatorioPdfColunaMedicamento => 'Medication';

  @override
  String get relatorioPdfColunaDose => 'Dose';

  @override
  String get relatorioPdfColunaVia => 'Route';

  @override
  String get relatorioPdfColunaHorarios => 'Times';

  @override
  String get relatorioPdfColunaDias => 'Days';

  @override
  String get relatorioPdfConsultasTitulo =>
      'Appointments and treatments in the period';

  @override
  String get relatorioPdfSemConsultas =>
      'No appointments or treatments recorded in the period.';

  @override
  String get relatorioPdfColunaTipo => 'Type';

  @override
  String get relatorioPdfColunaData => 'Date';

  @override
  String get relatorioPdfColunaEspecialidade => 'Specialty/Treatment';

  @override
  String get relatorioPdfColunaLocal => 'Location';

  @override
  String get relatorioPdfColunaProfissional => 'Professional';

  @override
  String get relatorioPdfColunaNotas => 'Notes';

  @override
  String get relatorioPdfTipoConsulta => 'Appointment';

  @override
  String get relatorioPdfCuidadosTitulo => 'Daily care in the period';

  @override
  String get relatorioPdfSemCuidados => 'No daily care recorded in the period.';

  @override
  String get relatorioPdfColunaNota => 'Note';

  @override
  String get relatorioPdfSinaisVitaisTitulo => 'Vital signs in the period';

  @override
  String get relatorioPdfSemSinaisVitais =>
      'No vital signs recorded in the period.';

  @override
  String get relatorioPdfColunaPressao => 'Blood pressure';

  @override
  String get relatorioPdfColunaTemp => 'Temp.';

  @override
  String get relatorioPdfColunaFreqCardiaca => 'Heart rate';

  @override
  String calendarioTitulo(String nome) {
    return 'Calendar · $nome';
  }

  @override
  String get calendarioFiltroConsultas => 'Appointments';

  @override
  String get calendarioFiltroTratamentos => 'Treatments';

  @override
  String get calendarioFiltroCuidados => 'Daily care';

  @override
  String get calendarioMesFormato => 'Month';

  @override
  String get calendarioSemEventos => 'No events on this day.';

  @override
  String get avaliacaoTitulo => 'Are you enjoying CuidarPT?';

  @override
  String get avaliacaoDescricao =>
      'If CuidarPT is helping you care for someone who needs it, a store review helps other families find the app.';

  @override
  String get avaliacaoAgoraNao => 'Not now';

  @override
  String get avaliacaoAvaliar => 'Rate the app';

  @override
  String get freqCardiacaTitulo => 'Measure heart rate';

  @override
  String get freqCardiacaErroGenerico => 'An error occurred.';

  @override
  String get freqCardiacaComoMedir => 'How to measure';

  @override
  String get freqCardiacaInstrucoesIntro =>
      'On the back of your phone, the camera lens and the small flash LED are usually very close to each other, near the top corner. You need to cover both at the same time:';

  @override
  String get freqCardiacaPasso1 =>
      'Turn on the flash: it lights up on its own when the measurement starts.';

  @override
  String get freqCardiacaPasso2 =>
      'Place the tip of a finger (not the nail) to fully cover the camera lens and the flash at the same time.';

  @override
  String get freqCardiacaPasso3 =>
      'Press lightly — enough that no light gets in from the edges, but without squeezing hard.';

  @override
  String get freqCardiacaPasso4 =>
      'Keep your finger completely still until the measurement finishes (~12 seconds).';

  @override
  String get freqCardiacaAvisoNaoMedico =>
      'The app is not a medical device — the value is for information only.';

  @override
  String get freqCardiacaDicasTitulo => 'If it keeps failing, try this:';

  @override
  String get freqCardiacaDicasTexto =>
      '• Make sure you\'re covering the camera AND the flash, not just one of them.\n• Don\'t press hard — cutting off circulation makes the reading worse.\n• Rest your elbow on something stable so your finger doesn\'t shake.\n• Clean the lens if it has fingerprints or dirt.\n• Remove a very thick case that covers the flash poorly.';

  @override
  String get freqCardiacaAMedir =>
      'Measuring... keep your finger still, covering the camera and flash well.';

  @override
  String get freqCardiacaResultadoTitulo => 'Heart rate';

  @override
  String get freqCardiacaAvisoResultado =>
      'This value is for information only and is not a diagnosis. If in doubt or you have symptoms, consult a health professional.';

  @override
  String get freqCardiacaUsarValor => 'Use this value';

  @override
  String get freqCardiacaMedirNovamente => 'Measure again';

  @override
  String get freqCardiacaTentarNovamente => 'Try again';

  @override
  String get faixaBaixa => 'Low';

  @override
  String get faixaNormal => 'Normal';

  @override
  String get faixaElevada => 'High';

  @override
  String get comumTelefone => 'Phone';

  @override
  String notificacaoMedicacaoTitulo(String nome) {
    return 'Medication · $nome';
  }

  @override
  String notificacaoConsultaTitulo(String nome) {
    return 'Appointment · $nome';
  }

  @override
  String notificacaoProximaConsultaTitulo(String nome) {
    return 'Next appointment · $nome';
  }

  @override
  String notificacaoTratamentoTitulo(String nome) {
    return 'Treatment · $nome';
  }

  @override
  String get notificacaoTesteCorpo =>
      'Test notification — if you see this, notifications are working on this phone.';

  @override
  String get idosoFormEditarTitulo => 'Edit profile';

  @override
  String get idosoFormNovoTitulo => 'New profile';

  @override
  String get idosoFormRotinaUpsell =>
      'The hygiene and meals routine is a Premium feature. Subscribe to Premium to enable it.';

  @override
  String get idosoFormDataNascimentoHelp => 'Date of birth';

  @override
  String get idosoFormIdentificacao => 'Identification';

  @override
  String get idosoFormMobilidadeReduzida => 'Reduced mobility';

  @override
  String get idosoFormAcamado => 'Bedridden';

  @override
  String get idosoFormSexo => 'Sex';

  @override
  String get idosoFormMasculino => 'Male';

  @override
  String get idosoFormFeminino => 'Female';

  @override
  String get idosoFormNome => 'Name *';

  @override
  String get idosoFormNomeErro => 'Enter the person\'s name';

  @override
  String get idosoFormContactosEmergenciaTitulo => 'Emergency contacts';

  @override
  String get idosoFormRemoverContacto => 'Remove contact';

  @override
  String get idosoFormAdicionarContacto => 'Add contact';

  @override
  String get idosoFormSaude => 'Health';

  @override
  String get idosoFormNotasSaude => 'Notes (allergies, health conditions)';

  @override
  String get idosoFormPreferenciasHabitos => 'Preferences and habits';

  @override
  String get idosoFormComidaPreferida => 'Favorite food';

  @override
  String get idosoFormMusica => 'Music';

  @override
  String get idosoFormInteressesPessoais => 'Personal interests';

  @override
  String get idosoFormRotinaTitulo => 'Hygiene, meals and sleep routine';

  @override
  String get idosoFormRotinaDescricao =>
      'Premium feature. Record recurring items (e.g., bath, meals, nap) and mark them as done for the day.';

  @override
  String get notasEditarTooltip => 'Edit notes';

  @override
  String get notasHint => 'Allergies, preferences, general instructions...';

  @override
  String get notasSemNotas => 'No notes.';

  @override
  String get premiumSubscreverTitulo => 'Subscribe to Premium';

  @override
  String get premiumErroCarregarPlanos =>
      'Couldn\'t load the plans right now. Check your connection and try again later.';

  @override
  String premiumErroCarregar(String erro) {
    return 'Error loading plans: $erro';
  }

  @override
  String get premiumRestaurarCompra => 'Already subscribed — restore purchase';

  @override
  String get definicoesCancelarAntesTitulo => 'Before you cancel';

  @override
  String get definicoesJaConstruiste =>
      'You\'ve already built this in the app:';

  @override
  String definicoesPerfilIdoso(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count profiles',
      one: '1 profile',
    );
    return '$_temp0';
  }

  @override
  String definicoesMedicacaoRegistada(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medications recorded',
      one: '1 medication recorded',
    );
    return '$_temp0';
  }

  @override
  String definicoesConsultaTratamento(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count appointments/treatments',
      one: '1 appointment/treatment',
    );
    return '$_temp0';
  }

  @override
  String definicoesRegistoSinaisVitais(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vital signs records',
      one: '1 vital signs record',
    );
    return '$_temp0';
  }

  @override
  String get definicoesAoCancelarPremium =>
      'By canceling Premium, you\'ll no longer be able to:';

  @override
  String get definicoesPerdeVerPerfis => 'View more than 2 profiles';

  @override
  String get definicoesPerdeSinaisVitais => 'Record vital signs';

  @override
  String get definicoesPerdeRelatoriosPersonalizados => 'Customize PDF reports';

  @override
  String get definicoesPerdeHistoricoIlimitado =>
      'View unlimited report history and period';

  @override
  String get definicoesDadosContinuamGuardados =>
      'Your data stays saved on your phone — canceling doesn\'t delete anything.';

  @override
  String get definicoesVoltar => 'Back';

  @override
  String get definicoesContinuarPlayStore => 'Continue to Play Store';

  @override
  String get definicoesAparencia => 'Appearance';

  @override
  String get definicoesTema => 'Theme';

  @override
  String get definicoesTemaClaro => 'Light';

  @override
  String get definicoesTemaEscuro => 'Dark';

  @override
  String get definicoesTamanhoLetra => 'Font size';

  @override
  String get definicoesTamanhoPequeno => 'Small';

  @override
  String get definicoesTamanhoMedio => 'Medium';

  @override
  String get definicoesTamanhoGrande => 'Large';

  @override
  String get definicoesSubscricaoTitulo => 'Subscription';

  @override
  String get definicoesACarregar => 'Loading...';

  @override
  String definicoesTrialAtivo(int dias) {
    return 'Premium trial period — $dias day(s) left.';
  }

  @override
  String get definicoesPlanoPremiumAtivo => 'Premium plan active.';

  @override
  String get definicoesPlanoGratis => 'Free plan.';

  @override
  String get definicoesOQueInclui => 'What\'s included in Premium:';

  @override
  String get definicoesBeneficioPerfis => 'Unlimited profiles';

  @override
  String get definicoesBeneficioRelatorios =>
      'Customizable PDF reports (name/logo)';

  @override
  String get definicoesBeneficioHistorico =>
      'Unlimited report history and period';

  @override
  String get definicoesBeneficioMeteorologia => 'Official weather alerts';

  @override
  String get definicoesPrecos => '€1.99/month · €9.99/6 months · €19.99/year';

  @override
  String get definicoesGerirCancelar => 'Manage or cancel subscription';

  @override
  String get definicoesPerfisIdosos => 'Profiles';

  @override
  String get definicoesIlimitados => 'unlimited';

  @override
  String definicoesPerfisEmUso(int total, String limite) {
    return '$total of $limite profiles in use.';
  }

  @override
  String get definicoesVerPerfis => 'View profiles';

  @override
  String get definicoesNotificacoes => 'Notifications';

  @override
  String get definicoesNotificacoesDescricao =>
      'Medication and appointment reminders are local notifications, scheduled directly on this phone.';

  @override
  String get definicoesTestarNotificacao => 'Test notification now';

  @override
  String get definicoesNotificacaoTesteEnviada =>
      'Test notification sent — check your notification bar.';

  @override
  String get definicoesTroubleshootingNotificacoes =>
      'If the test notification doesn\'t show up, or scheduled reminders don\'t arrive: check in Android Settings → Apps → CuidarPT → Notifications, whether they\'re allowed; and in Battery, whether battery optimization is disabled for CuidarPT (on some phones called \"unrestricted\" or \"allow background activity\"). Many brands (Xiaomi, Samsung, Huawei, etc.) block app reminders in the background by default.';

  @override
  String get definicoesSobre => 'About';

  @override
  String definicoesVersaoSufixo(String versao) {
    return ' — version $versao';
  }

  @override
  String get definicoesDadosSoTelemovel =>
      'All data is stored only on this phone.';

  @override
  String get definicoesAvisoNaoDispositivoMedico =>
      'CuidarPT is not a medical device and does not replace assessment, diagnosis or treatment by a health professional.';

  @override
  String get definicoesPoliticaPrivacidade => 'Privacy policy';

  @override
  String get premiumPlanoMensal => 'Monthly';

  @override
  String get premiumPlano6Meses => '6 months';

  @override
  String get premiumPlanoAnual => 'Yearly';

  @override
  String premiumPoupancaLabel(int percentagem, String valor) {
    return 'Save $percentagem% · equals $valor/month';
  }

  @override
  String erroArranqueTexto(String erro) {
    return 'An error occurred while loading the app: $erro';
  }
}
