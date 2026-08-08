// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

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
  String get onboardingSlide1Titulo => 'Bem-vindo ao CuidarPT';

  @override
  String get onboardingSlide1Descricao =>
      'Organize a medicação, as consultas e os cuidados diários de quem cuida, tudo num só lugar.';

  @override
  String get onboardingSlide2Titulo => 'Registos simples do dia a dia';

  @override
  String get onboardingSlide2Descricao =>
      'Medicação com lembretes, consultas médicas e notas rápidas de higiene, alimentação e humor.';

  @override
  String get onboardingSlide3Titulo => 'Tudo guardado no seu telemóvel';

  @override
  String get onboardingSlide3Descricao =>
      'Sem contas nem servidores — os dados ficam só no seu dispositivo. Comece já com 7 dias grátis de todas as funcionalidades Premium.';

  @override
  String get onboardingQuantosIdososTitulo => 'Quantos idosos vais acompanhar?';

  @override
  String get onboardingQuantosIdososOpcaoTresOuMais => '3+';

  @override
  String get onboardingQuantosIdososAvisoComLimite =>
      'O plano Grátis permite até 2 perfis de idosos. Para 3 ou mais, vais precisar do Premium — já incluído nos teus 7 dias grátis.';

  @override
  String get onboardingQuantosIdososAvisoSemLimite =>
      'O plano Grátis permite até 2 perfis de idosos.';

  @override
  String get onboardingEmailTitulo => 'O teu email (opcional)';

  @override
  String get onboardingEmailDescricao =>
      'Usamos apenas para pré-preencher o destinatário quando partilhas um relatório. Fica guardado só neste telemóvel.';

  @override
  String get onboardingEmailHint => 'nome@exemplo.com';

  @override
  String get onboardingDisclaimerTitulo => 'Antes de começar';

  @override
  String get onboardingDisclaimerTexto =>
      'O CuidarPT é uma ferramenta de organização de cuidados. Não é um dispositivo médico e não substitui a avaliação, o diagnóstico ou o tratamento de um profissional de saúde. Em caso de emergência, contacte sempre os serviços de saúde.';

  @override
  String get onboardingDisclaimerCheckbox => 'Li e percebi';

  @override
  String get onboardingBotaoComecar => 'Começar';

  @override
  String get onboardingBotaoSeguinte => 'Seguinte';

  @override
  String get comumCancelar => 'Cancelar';

  @override
  String get comumApagar => 'Apagar';

  @override
  String get comumGuardar => 'Guardar';

  @override
  String get comumDefinicoes => 'Definições';

  @override
  String get comumSinaisVitaisPremiumMensagem =>
      'Registar sinais vitais é uma funcionalidade Premium. Subscreve o Premium para a usares.';

  @override
  String proximoEventoFaltamDias(int dias) {
    String _temp0 = intl.Intl.pluralLogic(
      dias,
      locale: localeName,
      other: 'faltam $dias dias',
      one: 'falta 1 dia',
    );
    return '$_temp0';
  }

  @override
  String proximoEventoFaltamHoras(int horas) {
    return 'faltam ${horas}h';
  }

  @override
  String proximoEventoFaltamMinutos(int minutos) {
    return 'faltam $minutos min';
  }

  @override
  String homeTrialDias(int dias) {
    return 'Trial: ${dias}d';
  }

  @override
  String homeErroCarregarPerfis(String erro) {
    return 'Erro ao carregar perfis: $erro';
  }

  @override
  String get homeCriarNovoPerfil => 'Criar novo perfil';

  @override
  String get homeEmptyStateTexto =>
      'Ainda não tens nenhum perfil de idoso.\nToca em \"Criar novo perfil\" para criares o primeiro.';

  @override
  String homeLimiteIdososMensagem(int limite) {
    String _temp0 = intl.Intl.pluralLogic(
      limite,
      locale: localeName,
      other:
          'O plano Grátis permite $limite perfis de idoso. Subscreve o Premium para adicionares mais perfis.',
      one:
          'O plano Grátis permite 1 perfil de idoso. Subscreve o Premium para adicionares mais perfis.',
    );
    return '$_temp0';
  }

  @override
  String get homeApagarPerfilTitulo => 'Apagar perfil';

  @override
  String homeApagarPerfilConfirmacao(String nome) {
    return 'Queres mesmo apagar o perfil de $nome?';
  }

  @override
  String get homeLembretesTitulo => 'Lembretes';

  @override
  String homeLembretesContagem(int total) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total próximos',
      one: '1 próximo',
    );
    return '$_temp0';
  }

  @override
  String get homeEscolherIdosoTitulo => 'Para qual idoso?';

  @override
  String get homeAcaoMedicacao => 'Medicação';

  @override
  String get homeAcaoConsulta => 'Consulta';

  @override
  String get homeAcaoSinaisVitais => 'Sinais vitais';

  @override
  String get homeAcaoRelatorio => 'Relatório';

  @override
  String get homeIdosoSemDataNascimento => 'Data de nascimento não definida';

  @override
  String homeIdosoDataNascimento(String data) {
    return 'Nascimento: $data';
  }

  @override
  String get idosoDetailLigarEmergencia => 'Ligar para contacto de emergência';

  @override
  String get idosoDetailCalendario => 'Calendário';

  @override
  String get idosoDetailGerarRelatorio => 'Gerar relatório';

  @override
  String get idosoDetailEditarPerfil => 'Editar perfil';

  @override
  String get idosoDetailProfissionais => 'Profissionais';

  @override
  String get idosoDetailAdicionarMedicacao => 'Adicionar medicação';

  @override
  String idosoDetailErroCarregarMedicacao(String erro) {
    return 'Erro ao carregar medicação: $erro';
  }

  @override
  String get idosoDetailConsultasTratamentosTitulo => 'Consultas e tratamentos';

  @override
  String get idosoDetailAdicionarConsulta => 'Adicionar consulta ou tratamento';

  @override
  String idosoDetailErroCarregarConsultas(String erro) {
    return 'Erro ao carregar consultas: $erro';
  }

  @override
  String get idosoDetailGerarRelatorioDiario => 'Gerar relatório diário';

  @override
  String get idosoDetailProximaToma => 'Próxima toma';

  @override
  String get idosoDetailProximaConsulta => 'Próxima consulta';

  @override
  String idosoDetailEmergenciaContacto(String nome, String telefone) {
    return 'Emergência: $nome $telefone';
  }

  @override
  String get idosoDetailMudarHumor => 'Mudar';

  @override
  String get humorComDores => 'Com dores';

  @override
  String get humorCansado => 'Cansado';

  @override
  String get humorSonolento => 'Sonolento';

  @override
  String get humorNormal => 'Normal';

  @override
  String get humorEnergico => 'Enérgico';

  @override
  String get humorContente => 'Contente';

  @override
  String get idosoDetailVerMenos => 'Ver menos';

  @override
  String idosoDetailVerTodas(int total) {
    return 'Ver todas ($total)';
  }

  @override
  String get idosoDetailSemMedicacao => 'Ainda não há medicação registada.';

  @override
  String get idosoDetailSemConsultas =>
      'Ainda não há consultas ou tratamentos registados.';

  @override
  String idosoDetailApagarItemConfirmacao(String nome) {
    return 'Queres mesmo apagar \"$nome\"?';
  }

  @override
  String get idosoDetailApagarMedicacaoTitulo => 'Apagar medicação';

  @override
  String get idosoDetailApagarTratamentoTitulo => 'Apagar tratamento';

  @override
  String get idosoDetailApagarConsultaTitulo => 'Apagar consulta';

  @override
  String get idosoDetailStatusPausada => 'pausada';

  @override
  String idosoDetailProximaData(String data) {
    return 'próxima: $data';
  }

  @override
  String get idosoDetailComoSenteHojeTitulo => 'Como se sente hoje?';
}
