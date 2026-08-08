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
