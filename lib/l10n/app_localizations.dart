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

  /// No description provided for @comumCancelar.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get comumCancelar;

  /// No description provided for @comumApagar.
  ///
  /// In pt, this message translates to:
  /// **'Apagar'**
  String get comumApagar;

  /// No description provided for @comumGuardar.
  ///
  /// In pt, this message translates to:
  /// **'Guardar'**
  String get comumGuardar;

  /// No description provided for @comumDefinicoes.
  ///
  /// In pt, this message translates to:
  /// **'Definições'**
  String get comumDefinicoes;

  /// No description provided for @comumSinaisVitaisPremiumMensagem.
  ///
  /// In pt, this message translates to:
  /// **'Registar sinais vitais é uma funcionalidade Premium. Subscreve o Premium para a usares.'**
  String get comumSinaisVitaisPremiumMensagem;

  /// No description provided for @proximoEventoFaltamDias.
  ///
  /// In pt, this message translates to:
  /// **'{dias, plural, =1{falta 1 dia} other{faltam {dias} dias}}'**
  String proximoEventoFaltamDias(int dias);

  /// No description provided for @proximoEventoFaltamHoras.
  ///
  /// In pt, this message translates to:
  /// **'faltam {horas}h'**
  String proximoEventoFaltamHoras(int horas);

  /// No description provided for @proximoEventoFaltamMinutos.
  ///
  /// In pt, this message translates to:
  /// **'faltam {minutos} min'**
  String proximoEventoFaltamMinutos(int minutos);

  /// No description provided for @homeTrialDias.
  ///
  /// In pt, this message translates to:
  /// **'Trial: {dias}d'**
  String homeTrialDias(int dias);

  /// No description provided for @homeErroCarregarPerfis.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar perfis: {erro}'**
  String homeErroCarregarPerfis(String erro);

  /// No description provided for @homeCriarNovoPerfil.
  ///
  /// In pt, this message translates to:
  /// **'Criar novo perfil'**
  String get homeCriarNovoPerfil;

  /// No description provided for @homeEmptyStateTexto.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não tens nenhum perfil de idoso.\nToca em \"Criar novo perfil\" para criares o primeiro.'**
  String get homeEmptyStateTexto;

  /// No description provided for @homeLimiteIdososMensagem.
  ///
  /// In pt, this message translates to:
  /// **'{limite, plural, =1{O plano Grátis permite 1 perfil de idoso. Subscreve o Premium para adicionares mais perfis.} other{O plano Grátis permite {limite} perfis de idoso. Subscreve o Premium para adicionares mais perfis.}}'**
  String homeLimiteIdososMensagem(int limite);

  /// No description provided for @homeApagarPerfilTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar perfil'**
  String get homeApagarPerfilTitulo;

  /// No description provided for @homeApagarPerfilConfirmacao.
  ///
  /// In pt, this message translates to:
  /// **'Queres mesmo apagar o perfil de {nome}?'**
  String homeApagarPerfilConfirmacao(String nome);

  /// No description provided for @homeLembretesTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Lembretes'**
  String get homeLembretesTitulo;

  /// No description provided for @homeLembretesContagem.
  ///
  /// In pt, this message translates to:
  /// **'{total, plural, =1{1 próximo} other{{total} próximos}}'**
  String homeLembretesContagem(int total);

  /// No description provided for @homeEscolherIdosoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Para qual idoso?'**
  String get homeEscolherIdosoTitulo;

  /// No description provided for @homeAcaoMedicacao.
  ///
  /// In pt, this message translates to:
  /// **'Medicação'**
  String get homeAcaoMedicacao;

  /// No description provided for @homeAcaoConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Consulta'**
  String get homeAcaoConsulta;

  /// No description provided for @homeAcaoSinaisVitais.
  ///
  /// In pt, this message translates to:
  /// **'Sinais vitais'**
  String get homeAcaoSinaisVitais;

  /// No description provided for @homeAcaoRelatorio.
  ///
  /// In pt, this message translates to:
  /// **'Relatório'**
  String get homeAcaoRelatorio;

  /// No description provided for @homeIdosoSemDataNascimento.
  ///
  /// In pt, this message translates to:
  /// **'Data de nascimento não definida'**
  String get homeIdosoSemDataNascimento;

  /// No description provided for @homeIdosoDataNascimento.
  ///
  /// In pt, this message translates to:
  /// **'Nascimento: {data}'**
  String homeIdosoDataNascimento(String data);

  /// No description provided for @idosoDetailLigarEmergencia.
  ///
  /// In pt, this message translates to:
  /// **'Ligar para contacto de emergência'**
  String get idosoDetailLigarEmergencia;

  /// No description provided for @idosoDetailCalendario.
  ///
  /// In pt, this message translates to:
  /// **'Calendário'**
  String get idosoDetailCalendario;

  /// No description provided for @idosoDetailGerarRelatorio.
  ///
  /// In pt, this message translates to:
  /// **'Gerar relatório'**
  String get idosoDetailGerarRelatorio;

  /// No description provided for @idosoDetailEditarPerfil.
  ///
  /// In pt, this message translates to:
  /// **'Editar perfil'**
  String get idosoDetailEditarPerfil;

  /// No description provided for @idosoDetailProfissionais.
  ///
  /// In pt, this message translates to:
  /// **'Profissionais'**
  String get idosoDetailProfissionais;

  /// No description provided for @idosoDetailAdicionarMedicacao.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar medicação'**
  String get idosoDetailAdicionarMedicacao;

  /// No description provided for @idosoDetailErroCarregarMedicacao.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar medicação: {erro}'**
  String idosoDetailErroCarregarMedicacao(String erro);

  /// No description provided for @idosoDetailConsultasTratamentosTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Consultas e tratamentos'**
  String get idosoDetailConsultasTratamentosTitulo;

  /// No description provided for @idosoDetailAdicionarConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar consulta ou tratamento'**
  String get idosoDetailAdicionarConsulta;

  /// No description provided for @idosoDetailErroCarregarConsultas.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar consultas: {erro}'**
  String idosoDetailErroCarregarConsultas(String erro);

  /// No description provided for @idosoDetailGerarRelatorioDiario.
  ///
  /// In pt, this message translates to:
  /// **'Gerar relatório diário'**
  String get idosoDetailGerarRelatorioDiario;

  /// No description provided for @idosoDetailProximaToma.
  ///
  /// In pt, this message translates to:
  /// **'Próxima toma'**
  String get idosoDetailProximaToma;

  /// No description provided for @idosoDetailProximaConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Próxima consulta'**
  String get idosoDetailProximaConsulta;

  /// No description provided for @idosoDetailEmergenciaContacto.
  ///
  /// In pt, this message translates to:
  /// **'Emergência: {nome} {telefone}'**
  String idosoDetailEmergenciaContacto(String nome, String telefone);

  /// No description provided for @idosoDetailMudarHumor.
  ///
  /// In pt, this message translates to:
  /// **'Mudar'**
  String get idosoDetailMudarHumor;

  /// No description provided for @humorComDores.
  ///
  /// In pt, this message translates to:
  /// **'Com dores'**
  String get humorComDores;

  /// No description provided for @humorCansado.
  ///
  /// In pt, this message translates to:
  /// **'Cansado'**
  String get humorCansado;

  /// No description provided for @humorSonolento.
  ///
  /// In pt, this message translates to:
  /// **'Sonolento'**
  String get humorSonolento;

  /// No description provided for @humorNormal.
  ///
  /// In pt, this message translates to:
  /// **'Normal'**
  String get humorNormal;

  /// No description provided for @humorEnergico.
  ///
  /// In pt, this message translates to:
  /// **'Enérgico'**
  String get humorEnergico;

  /// No description provided for @humorContente.
  ///
  /// In pt, this message translates to:
  /// **'Contente'**
  String get humorContente;

  /// No description provided for @idosoDetailVerMenos.
  ///
  /// In pt, this message translates to:
  /// **'Ver menos'**
  String get idosoDetailVerMenos;

  /// No description provided for @idosoDetailVerTodas.
  ///
  /// In pt, this message translates to:
  /// **'Ver todas ({total})'**
  String idosoDetailVerTodas(int total);

  /// No description provided for @idosoDetailSemMedicacao.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há medicação registada.'**
  String get idosoDetailSemMedicacao;

  /// No description provided for @idosoDetailSemConsultas.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há consultas ou tratamentos registados.'**
  String get idosoDetailSemConsultas;

  /// No description provided for @idosoDetailApagarItemConfirmacao.
  ///
  /// In pt, this message translates to:
  /// **'Queres mesmo apagar \"{nome}\"?'**
  String idosoDetailApagarItemConfirmacao(String nome);

  /// No description provided for @idosoDetailApagarMedicacaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar medicação'**
  String get idosoDetailApagarMedicacaoTitulo;

  /// No description provided for @idosoDetailApagarTratamentoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar tratamento'**
  String get idosoDetailApagarTratamentoTitulo;

  /// No description provided for @idosoDetailApagarConsultaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar consulta'**
  String get idosoDetailApagarConsultaTitulo;

  /// No description provided for @idosoDetailStatusPausada.
  ///
  /// In pt, this message translates to:
  /// **'pausada'**
  String get idosoDetailStatusPausada;

  /// No description provided for @idosoDetailProximaData.
  ///
  /// In pt, this message translates to:
  /// **'próxima: {data}'**
  String idosoDetailProximaData(String data);

  /// No description provided for @idosoDetailComoSenteHojeTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Como se sente hoje?'**
  String get idosoDetailComoSenteHojeTitulo;

  /// No description provided for @premiumUpsellTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Funcionalidade Premium'**
  String get premiumUpsellTitulo;

  /// No description provided for @premiumUpsellBotao.
  ///
  /// In pt, this message translates to:
  /// **'Entendido'**
  String get premiumUpsellBotao;

  /// No description provided for @alertaPressaoMuitoElevada.
  ///
  /// In pt, this message translates to:
  /// **'Pressão arterial muito elevada (possível crise hipertensiva)'**
  String get alertaPressaoMuitoElevada;

  /// No description provided for @alertaPressaoElevada.
  ///
  /// In pt, this message translates to:
  /// **'Pressão arterial elevada (hipertensão)'**
  String get alertaPressaoElevada;

  /// No description provided for @alertaPressaoBaixa.
  ///
  /// In pt, this message translates to:
  /// **'Pressão arterial baixa (hipotensão)'**
  String get alertaPressaoBaixa;

  /// No description provided for @alertaFebreAlta.
  ///
  /// In pt, this message translates to:
  /// **'Febre alta'**
  String get alertaFebreAlta;

  /// No description provided for @alertaFebre.
  ///
  /// In pt, this message translates to:
  /// **'Febre'**
  String get alertaFebre;

  /// No description provided for @alertaHipotermia.
  ///
  /// In pt, this message translates to:
  /// **'Temperatura corporal muito baixa (hipotermia)'**
  String get alertaHipotermia;

  /// No description provided for @alertaGlicemiaBaixa.
  ///
  /// In pt, this message translates to:
  /// **'Glicemia baixa (hipoglicemia)'**
  String get alertaGlicemiaBaixa;

  /// No description provided for @alertaGlicemiaMuitoElevada.
  ///
  /// In pt, this message translates to:
  /// **'Glicemia muito elevada'**
  String get alertaGlicemiaMuitoElevada;

  /// No description provided for @alertaGlicemiaElevada.
  ///
  /// In pt, this message translates to:
  /// **'Glicemia elevada'**
  String get alertaGlicemiaElevada;

  /// No description provided for @alertaFrequenciaBaixa.
  ///
  /// In pt, this message translates to:
  /// **'Frequência cardíaca baixa (bradicardia)'**
  String get alertaFrequenciaBaixa;

  /// No description provided for @alertaFrequenciaElevada.
  ///
  /// In pt, this message translates to:
  /// **'Frequência cardíaca elevada (taquicardia)'**
  String get alertaFrequenciaElevada;

  /// No description provided for @alertaSinaisVitaisAviso.
  ///
  /// In pt, this message translates to:
  /// **'Valores de referência gerais da OMS para adultos em repouso. Não substitui avaliação médica.'**
  String get alertaSinaisVitaisAviso;

  /// No description provided for @sinaisVitaisUpsellDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Funcionalidade Premium: pressão, temperatura, glicemia, frequência cardíaca.'**
  String get sinaisVitaisUpsellDescricao;

  /// No description provided for @sinaisVitaisTooltipHistorico.
  ///
  /// In pt, this message translates to:
  /// **'Histórico em gráfico'**
  String get sinaisVitaisTooltipHistorico;

  /// No description provided for @sinaisVitaisTooltipNovoRegisto.
  ///
  /// In pt, this message translates to:
  /// **'Novo registo de sinais vitais'**
  String get sinaisVitaisTooltipNovoRegisto;

  /// No description provided for @sinaisVitaisSemRegistos.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há registos de sinais vitais.'**
  String get sinaisVitaisSemRegistos;

  /// No description provided for @sinaisVitaisSemRegistoHoje.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não registou sinais vitais hoje.'**
  String get sinaisVitaisSemRegistoHoje;

  /// No description provided for @sinaisVitaisVerTodos.
  ///
  /// In pt, this message translates to:
  /// **'Ver todos ({total})'**
  String sinaisVitaisVerTodos(int total);

  /// No description provided for @sinaisVitaisApagarTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar registo'**
  String get sinaisVitaisApagarTitulo;

  /// No description provided for @sinaisVitaisApagarConfirmacao.
  ///
  /// In pt, this message translates to:
  /// **'Queres mesmo apagar este registo de sinais vitais?'**
  String get sinaisVitaisApagarConfirmacao;

  /// No description provided for @sinaisVitaisSemValores.
  ///
  /// In pt, this message translates to:
  /// **'Sem valores registados'**
  String get sinaisVitaisSemValores;

  /// No description provided for @sinaisVitaisErroCarregar.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar sinais vitais: {erro}'**
  String sinaisVitaisErroCarregar(String erro);

  /// No description provided for @sinaisVitaisFormEditarTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Editar sinais vitais'**
  String get sinaisVitaisFormEditarTitulo;

  /// No description provided for @sinaisVitaisFormNovoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Novos sinais vitais'**
  String get sinaisVitaisFormNovoTitulo;

  /// No description provided for @sinaisVitaisFormDataRegisto.
  ///
  /// In pt, this message translates to:
  /// **'Data do registo'**
  String get sinaisVitaisFormDataRegisto;

  /// No description provided for @sinaisVitaisFormHoraRegisto.
  ///
  /// In pt, this message translates to:
  /// **'Hora do registo'**
  String get sinaisVitaisFormHoraRegisto;

  /// No description provided for @sinaisVitaisFormPressaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Pressão arterial (mmHg)'**
  String get sinaisVitaisFormPressaoTitulo;

  /// No description provided for @sinaisVitaisFormSistolica.
  ///
  /// In pt, this message translates to:
  /// **'Sistólica (máxima)'**
  String get sinaisVitaisFormSistolica;

  /// No description provided for @sinaisVitaisFormDiastolica.
  ///
  /// In pt, this message translates to:
  /// **'Diastólica (mínima)'**
  String get sinaisVitaisFormDiastolica;

  /// No description provided for @sinaisVitaisFormTemperatura.
  ///
  /// In pt, this message translates to:
  /// **'Temperatura (°C)'**
  String get sinaisVitaisFormTemperatura;

  /// No description provided for @sinaisVitaisFormGlicemia.
  ///
  /// In pt, this message translates to:
  /// **'Glicemia (mg/dL)'**
  String get sinaisVitaisFormGlicemia;

  /// No description provided for @sinaisVitaisFormFrequencia.
  ///
  /// In pt, this message translates to:
  /// **'Frequência cardíaca (bpm)'**
  String get sinaisVitaisFormFrequencia;

  /// No description provided for @sinaisVitaisFormMedirCamara.
  ///
  /// In pt, this message translates to:
  /// **'Medir com a câmara'**
  String get sinaisVitaisFormMedirCamara;

  /// No description provided for @sinaisVitaisFormPeso.
  ///
  /// In pt, this message translates to:
  /// **'Peso (kg)'**
  String get sinaisVitaisFormPeso;

  /// No description provided for @sinaisVitaisFormDataHora.
  ///
  /// In pt, this message translates to:
  /// **'Data e hora'**
  String get sinaisVitaisFormDataHora;

  /// No description provided for @sinaisVitaisFormNotas.
  ///
  /// In pt, this message translates to:
  /// **'Notas'**
  String get sinaisVitaisFormNotas;

  /// No description provided for @sinaisVitaisHistoricoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Histórico de sinais vitais'**
  String get sinaisVitaisHistoricoTitulo;

  /// No description provided for @sinaisVitaisHistorico7Dias.
  ///
  /// In pt, this message translates to:
  /// **'7 dias'**
  String get sinaisVitaisHistorico7Dias;

  /// No description provided for @sinaisVitaisHistorico30Dias.
  ///
  /// In pt, this message translates to:
  /// **'30 dias'**
  String get sinaisVitaisHistorico30Dias;

  /// No description provided for @sinaisVitaisHistoricoPressaoSistolica.
  ///
  /// In pt, this message translates to:
  /// **'Pressão sistólica'**
  String get sinaisVitaisHistoricoPressaoSistolica;

  /// No description provided for @sinaisVitaisHistoricoPressaoDiastolica.
  ///
  /// In pt, this message translates to:
  /// **'Pressão diastólica'**
  String get sinaisVitaisHistoricoPressaoDiastolica;

  /// No description provided for @sinaisVitaisHistoricoTemperaturaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Temperatura'**
  String get sinaisVitaisHistoricoTemperaturaTitulo;

  /// No description provided for @sinaisVitaisHistoricoGlicemia.
  ///
  /// In pt, this message translates to:
  /// **'Glicemia'**
  String get sinaisVitaisHistoricoGlicemia;

  /// No description provided for @sinaisVitaisHistoricoFrequenciaCardiaca.
  ///
  /// In pt, this message translates to:
  /// **'Frequência cardíaca'**
  String get sinaisVitaisHistoricoFrequenciaCardiaca;

  /// No description provided for @sinaisVitaisHistoricoPeso.
  ///
  /// In pt, this message translates to:
  /// **'Peso'**
  String get sinaisVitaisHistoricoPeso;

  /// No description provided for @sinaisVitaisHistoricoMedia.
  ///
  /// In pt, this message translates to:
  /// **'Média: {valor} {unidade}'**
  String sinaisVitaisHistoricoMedia(String valor, String unidade);

  /// No description provided for @sinaisVitaisHistoricoSemRegistos.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há registos neste período.'**
  String get sinaisVitaisHistoricoSemRegistos;

  /// No description provided for @comumNome.
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get comumNome;

  /// No description provided for @comumEmail.
  ///
  /// In pt, this message translates to:
  /// **'Email'**
  String get comumEmail;

  /// No description provided for @documentosTirarFotografia.
  ///
  /// In pt, this message translates to:
  /// **'Tirar fotografia'**
  String get documentosTirarFotografia;

  /// No description provided for @documentosEscolherGaleria.
  ///
  /// In pt, this message translates to:
  /// **'Escolher da galeria'**
  String get documentosEscolherGaleria;

  /// No description provided for @documentosNomeTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Nome do documento'**
  String get documentosNomeTitulo;

  /// No description provided for @documentosNomeHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Receita Dr. Silva, Análises 2026'**
  String get documentosNomeHint;

  /// No description provided for @documentosTituloOmissao.
  ///
  /// In pt, this message translates to:
  /// **'Documento {data}'**
  String documentosTituloOmissao(String data);

  /// No description provided for @documentosApagarTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Apagar documento'**
  String get documentosApagarTitulo;

  /// No description provided for @documentosApagarConfirmacao.
  ///
  /// In pt, this message translates to:
  /// **'Queres mesmo apagar \"{titulo}\"?'**
  String documentosApagarConfirmacao(String titulo);

  /// No description provided for @documentosTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Documentos'**
  String get documentosTitulo;

  /// No description provided for @documentosNenhum.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum documento'**
  String get documentosNenhum;

  /// No description provided for @documentosContagem.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 documento} other{{count} documentos}}'**
  String documentosContagem(int count);

  /// No description provided for @documentosDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Receitas e exames guardados apenas neste telemóvel.'**
  String get documentosDescricao;

  /// No description provided for @documentosAdicionarTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar documento'**
  String get documentosAdicionarTooltip;

  /// No description provided for @documentosSemDocumentos.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há documentos guardados.'**
  String get documentosSemDocumentos;

  /// No description provided for @contactosCuidadoresNovoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Novo contacto'**
  String get contactosCuidadoresNovoTitulo;

  /// No description provided for @contactosCuidadoresTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Contactos de cuidadores'**
  String get contactosCuidadoresTitulo;

  /// No description provided for @contactosCuidadoresAdicionarTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar contacto'**
  String get contactosCuidadoresAdicionarTooltip;

  /// No description provided for @contactosCuidadoresDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Usados para escolher rapidamente com quem partilhar um relatório.'**
  String get contactosCuidadoresDescricao;

  /// No description provided for @contactosCuidadoresSemContactos.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há contactos guardados.'**
  String get contactosCuidadoresSemContactos;

  /// No description provided for @contactosCuidadoresApagarTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Apagar contacto'**
  String get contactosCuidadoresApagarTooltip;

  /// No description provided for @contactosCuidadoresErro.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar contactos: {erro}'**
  String contactosCuidadoresErro(String erro);

  /// No description provided for @rotinaCategoriaHigiene.
  ///
  /// In pt, this message translates to:
  /// **'Higiene'**
  String get rotinaCategoriaHigiene;

  /// No description provided for @rotinaCategoriaAlimentacao.
  ///
  /// In pt, this message translates to:
  /// **'Alimentação'**
  String get rotinaCategoriaAlimentacao;

  /// No description provided for @rotinaCategoriaSono.
  ///
  /// In pt, this message translates to:
  /// **'Sono'**
  String get rotinaCategoriaSono;

  /// No description provided for @rotinaCategoriaAtividade.
  ///
  /// In pt, this message translates to:
  /// **'Atividade'**
  String get rotinaCategoriaAtividade;

  /// No description provided for @rotinaSugestaoBanho.
  ///
  /// In pt, this message translates to:
  /// **'Banho'**
  String get rotinaSugestaoBanho;

  /// No description provided for @rotinaSugestaoEscovarDentes.
  ///
  /// In pt, this message translates to:
  /// **'Escovar os dentes'**
  String get rotinaSugestaoEscovarDentes;

  /// No description provided for @rotinaSugestaoHigieneIntima.
  ///
  /// In pt, this message translates to:
  /// **'Higiene íntima'**
  String get rotinaSugestaoHigieneIntima;

  /// No description provided for @rotinaSugestaoPentearCabelo.
  ///
  /// In pt, this message translates to:
  /// **'Pentear/arranjar cabelo'**
  String get rotinaSugestaoPentearCabelo;

  /// No description provided for @rotinaSugestaoPequenoAlmoco.
  ///
  /// In pt, this message translates to:
  /// **'Pequeno-almoço'**
  String get rotinaSugestaoPequenoAlmoco;

  /// No description provided for @rotinaSugestaoAlmoco.
  ///
  /// In pt, this message translates to:
  /// **'Almoço'**
  String get rotinaSugestaoAlmoco;

  /// No description provided for @rotinaSugestaoLanche.
  ///
  /// In pt, this message translates to:
  /// **'Lanche'**
  String get rotinaSugestaoLanche;

  /// No description provided for @rotinaSugestaoJantar.
  ///
  /// In pt, this message translates to:
  /// **'Jantar'**
  String get rotinaSugestaoJantar;

  /// No description provided for @rotinaSugestaoHidratacao.
  ///
  /// In pt, this message translates to:
  /// **'Hidratação/Água'**
  String get rotinaSugestaoHidratacao;

  /// No description provided for @rotinaSugestaoSesta.
  ///
  /// In pt, this message translates to:
  /// **'Sesta'**
  String get rotinaSugestaoSesta;

  /// No description provided for @rotinaSugestaoDeitarNoite.
  ///
  /// In pt, this message translates to:
  /// **'Deitar à noite'**
  String get rotinaSugestaoDeitarNoite;

  /// No description provided for @rotinaSugestaoAcordar.
  ///
  /// In pt, this message translates to:
  /// **'Acordar'**
  String get rotinaSugestaoAcordar;

  /// No description provided for @rotinaSugestaoPasseio.
  ///
  /// In pt, this message translates to:
  /// **'Passeio'**
  String get rotinaSugestaoPasseio;

  /// No description provided for @rotinaSugestaoExercicios.
  ///
  /// In pt, this message translates to:
  /// **'Exercícios'**
  String get rotinaSugestaoExercicios;

  /// No description provided for @rotinaSugestaoAlongamentos.
  ///
  /// In pt, this message translates to:
  /// **'Alongamentos'**
  String get rotinaSugestaoAlongamentos;

  /// No description provided for @rotinaNovoItemTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Novo item de rotina'**
  String get rotinaNovoItemTitulo;

  /// No description provided for @rotinaNovoItemHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Banho, Pequeno-almoço'**
  String get rotinaNovoItemHint;

  /// No description provided for @rotinaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Rotina de higiene, alimentação, sono e atividade'**
  String get rotinaTitulo;

  /// No description provided for @rotinaNenhumItem.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum item'**
  String get rotinaNenhumItem;

  /// No description provided for @rotinaContagemItens.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} itens}}'**
  String rotinaContagemItens(int count);

  /// No description provided for @rotinaSelecionarVarios.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar vários'**
  String get rotinaSelecionarVarios;

  /// No description provided for @rotinaFotoPrato.
  ///
  /// In pt, this message translates to:
  /// **'Foto do prato'**
  String get rotinaFotoPrato;

  /// No description provided for @rotinaApagarItem.
  ///
  /// In pt, this message translates to:
  /// **'Apagar item'**
  String get rotinaApagarItem;

  /// No description provided for @rotinaMarcarComoFeito.
  ///
  /// In pt, this message translates to:
  /// **'Marcar como feito'**
  String get rotinaMarcarComoFeito;

  /// No description provided for @rotinaMarcarNComoFeito.
  ///
  /// In pt, this message translates to:
  /// **'Marcar {count} como feito'**
  String rotinaMarcarNComoFeito(int count);

  /// No description provided for @rotinaAdicionarItem.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar item'**
  String get rotinaAdicionarItem;

  /// No description provided for @humorGraficoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Estado de Humor'**
  String get humorGraficoTitulo;

  /// No description provided for @humorGraficoSemRegistos.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há registos de humor neste período.'**
  String get humorGraficoSemRegistos;

  /// No description provided for @diaSegAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Seg'**
  String get diaSegAbrev;

  /// No description provided for @diaTerAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Ter'**
  String get diaTerAbrev;

  /// No description provided for @diaQuaAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Qua'**
  String get diaQuaAbrev;

  /// No description provided for @diaQuiAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Qui'**
  String get diaQuiAbrev;

  /// No description provided for @diaSexAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Sex'**
  String get diaSexAbrev;

  /// No description provided for @diaSabAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Sáb'**
  String get diaSabAbrev;

  /// No description provided for @diaDomAbrev.
  ///
  /// In pt, this message translates to:
  /// **'Dom'**
  String get diaDomAbrev;

  /// No description provided for @horariosTodosDias.
  ///
  /// In pt, this message translates to:
  /// **'Todos os dias'**
  String get horariosTodosDias;

  /// No description provided for @medicacaoFormEditarTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Editar medicação'**
  String get medicacaoFormEditarTitulo;

  /// No description provided for @medicacaoFormNovoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Nova medicação'**
  String get medicacaoFormNovoTitulo;

  /// No description provided for @medicacaoFormNome.
  ///
  /// In pt, this message translates to:
  /// **'Nome do medicamento *'**
  String get medicacaoFormNome;

  /// No description provided for @medicacaoFormNomeErro.
  ///
  /// In pt, this message translates to:
  /// **'Indica o nome do medicamento'**
  String get medicacaoFormNomeErro;

  /// No description provided for @medicacaoFormDose.
  ///
  /// In pt, this message translates to:
  /// **'Dose'**
  String get medicacaoFormDose;

  /// No description provided for @medicacaoFormDoseHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: 1 comprimido, 500 mg, 10 gotas'**
  String get medicacaoFormDoseHint;

  /// No description provided for @medicacaoFormVia.
  ///
  /// In pt, this message translates to:
  /// **'Via de administração'**
  String get medicacaoFormVia;

  /// No description provided for @medicacaoFormViaHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Oral, Intravenosa'**
  String get medicacaoFormViaHint;

  /// No description provided for @medicacaoFormHorariosTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Horários *'**
  String get medicacaoFormHorariosTitulo;

  /// No description provided for @medicacaoFormPreenchimentoRapido.
  ///
  /// In pt, this message translates to:
  /// **'Preenchimento rápido por frequência (substitui os horários atuais):'**
  String get medicacaoFormPreenchimentoRapido;

  /// No description provided for @medicacaoForm1xDia.
  ///
  /// In pt, this message translates to:
  /// **'1x por dia'**
  String get medicacaoForm1xDia;

  /// No description provided for @medicacaoForm12h.
  ///
  /// In pt, this message translates to:
  /// **'De 12 em 12h'**
  String get medicacaoForm12h;

  /// No description provided for @medicacaoForm8h.
  ///
  /// In pt, this message translates to:
  /// **'De 8 em 8h'**
  String get medicacaoForm8h;

  /// No description provided for @medicacaoFormPrimeiraToma.
  ///
  /// In pt, this message translates to:
  /// **'Primeira toma'**
  String get medicacaoFormPrimeiraToma;

  /// No description provided for @medicacaoFormAdicionarHorario.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar horário'**
  String get medicacaoFormAdicionarHorario;

  /// No description provided for @medicacaoFormErroHorarios.
  ///
  /// In pt, this message translates to:
  /// **'Adiciona pelo menos um horário'**
  String get medicacaoFormErroHorarios;

  /// No description provided for @medicacaoFormDiasSemanaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Dias da semana'**
  String get medicacaoFormDiasSemanaTitulo;

  /// No description provided for @medicacaoFormDiasSemanaDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Não escolhas nenhum para tomar todos os dias.'**
  String get medicacaoFormDiasSemanaDescricao;

  /// No description provided for @medicacaoFormDataInicio.
  ///
  /// In pt, this message translates to:
  /// **'Data de início'**
  String get medicacaoFormDataInicio;

  /// No description provided for @medicacaoFormDataFim.
  ///
  /// In pt, this message translates to:
  /// **'Data de fim (opcional)'**
  String get medicacaoFormDataFim;

  /// No description provided for @medicacaoFormNaoDefinida.
  ///
  /// In pt, this message translates to:
  /// **'Não definida'**
  String get medicacaoFormNaoDefinida;

  /// No description provided for @medicacaoFormSemDataDefinida.
  ///
  /// In pt, this message translates to:
  /// **'Sem data definida'**
  String get medicacaoFormSemDataDefinida;

  /// No description provided for @medicacaoFormLembretesAtivos.
  ///
  /// In pt, this message translates to:
  /// **'Lembretes ativos'**
  String get medicacaoFormLembretesAtivos;

  /// No description provided for @medicacaoFormLembretesDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Desliga para pausar sem apagar o registo'**
  String get medicacaoFormLembretesDescricao;

  /// No description provided for @consultaFormEditarTratamento.
  ///
  /// In pt, this message translates to:
  /// **'Editar tratamento'**
  String get consultaFormEditarTratamento;

  /// No description provided for @consultaFormEditarConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Editar consulta'**
  String get consultaFormEditarConsulta;

  /// No description provided for @consultaFormNovoTratamento.
  ///
  /// In pt, this message translates to:
  /// **'Novo tratamento'**
  String get consultaFormNovoTratamento;

  /// No description provided for @consultaFormNovaConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Nova consulta'**
  String get consultaFormNovaConsulta;

  /// No description provided for @consultaFormDataConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Data da consulta'**
  String get consultaFormDataConsulta;

  /// No description provided for @consultaFormHoraConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Hora da consulta'**
  String get consultaFormHoraConsulta;

  /// No description provided for @consultaFormTipoConsultaMedica.
  ///
  /// In pt, this message translates to:
  /// **'Consulta médica'**
  String get consultaFormTipoConsultaMedica;

  /// No description provided for @consultaFormTipoTratamento.
  ///
  /// In pt, this message translates to:
  /// **'Tratamento'**
  String get consultaFormTipoTratamento;

  /// No description provided for @consultaFormTipoTratamentoLabel.
  ///
  /// In pt, this message translates to:
  /// **'Tipo de tratamento *'**
  String get consultaFormTipoTratamentoLabel;

  /// No description provided for @consultaFormEspecialidadeLabel.
  ///
  /// In pt, this message translates to:
  /// **'Especialidade *'**
  String get consultaFormEspecialidadeLabel;

  /// No description provided for @consultaFormTipoTratamentoHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Fisioterapia, Enfermagem'**
  String get consultaFormTipoTratamentoHint;

  /// No description provided for @consultaFormEspecialidadeHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Clínica geral, Cardiologia'**
  String get consultaFormEspecialidadeHint;

  /// No description provided for @consultaFormTipoTratamentoErro.
  ///
  /// In pt, this message translates to:
  /// **'Indica o tipo de tratamento'**
  String get consultaFormTipoTratamentoErro;

  /// No description provided for @consultaFormEspecialidadeErro.
  ///
  /// In pt, this message translates to:
  /// **'Indica a especialidade'**
  String get consultaFormEspecialidadeErro;

  /// No description provided for @consultaFormLocal.
  ///
  /// In pt, this message translates to:
  /// **'Local'**
  String get consultaFormLocal;

  /// No description provided for @consultaFormLocalHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Centro de Saúde, Hospital, Clínica privada'**
  String get consultaFormLocalHint;

  /// No description provided for @consultaFormProfissional.
  ///
  /// In pt, this message translates to:
  /// **'Profissional'**
  String get consultaFormProfissional;

  /// No description provided for @consultaFormNomeMedico.
  ///
  /// In pt, this message translates to:
  /// **'Nome do médico'**
  String get consultaFormNomeMedico;

  /// No description provided for @consultaFormProfissionalHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Enf. Maria Santos'**
  String get consultaFormProfissionalHint;

  /// No description provided for @consultaFormNomeMedicoHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Dr. António Silva'**
  String get consultaFormNomeMedicoHint;

  /// No description provided for @consultaFormTratamentoRecorrente.
  ///
  /// In pt, this message translates to:
  /// **'Tratamento recorrente'**
  String get consultaFormTratamentoRecorrente;

  /// No description provided for @consultaFormTratamentoRecorrenteDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Repete-se diariamente ou em dias específicos da semana'**
  String get consultaFormTratamentoRecorrenteDescricao;

  /// No description provided for @consultaFormDataHoraInicio.
  ///
  /// In pt, this message translates to:
  /// **'Data e hora de início'**
  String get consultaFormDataHoraInicio;

  /// No description provided for @consultaFormDataHora.
  ///
  /// In pt, this message translates to:
  /// **'Data e hora'**
  String get consultaFormDataHora;

  /// No description provided for @consultaFormDiasSemanaDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Não escolhas nenhum para repetir todos os dias.'**
  String get consultaFormDiasSemanaDescricao;

  /// No description provided for @consultaFormProximoTratamento.
  ///
  /// In pt, this message translates to:
  /// **'Próximo tratamento (opcional)'**
  String get consultaFormProximoTratamento;

  /// No description provided for @consultaFormProximaConsultaOpcional.
  ///
  /// In pt, this message translates to:
  /// **'Próxima consulta (opcional)'**
  String get consultaFormProximaConsultaOpcional;

  /// No description provided for @consultaFormLembreteAtivo.
  ///
  /// In pt, this message translates to:
  /// **'Lembrete ativo'**
  String get consultaFormLembreteAtivo;

  /// No description provided for @consultaFormLembreteRecorrente.
  ///
  /// In pt, this message translates to:
  /// **'Avisa todos os dias (ou nos dias escolhidos) à hora definida'**
  String get consultaFormLembreteRecorrente;

  /// No description provided for @consultaFormLembreteTratamento.
  ///
  /// In pt, this message translates to:
  /// **'Avisa antes do tratamento e do próximo, se forem futuros'**
  String get consultaFormLembreteTratamento;

  /// No description provided for @consultaFormLembreteConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Avisa antes da consulta e da próxima consulta, se forem futuras'**
  String get consultaFormLembreteConsulta;

  /// No description provided for @profissionaisEspecialidadeLabel.
  ///
  /// In pt, this message translates to:
  /// **'Especialidade'**
  String get profissionaisEspecialidadeLabel;

  /// No description provided for @profissionaisEspecialidadeHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Cardiologia'**
  String get profissionaisEspecialidadeHint;

  /// No description provided for @profissionaisInstituicao.
  ///
  /// In pt, this message translates to:
  /// **'Instituição'**
  String get profissionaisInstituicao;

  /// No description provided for @profissionaisInstituicaoHint.
  ///
  /// In pt, this message translates to:
  /// **'Ex.: Hospital, clínica, farmácia'**
  String get profissionaisInstituicaoHint;

  /// No description provided for @profissionaisContacto.
  ///
  /// In pt, this message translates to:
  /// **'Contacto'**
  String get profissionaisContacto;

  /// No description provided for @profissionaisVazio.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não há profissionais registados. Ficam aqui automaticamente à medida que preenches o nome do médico/profissional numa consulta ou tratamento.'**
  String get profissionaisVazio;

  /// No description provided for @profissionaisLigarTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Ligar'**
  String get profissionaisLigarTooltip;

  /// No description provided for @tipoCuidadoHumor.
  ///
  /// In pt, this message translates to:
  /// **'Humor'**
  String get tipoCuidadoHumor;

  /// No description provided for @tipoCuidadoOutro.
  ///
  /// In pt, this message translates to:
  /// **'Outro'**
  String get tipoCuidadoOutro;

  /// No description provided for @relatorioSeccaoCuidados.
  ///
  /// In pt, this message translates to:
  /// **'Rotina / cuidados diários'**
  String get relatorioSeccaoCuidados;

  /// No description provided for @relatorioSeccaoNotas.
  ///
  /// In pt, this message translates to:
  /// **'Notas persistentes'**
  String get relatorioSeccaoNotas;

  /// No description provided for @relatorioPartilharTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Partilhar com quem?'**
  String get relatorioPartilharTitulo;

  /// No description provided for @relatorioEuMesmo.
  ///
  /// In pt, this message translates to:
  /// **'Eu mesmo ({email})'**
  String relatorioEuMesmo(String email);

  /// No description provided for @relatorioNenhum.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum'**
  String get relatorioNenhum;

  /// No description provided for @relatorioContinuar.
  ///
  /// In pt, this message translates to:
  /// **'Continuar'**
  String get relatorioContinuar;

  /// No description provided for @relatorioTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Gerar relatório'**
  String get relatorioTitulo;

  /// No description provided for @relatorioPeriodoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Período'**
  String get relatorioPeriodoTitulo;

  /// No description provided for @relatorioPeriodoHoje.
  ///
  /// In pt, this message translates to:
  /// **'Hoje'**
  String get relatorioPeriodoHoje;

  /// No description provided for @relatorioPeriodoUltimos7Dias.
  ///
  /// In pt, this message translates to:
  /// **'Últimos 7 dias'**
  String get relatorioPeriodoUltimos7Dias;

  /// No description provided for @relatorioPeriodoUltimos30Dias.
  ///
  /// In pt, this message translates to:
  /// **'Últimos 30 dias'**
  String get relatorioPeriodoUltimos30Dias;

  /// No description provided for @relatorioPeriodoPersonalizado.
  ///
  /// In pt, this message translates to:
  /// **'Período personalizado'**
  String get relatorioPeriodoPersonalizado;

  /// No description provided for @relatorioPeriodoPersonalizadoUpsell.
  ///
  /// In pt, this message translates to:
  /// **'Escolher um período personalizado é uma funcionalidade Premium. No plano Grátis, tens os últimos 7 ou 30 dias.'**
  String get relatorioPeriodoPersonalizadoUpsell;

  /// No description provided for @relatorioPeriodoHelpText.
  ///
  /// In pt, this message translates to:
  /// **'Período do relatório'**
  String get relatorioPeriodoHelpText;

  /// No description provided for @relatorioIntervalo.
  ///
  /// In pt, this message translates to:
  /// **'{inicio} a {fim}'**
  String relatorioIntervalo(String inicio, String fim);

  /// No description provided for @relatorioSeccoesTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Secções a incluir'**
  String get relatorioSeccoesTitulo;

  /// No description provided for @relatorioSeccoesDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Medicação e consultas fazem sempre parte do relatório.'**
  String get relatorioSeccoesDescricao;

  /// No description provided for @relatorioPersonalizacaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Personalização'**
  String get relatorioPersonalizacaoTitulo;

  /// No description provided for @relatorioPersonalizacaoUpsell.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar o teu nome e logótipo ao relatório é uma funcionalidade Premium.'**
  String get relatorioPersonalizacaoUpsell;

  /// No description provided for @relatorioNomeCuidador.
  ///
  /// In pt, this message translates to:
  /// **'Nome do cuidador profissional (opcional)'**
  String get relatorioNomeCuidador;

  /// No description provided for @relatorioAdicionarLogo.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar logótipo'**
  String get relatorioAdicionarLogo;

  /// No description provided for @relatorioAlterarLogo.
  ///
  /// In pt, this message translates to:
  /// **'Alterar logótipo'**
  String get relatorioAlterarLogo;

  /// No description provided for @relatorioLogoUpsell.
  ///
  /// In pt, this message translates to:
  /// **'Personalizar o relatório com logótipo é uma funcionalidade Premium.'**
  String get relatorioLogoUpsell;

  /// No description provided for @relatorioGerarBotao.
  ///
  /// In pt, this message translates to:
  /// **'Gerar relatório'**
  String get relatorioGerarBotao;

  /// No description provided for @relatorioPreviewTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Relatório'**
  String get relatorioPreviewTitulo;

  /// No description provided for @relatorioPdfTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Relatório de cuidados - {nome}'**
  String relatorioPdfTitulo(String nome);

  /// No description provided for @relatorioPdfPeriodo.
  ///
  /// In pt, this message translates to:
  /// **'Período: {inicio} a {fim}'**
  String relatorioPdfPeriodo(String inicio, String fim);

  /// No description provided for @relatorioPdfGeradoEm.
  ///
  /// In pt, this message translates to:
  /// **'Gerado em: {dataHora}'**
  String relatorioPdfGeradoEm(String dataHora);

  /// No description provided for @relatorioPdfCuidador.
  ///
  /// In pt, this message translates to:
  /// **'Cuidador: {nome}'**
  String relatorioPdfCuidador(String nome);

  /// No description provided for @relatorioPdfMedicacaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Medicação atual'**
  String get relatorioPdfMedicacaoTitulo;

  /// No description provided for @relatorioPdfSemMedicacao.
  ///
  /// In pt, this message translates to:
  /// **'Sem medicação ativa registada.'**
  String get relatorioPdfSemMedicacao;

  /// No description provided for @relatorioPdfColunaMedicamento.
  ///
  /// In pt, this message translates to:
  /// **'Medicamento'**
  String get relatorioPdfColunaMedicamento;

  /// No description provided for @relatorioPdfColunaDose.
  ///
  /// In pt, this message translates to:
  /// **'Dose'**
  String get relatorioPdfColunaDose;

  /// No description provided for @relatorioPdfColunaVia.
  ///
  /// In pt, this message translates to:
  /// **'Via'**
  String get relatorioPdfColunaVia;

  /// No description provided for @relatorioPdfColunaHorarios.
  ///
  /// In pt, this message translates to:
  /// **'Horários'**
  String get relatorioPdfColunaHorarios;

  /// No description provided for @relatorioPdfColunaDias.
  ///
  /// In pt, this message translates to:
  /// **'Dias'**
  String get relatorioPdfColunaDias;

  /// No description provided for @relatorioPdfConsultasTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Consultas e tratamentos no período'**
  String get relatorioPdfConsultasTitulo;

  /// No description provided for @relatorioPdfSemConsultas.
  ///
  /// In pt, this message translates to:
  /// **'Sem consultas ou tratamentos registados no período.'**
  String get relatorioPdfSemConsultas;

  /// No description provided for @relatorioPdfColunaTipo.
  ///
  /// In pt, this message translates to:
  /// **'Tipo'**
  String get relatorioPdfColunaTipo;

  /// No description provided for @relatorioPdfColunaData.
  ///
  /// In pt, this message translates to:
  /// **'Data'**
  String get relatorioPdfColunaData;

  /// No description provided for @relatorioPdfColunaEspecialidade.
  ///
  /// In pt, this message translates to:
  /// **'Especialidade/Tratamento'**
  String get relatorioPdfColunaEspecialidade;

  /// No description provided for @relatorioPdfColunaLocal.
  ///
  /// In pt, this message translates to:
  /// **'Local'**
  String get relatorioPdfColunaLocal;

  /// No description provided for @relatorioPdfColunaProfissional.
  ///
  /// In pt, this message translates to:
  /// **'Profissional'**
  String get relatorioPdfColunaProfissional;

  /// No description provided for @relatorioPdfColunaNotas.
  ///
  /// In pt, this message translates to:
  /// **'Notas'**
  String get relatorioPdfColunaNotas;

  /// No description provided for @relatorioPdfTipoConsulta.
  ///
  /// In pt, this message translates to:
  /// **'Consulta'**
  String get relatorioPdfTipoConsulta;

  /// No description provided for @relatorioPdfCuidadosTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Cuidados diários no período'**
  String get relatorioPdfCuidadosTitulo;

  /// No description provided for @relatorioPdfSemCuidados.
  ///
  /// In pt, this message translates to:
  /// **'Sem cuidados diários registados no período.'**
  String get relatorioPdfSemCuidados;

  /// No description provided for @relatorioPdfColunaNota.
  ///
  /// In pt, this message translates to:
  /// **'Nota'**
  String get relatorioPdfColunaNota;

  /// No description provided for @relatorioPdfSinaisVitaisTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Sinais vitais no período'**
  String get relatorioPdfSinaisVitaisTitulo;

  /// No description provided for @relatorioPdfSemSinaisVitais.
  ///
  /// In pt, this message translates to:
  /// **'Sem sinais vitais registados no período.'**
  String get relatorioPdfSemSinaisVitais;

  /// No description provided for @relatorioPdfColunaPressao.
  ///
  /// In pt, this message translates to:
  /// **'Pressão'**
  String get relatorioPdfColunaPressao;

  /// No description provided for @relatorioPdfColunaTemp.
  ///
  /// In pt, this message translates to:
  /// **'Temp.'**
  String get relatorioPdfColunaTemp;

  /// No description provided for @relatorioPdfColunaFreqCardiaca.
  ///
  /// In pt, this message translates to:
  /// **'Freq. cardíaca'**
  String get relatorioPdfColunaFreqCardiaca;

  /// No description provided for @calendarioTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Calendário · {nome}'**
  String calendarioTitulo(String nome);

  /// No description provided for @calendarioFiltroConsultas.
  ///
  /// In pt, this message translates to:
  /// **'Consultas'**
  String get calendarioFiltroConsultas;

  /// No description provided for @calendarioFiltroTratamentos.
  ///
  /// In pt, this message translates to:
  /// **'Tratamentos'**
  String get calendarioFiltroTratamentos;

  /// No description provided for @calendarioFiltroCuidados.
  ///
  /// In pt, this message translates to:
  /// **'Cuidados diários'**
  String get calendarioFiltroCuidados;

  /// No description provided for @calendarioMesFormato.
  ///
  /// In pt, this message translates to:
  /// **'Mês'**
  String get calendarioMesFormato;

  /// No description provided for @calendarioSemEventos.
  ///
  /// In pt, this message translates to:
  /// **'Sem eventos neste dia.'**
  String get calendarioSemEventos;

  /// No description provided for @avaliacaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Estás a gostar do CuidarPT?'**
  String get avaliacaoTitulo;

  /// No description provided for @avaliacaoDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Se o CuidarPT te está a ajudar a cuidar de quem mais precisa, uma avaliação na loja ajuda outras famílias a encontrarem a app.'**
  String get avaliacaoDescricao;

  /// No description provided for @avaliacaoAgoraNao.
  ///
  /// In pt, this message translates to:
  /// **'Agora não'**
  String get avaliacaoAgoraNao;

  /// No description provided for @avaliacaoAvaliar.
  ///
  /// In pt, this message translates to:
  /// **'Avaliar a app'**
  String get avaliacaoAvaliar;

  /// No description provided for @freqCardiacaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Medir frequência cardíaca'**
  String get freqCardiacaTitulo;

  /// No description provided for @freqCardiacaErroGenerico.
  ///
  /// In pt, this message translates to:
  /// **'Ocorreu um erro.'**
  String get freqCardiacaErroGenerico;

  /// No description provided for @freqCardiacaComoMedir.
  ///
  /// In pt, this message translates to:
  /// **'Como medir'**
  String get freqCardiacaComoMedir;

  /// No description provided for @freqCardiacaInstrucoesIntro.
  ///
  /// In pt, this message translates to:
  /// **'Na parte de trás do telemóvel, a lente da câmara e o pequeno LED do flash ficam normalmente muito próximos um do outro, junto ao canto superior. Precisas de tapar os dois ao mesmo tempo:'**
  String get freqCardiacaInstrucoesIntro;

  /// No description provided for @freqCardiacaPasso1.
  ///
  /// In pt, this message translates to:
  /// **'Liga o flash: acende-se sozinho quando a medição começa.'**
  String get freqCardiacaPasso1;

  /// No description provided for @freqCardiacaPasso2.
  ///
  /// In pt, this message translates to:
  /// **'Coloca a ponta de um dedo (não a unha) a tapar completamente a lente da câmara e o flash ao mesmo tempo.'**
  String get freqCardiacaPasso2;

  /// No description provided for @freqCardiacaPasso3.
  ///
  /// In pt, this message translates to:
  /// **'Faz um pouco de pressão — o suficiente para não entrar luz pelas bordas, mas sem apertar com força.'**
  String get freqCardiacaPasso3;

  /// No description provided for @freqCardiacaPasso4.
  ///
  /// In pt, this message translates to:
  /// **'Mantém o dedo completamente parado até à medição terminar (~12 segundos).'**
  String get freqCardiacaPasso4;

  /// No description provided for @freqCardiacaAvisoNaoMedico.
  ///
  /// In pt, this message translates to:
  /// **'A app não é um dispositivo médico — o valor é apenas informativo.'**
  String get freqCardiacaAvisoNaoMedico;

  /// No description provided for @freqCardiacaDicasTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Se falhar muitas vezes, tenta isto:'**
  String get freqCardiacaDicasTitulo;

  /// No description provided for @freqCardiacaDicasTexto.
  ///
  /// In pt, this message translates to:
  /// **'• Confirma que estás a tapar a câmara E o flash, não só um dos dois.\n• Não apertes com força — cortar a circulação piora a leitura.\n• Encosta o cotovelo a algo estável para o dedo não tremer.\n• Limpa a lente se tiver dedadas ou sujidade.\n• Tira uma capa muito grossa que tape mal o flash.'**
  String get freqCardiacaDicasTexto;

  /// No description provided for @freqCardiacaAMedir.
  ///
  /// In pt, this message translates to:
  /// **'A medir... mantém o dedo parado, a tapar bem a câmara e o flash.'**
  String get freqCardiacaAMedir;

  /// No description provided for @freqCardiacaResultadoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Frequência cardíaca'**
  String get freqCardiacaResultadoTitulo;

  /// No description provided for @freqCardiacaAvisoResultado.
  ///
  /// In pt, this message translates to:
  /// **'Este valor é apenas informativo e não é um diagnóstico. Em caso de dúvida ou sintomas, consulta um profissional de saúde.'**
  String get freqCardiacaAvisoResultado;

  /// No description provided for @freqCardiacaUsarValor.
  ///
  /// In pt, this message translates to:
  /// **'Usar este valor'**
  String get freqCardiacaUsarValor;

  /// No description provided for @freqCardiacaMedirNovamente.
  ///
  /// In pt, this message translates to:
  /// **'Medir novamente'**
  String get freqCardiacaMedirNovamente;

  /// No description provided for @freqCardiacaTentarNovamente.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get freqCardiacaTentarNovamente;

  /// No description provided for @faixaBaixa.
  ///
  /// In pt, this message translates to:
  /// **'Baixa'**
  String get faixaBaixa;

  /// No description provided for @faixaNormal.
  ///
  /// In pt, this message translates to:
  /// **'Normal'**
  String get faixaNormal;

  /// No description provided for @faixaElevada.
  ///
  /// In pt, this message translates to:
  /// **'Elevada'**
  String get faixaElevada;

  /// No description provided for @comumTelefone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get comumTelefone;

  /// No description provided for @notificacaoMedicacaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Medicação · {nome}'**
  String notificacaoMedicacaoTitulo(String nome);

  /// No description provided for @notificacaoConsultaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Consulta · {nome}'**
  String notificacaoConsultaTitulo(String nome);

  /// No description provided for @notificacaoProximaConsultaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Próxima consulta · {nome}'**
  String notificacaoProximaConsultaTitulo(String nome);

  /// No description provided for @notificacaoTratamentoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Tratamento · {nome}'**
  String notificacaoTratamentoTitulo(String nome);

  /// No description provided for @notificacaoTesteCorpo.
  ///
  /// In pt, this message translates to:
  /// **'Notificação de teste — se vês isto, as notificações estão a funcionar neste telemóvel.'**
  String get notificacaoTesteCorpo;

  /// No description provided for @idosoFormEditarTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Editar perfil'**
  String get idosoFormEditarTitulo;

  /// No description provided for @idosoFormNovoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Novo perfil de idoso'**
  String get idosoFormNovoTitulo;

  /// No description provided for @idosoFormRotinaUpsell.
  ///
  /// In pt, this message translates to:
  /// **'A rotina de higiene e alimentação é uma funcionalidade Premium. Subscreve o Premium para a ativares.'**
  String get idosoFormRotinaUpsell;

  /// No description provided for @idosoFormDataNascimentoHelp.
  ///
  /// In pt, this message translates to:
  /// **'Data de nascimento'**
  String get idosoFormDataNascimentoHelp;

  /// No description provided for @idosoFormIdentificacao.
  ///
  /// In pt, this message translates to:
  /// **'Identificação'**
  String get idosoFormIdentificacao;

  /// No description provided for @idosoFormMobilidadeReduzida.
  ///
  /// In pt, this message translates to:
  /// **'Mobilidade reduzida'**
  String get idosoFormMobilidadeReduzida;

  /// No description provided for @idosoFormAcamado.
  ///
  /// In pt, this message translates to:
  /// **'Acamado'**
  String get idosoFormAcamado;

  /// No description provided for @idosoFormSexo.
  ///
  /// In pt, this message translates to:
  /// **'Sexo'**
  String get idosoFormSexo;

  /// No description provided for @idosoFormMasculino.
  ///
  /// In pt, this message translates to:
  /// **'Masculino'**
  String get idosoFormMasculino;

  /// No description provided for @idosoFormFeminino.
  ///
  /// In pt, this message translates to:
  /// **'Feminino'**
  String get idosoFormFeminino;

  /// No description provided for @idosoFormNome.
  ///
  /// In pt, this message translates to:
  /// **'Nome *'**
  String get idosoFormNome;

  /// No description provided for @idosoFormNomeErro.
  ///
  /// In pt, this message translates to:
  /// **'Indica o nome do idoso'**
  String get idosoFormNomeErro;

  /// No description provided for @idosoFormContactosEmergenciaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Contactos de emergência'**
  String get idosoFormContactosEmergenciaTitulo;

  /// No description provided for @idosoFormRemoverContacto.
  ///
  /// In pt, this message translates to:
  /// **'Remover contacto'**
  String get idosoFormRemoverContacto;

  /// No description provided for @idosoFormAdicionarContacto.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar contacto'**
  String get idosoFormAdicionarContacto;

  /// No description provided for @idosoFormSaude.
  ///
  /// In pt, this message translates to:
  /// **'Saúde'**
  String get idosoFormSaude;

  /// No description provided for @idosoFormNotasSaude.
  ///
  /// In pt, this message translates to:
  /// **'Notas (alergias, condições de saúde)'**
  String get idosoFormNotasSaude;

  /// No description provided for @idosoFormPreferenciasHabitos.
  ///
  /// In pt, this message translates to:
  /// **'Preferências e hábitos'**
  String get idosoFormPreferenciasHabitos;

  /// No description provided for @idosoFormComidaPreferida.
  ///
  /// In pt, this message translates to:
  /// **'Comida preferida'**
  String get idosoFormComidaPreferida;

  /// No description provided for @idosoFormMusica.
  ///
  /// In pt, this message translates to:
  /// **'Música'**
  String get idosoFormMusica;

  /// No description provided for @idosoFormInteressesPessoais.
  ///
  /// In pt, this message translates to:
  /// **'Interesses pessoais'**
  String get idosoFormInteressesPessoais;

  /// No description provided for @idosoFormRotinaTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Rotina de higiene, alimentação e sono'**
  String get idosoFormRotinaTitulo;

  /// No description provided for @idosoFormRotinaDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Funcionalidade Premium. Regista itens recorrentes (ex.: banho, refeições, sesta) e marca-os como feitos no dia.'**
  String get idosoFormRotinaDescricao;

  /// No description provided for @notasEditarTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Editar notas'**
  String get notasEditarTooltip;

  /// No description provided for @notasHint.
  ///
  /// In pt, this message translates to:
  /// **'Alergias, preferências, indicações gerais...'**
  String get notasHint;

  /// No description provided for @notasSemNotas.
  ///
  /// In pt, this message translates to:
  /// **'Sem notas.'**
  String get notasSemNotas;

  /// No description provided for @premiumSubscreverTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Subscrever Premium'**
  String get premiumSubscreverTitulo;

  /// No description provided for @premiumErroCarregarPlanos.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os planos neste momento. Verifica a tua ligação e tenta novamente mais tarde.'**
  String get premiumErroCarregarPlanos;

  /// No description provided for @premiumErroCarregar.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar os planos: {erro}'**
  String premiumErroCarregar(String erro);

  /// No description provided for @premiumRestaurarCompra.
  ///
  /// In pt, this message translates to:
  /// **'Já subscrevi — restaurar compra'**
  String get premiumRestaurarCompra;

  /// No description provided for @definicoesCancelarAntesTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Antes de cancelares'**
  String get definicoesCancelarAntesTitulo;

  /// No description provided for @definicoesJaConstruiste.
  ///
  /// In pt, this message translates to:
  /// **'Já construíste isto na app:'**
  String get definicoesJaConstruiste;

  /// No description provided for @definicoesPerfilIdoso.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 perfil de idoso} other{{count} perfis de idosos}}'**
  String definicoesPerfilIdoso(int count);

  /// No description provided for @definicoesMedicacaoRegistada.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 medicação registada} other{{count} medicações registadas}}'**
  String definicoesMedicacaoRegistada(int count);

  /// No description provided for @definicoesConsultaTratamento.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 consulta/tratamento} other{{count} consultas/tratamentos}}'**
  String definicoesConsultaTratamento(int count);

  /// No description provided for @definicoesRegistoSinaisVitais.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 registo de sinais vitais} other{{count} registos de sinais vitais}}'**
  String definicoesRegistoSinaisVitais(int count);

  /// No description provided for @definicoesAoCancelarPremium.
  ///
  /// In pt, this message translates to:
  /// **'Ao cancelar o Premium, deixas de poder:'**
  String get definicoesAoCancelarPremium;

  /// No description provided for @definicoesPerdeVerPerfis.
  ///
  /// In pt, this message translates to:
  /// **'Ver mais de 2 perfis de idosos'**
  String get definicoesPerdeVerPerfis;

  /// No description provided for @definicoesPerdeSinaisVitais.
  ///
  /// In pt, this message translates to:
  /// **'Registar sinais vitais'**
  String get definicoesPerdeSinaisVitais;

  /// No description provided for @definicoesPerdeRelatoriosPersonalizados.
  ///
  /// In pt, this message translates to:
  /// **'Personalizar relatórios PDF'**
  String get definicoesPerdeRelatoriosPersonalizados;

  /// No description provided for @definicoesPerdeHistoricoIlimitado.
  ///
  /// In pt, this message translates to:
  /// **'Ver histórico e período de relatório sem limite'**
  String get definicoesPerdeHistoricoIlimitado;

  /// No description provided for @definicoesDadosContinuamGuardados.
  ///
  /// In pt, this message translates to:
  /// **'Os teus dados continuam guardados no telemóvel — cancelar não apaga nada.'**
  String get definicoesDadosContinuamGuardados;

  /// No description provided for @definicoesVoltar.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get definicoesVoltar;

  /// No description provided for @definicoesContinuarPlayStore.
  ///
  /// In pt, this message translates to:
  /// **'Continuar para a Play Store'**
  String get definicoesContinuarPlayStore;

  /// No description provided for @definicoesAparencia.
  ///
  /// In pt, this message translates to:
  /// **'Aparência'**
  String get definicoesAparencia;

  /// No description provided for @definicoesTema.
  ///
  /// In pt, this message translates to:
  /// **'Tema'**
  String get definicoesTema;

  /// No description provided for @definicoesTemaClaro.
  ///
  /// In pt, this message translates to:
  /// **'Claro'**
  String get definicoesTemaClaro;

  /// No description provided for @definicoesTemaEscuro.
  ///
  /// In pt, this message translates to:
  /// **'Escuro'**
  String get definicoesTemaEscuro;

  /// No description provided for @definicoesTamanhoLetra.
  ///
  /// In pt, this message translates to:
  /// **'Tamanho da letra'**
  String get definicoesTamanhoLetra;

  /// No description provided for @definicoesTamanhoPequeno.
  ///
  /// In pt, this message translates to:
  /// **'Pequeno'**
  String get definicoesTamanhoPequeno;

  /// No description provided for @definicoesTamanhoMedio.
  ///
  /// In pt, this message translates to:
  /// **'Médio'**
  String get definicoesTamanhoMedio;

  /// No description provided for @definicoesTamanhoGrande.
  ///
  /// In pt, this message translates to:
  /// **'Grande'**
  String get definicoesTamanhoGrande;

  /// No description provided for @definicoesSubscricaoTitulo.
  ///
  /// In pt, this message translates to:
  /// **'Subscrição'**
  String get definicoesSubscricaoTitulo;

  /// No description provided for @definicoesACarregar.
  ///
  /// In pt, this message translates to:
  /// **'A carregar...'**
  String get definicoesACarregar;

  /// No description provided for @definicoesTrialAtivo.
  ///
  /// In pt, this message translates to:
  /// **'Período experimental Premium — faltam {dias} dia(s).'**
  String definicoesTrialAtivo(int dias);

  /// No description provided for @definicoesPlanoPremiumAtivo.
  ///
  /// In pt, this message translates to:
  /// **'Plano Premium ativo.'**
  String get definicoesPlanoPremiumAtivo;

  /// No description provided for @definicoesPlanoGratis.
  ///
  /// In pt, this message translates to:
  /// **'Plano Grátis.'**
  String get definicoesPlanoGratis;

  /// No description provided for @definicoesOQueInclui.
  ///
  /// In pt, this message translates to:
  /// **'O que inclui o Premium:'**
  String get definicoesOQueInclui;

  /// No description provided for @definicoesBeneficioPerfis.
  ///
  /// In pt, this message translates to:
  /// **'Perfis de idosos ilimitados'**
  String get definicoesBeneficioPerfis;

  /// No description provided for @definicoesBeneficioRelatorios.
  ///
  /// In pt, this message translates to:
  /// **'Relatórios PDF personalizáveis (nome/logótipo)'**
  String get definicoesBeneficioRelatorios;

  /// No description provided for @definicoesBeneficioHistorico.
  ///
  /// In pt, this message translates to:
  /// **'Histórico e período de relatório ilimitados'**
  String get definicoesBeneficioHistorico;

  /// No description provided for @definicoesBeneficioMeteorologia.
  ///
  /// In pt, this message translates to:
  /// **'Avisos meteorológicos oficiais'**
  String get definicoesBeneficioMeteorologia;

  /// No description provided for @definicoesPrecos.
  ///
  /// In pt, this message translates to:
  /// **'€1,99/mês · €9,99/6 meses · €19,99/ano'**
  String get definicoesPrecos;

  /// No description provided for @definicoesGerirCancelar.
  ///
  /// In pt, this message translates to:
  /// **'Gerir ou cancelar subscrição'**
  String get definicoesGerirCancelar;

  /// No description provided for @definicoesPerfisIdosos.
  ///
  /// In pt, this message translates to:
  /// **'Perfis de idosos'**
  String get definicoesPerfisIdosos;

  /// No description provided for @definicoesIlimitados.
  ///
  /// In pt, this message translates to:
  /// **'ilimitados'**
  String get definicoesIlimitados;

  /// No description provided for @definicoesPerfisEmUso.
  ///
  /// In pt, this message translates to:
  /// **'{total} de {limite} perfis em uso.'**
  String definicoesPerfisEmUso(int total, String limite);

  /// No description provided for @definicoesVerPerfis.
  ///
  /// In pt, this message translates to:
  /// **'Ver perfis'**
  String get definicoesVerPerfis;

  /// No description provided for @definicoesNotificacoes.
  ///
  /// In pt, this message translates to:
  /// **'Notificações'**
  String get definicoesNotificacoes;

  /// No description provided for @definicoesNotificacoesDescricao.
  ///
  /// In pt, this message translates to:
  /// **'Os lembretes de medicação e consultas são notificações locais, agendadas diretamente neste telemóvel.'**
  String get definicoesNotificacoesDescricao;

  /// No description provided for @definicoesTestarNotificacao.
  ///
  /// In pt, this message translates to:
  /// **'Testar notificação agora'**
  String get definicoesTestarNotificacao;

  /// No description provided for @definicoesNotificacaoTesteEnviada.
  ///
  /// In pt, this message translates to:
  /// **'Notificação de teste enviada — verifica a barra de notificações.'**
  String get definicoesNotificacaoTesteEnviada;

  /// No description provided for @definicoesTroubleshootingNotificacoes.
  ///
  /// In pt, this message translates to:
  /// **'Se a notificação de teste não aparecer, ou se os lembretes agendados não chegarem: verifica em Definições do Android → Apps → CuidarPT → Notificações, se estão permitidas; e em Bateria, se a otimização de bateria está desativada para o CuidarPT (em alguns telemóveis chama-se \"sem restrições\" ou \"permitir em segundo plano\"). Muitas marcas (Xiaomi, Samsung, Huawei, etc.) bloqueiam lembretes de apps em segundo plano por omissão.'**
  String get definicoesTroubleshootingNotificacoes;

  /// No description provided for @definicoesSobre.
  ///
  /// In pt, this message translates to:
  /// **'Sobre'**
  String get definicoesSobre;

  /// No description provided for @definicoesVersaoSufixo.
  ///
  /// In pt, this message translates to:
  /// **' — versão {versao}'**
  String definicoesVersaoSufixo(String versao);

  /// No description provided for @definicoesDadosSoTelemovel.
  ///
  /// In pt, this message translates to:
  /// **'Todos os dados ficam guardados apenas neste telemóvel.'**
  String get definicoesDadosSoTelemovel;

  /// No description provided for @definicoesAvisoNaoDispositivoMedico.
  ///
  /// In pt, this message translates to:
  /// **'O CuidarPT não é um dispositivo médico e não substitui a avaliação, o diagnóstico ou o tratamento de um profissional de saúde.'**
  String get definicoesAvisoNaoDispositivoMedico;

  /// No description provided for @definicoesPoliticaPrivacidade.
  ///
  /// In pt, this message translates to:
  /// **'Política de privacidade'**
  String get definicoesPoliticaPrivacidade;

  /// No description provided for @premiumPlanoMensal.
  ///
  /// In pt, this message translates to:
  /// **'Mensal'**
  String get premiumPlanoMensal;

  /// No description provided for @premiumPlano6Meses.
  ///
  /// In pt, this message translates to:
  /// **'6 meses'**
  String get premiumPlano6Meses;

  /// No description provided for @premiumPlanoAnual.
  ///
  /// In pt, this message translates to:
  /// **'Anual'**
  String get premiumPlanoAnual;

  /// No description provided for @premiumPoupancaLabel.
  ///
  /// In pt, this message translates to:
  /// **'Poupas {percentagem}% · equivale a {valor}/mês'**
  String premiumPoupancaLabel(int percentagem, String valor);
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
