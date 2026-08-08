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

  @override
  String get premiumUpsellTitulo => 'Funcionalidade Premium';

  @override
  String get premiumUpsellBotao => 'Entendido';

  @override
  String get alertaPressaoMuitoElevada =>
      'Pressão arterial muito elevada (possível crise hipertensiva)';

  @override
  String get alertaPressaoElevada => 'Pressão arterial elevada (hipertensão)';

  @override
  String get alertaPressaoBaixa => 'Pressão arterial baixa (hipotensão)';

  @override
  String get alertaFebreAlta => 'Febre alta';

  @override
  String get alertaFebre => 'Febre';

  @override
  String get alertaHipotermia =>
      'Temperatura corporal muito baixa (hipotermia)';

  @override
  String get alertaGlicemiaBaixa => 'Glicemia baixa (hipoglicemia)';

  @override
  String get alertaGlicemiaMuitoElevada => 'Glicemia muito elevada';

  @override
  String get alertaGlicemiaElevada => 'Glicemia elevada';

  @override
  String get alertaFrequenciaBaixa => 'Frequência cardíaca baixa (bradicardia)';

  @override
  String get alertaFrequenciaElevada =>
      'Frequência cardíaca elevada (taquicardia)';

  @override
  String get alertaSinaisVitaisAviso =>
      'Valores de referência gerais da OMS para adultos em repouso. Não substitui avaliação médica.';

  @override
  String get sinaisVitaisUpsellDescricao =>
      'Funcionalidade Premium: pressão, temperatura, glicemia, frequência cardíaca.';

  @override
  String get sinaisVitaisTooltipHistorico => 'Histórico em gráfico';

  @override
  String get sinaisVitaisTooltipNovoRegisto => 'Novo registo de sinais vitais';

  @override
  String get sinaisVitaisSemRegistos =>
      'Ainda não há registos de sinais vitais.';

  @override
  String get sinaisVitaisSemRegistoHoje =>
      'Ainda não registou sinais vitais hoje.';

  @override
  String sinaisVitaisVerTodos(int total) {
    return 'Ver todos ($total)';
  }

  @override
  String get sinaisVitaisApagarTitulo => 'Apagar registo';

  @override
  String get sinaisVitaisApagarConfirmacao =>
      'Queres mesmo apagar este registo de sinais vitais?';

  @override
  String get sinaisVitaisSemValores => 'Sem valores registados';

  @override
  String sinaisVitaisErroCarregar(String erro) {
    return 'Erro ao carregar sinais vitais: $erro';
  }

  @override
  String get sinaisVitaisFormEditarTitulo => 'Editar sinais vitais';

  @override
  String get sinaisVitaisFormNovoTitulo => 'Novos sinais vitais';

  @override
  String get sinaisVitaisFormDataRegisto => 'Data do registo';

  @override
  String get sinaisVitaisFormHoraRegisto => 'Hora do registo';

  @override
  String get sinaisVitaisFormPressaoTitulo => 'Pressão arterial (mmHg)';

  @override
  String get sinaisVitaisFormSistolica => 'Sistólica (máxima)';

  @override
  String get sinaisVitaisFormDiastolica => 'Diastólica (mínima)';

  @override
  String get sinaisVitaisFormTemperatura => 'Temperatura (°C)';

  @override
  String get sinaisVitaisFormGlicemia => 'Glicemia (mg/dL)';

  @override
  String get sinaisVitaisFormFrequencia => 'Frequência cardíaca (bpm)';

  @override
  String get sinaisVitaisFormMedirCamara => 'Medir com a câmara';

  @override
  String get sinaisVitaisFormPeso => 'Peso (kg)';

  @override
  String get sinaisVitaisFormDataHora => 'Data e hora';

  @override
  String get sinaisVitaisFormNotas => 'Notas';

  @override
  String get sinaisVitaisHistoricoTitulo => 'Histórico de sinais vitais';

  @override
  String get sinaisVitaisHistorico7Dias => '7 dias';

  @override
  String get sinaisVitaisHistorico30Dias => '30 dias';

  @override
  String get sinaisVitaisHistoricoPressaoSistolica => 'Pressão sistólica';

  @override
  String get sinaisVitaisHistoricoPressaoDiastolica => 'Pressão diastólica';

  @override
  String get sinaisVitaisHistoricoTemperaturaTitulo => 'Temperatura';

  @override
  String get sinaisVitaisHistoricoGlicemia => 'Glicemia';

  @override
  String get sinaisVitaisHistoricoFrequenciaCardiaca => 'Frequência cardíaca';

  @override
  String get sinaisVitaisHistoricoPeso => 'Peso';

  @override
  String sinaisVitaisHistoricoMedia(String valor, String unidade) {
    return 'Média: $valor $unidade';
  }

  @override
  String get sinaisVitaisHistoricoSemRegistos =>
      'Ainda não há registos neste período.';

  @override
  String get comumNome => 'Nome';

  @override
  String get comumEmail => 'Email';

  @override
  String get documentosTirarFotografia => 'Tirar fotografia';

  @override
  String get documentosEscolherGaleria => 'Escolher da galeria';

  @override
  String get documentosNomeTitulo => 'Nome do documento';

  @override
  String get documentosNomeHint => 'Ex.: Receita Dr. Silva, Análises 2026';

  @override
  String documentosTituloOmissao(String data) {
    return 'Documento $data';
  }

  @override
  String get documentosApagarTitulo => 'Apagar documento';

  @override
  String documentosApagarConfirmacao(String titulo) {
    return 'Queres mesmo apagar \"$titulo\"?';
  }

  @override
  String get documentosTitulo => 'Documentos';

  @override
  String get documentosNenhum => 'Nenhum documento';

  @override
  String documentosContagem(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documentos',
      one: '1 documento',
    );
    return '$_temp0';
  }

  @override
  String get documentosDescricao =>
      'Receitas e exames guardados apenas neste telemóvel.';

  @override
  String get documentosAdicionarTooltip => 'Adicionar documento';

  @override
  String get documentosSemDocumentos => 'Ainda não há documentos guardados.';

  @override
  String get contactosCuidadoresNovoTitulo => 'Novo contacto';

  @override
  String get contactosCuidadoresTitulo => 'Contactos de cuidadores';

  @override
  String get contactosCuidadoresAdicionarTooltip => 'Adicionar contacto';

  @override
  String get contactosCuidadoresDescricao =>
      'Usados para escolher rapidamente com quem partilhar um relatório.';

  @override
  String get contactosCuidadoresSemContactos =>
      'Ainda não há contactos guardados.';

  @override
  String get contactosCuidadoresApagarTooltip => 'Apagar contacto';

  @override
  String contactosCuidadoresErro(String erro) {
    return 'Erro ao carregar contactos: $erro';
  }

  @override
  String get rotinaCategoriaHigiene => 'Higiene';

  @override
  String get rotinaCategoriaAlimentacao => 'Alimentação';

  @override
  String get rotinaCategoriaSono => 'Sono';

  @override
  String get rotinaCategoriaAtividade => 'Atividade';

  @override
  String get rotinaSugestaoBanho => 'Banho';

  @override
  String get rotinaSugestaoEscovarDentes => 'Escovar os dentes';

  @override
  String get rotinaSugestaoHigieneIntima => 'Higiene íntima';

  @override
  String get rotinaSugestaoPentearCabelo => 'Pentear/arranjar cabelo';

  @override
  String get rotinaSugestaoPequenoAlmoco => 'Pequeno-almoço';

  @override
  String get rotinaSugestaoAlmoco => 'Almoço';

  @override
  String get rotinaSugestaoLanche => 'Lanche';

  @override
  String get rotinaSugestaoJantar => 'Jantar';

  @override
  String get rotinaSugestaoHidratacao => 'Hidratação/Água';

  @override
  String get rotinaSugestaoSesta => 'Sesta';

  @override
  String get rotinaSugestaoDeitarNoite => 'Deitar à noite';

  @override
  String get rotinaSugestaoAcordar => 'Acordar';

  @override
  String get rotinaSugestaoPasseio => 'Passeio';

  @override
  String get rotinaSugestaoExercicios => 'Exercícios';

  @override
  String get rotinaSugestaoAlongamentos => 'Alongamentos';

  @override
  String get rotinaNovoItemTitulo => 'Novo item de rotina';

  @override
  String get rotinaNovoItemHint => 'Ex.: Banho, Pequeno-almoço';

  @override
  String get rotinaTitulo => 'Rotina de higiene, alimentação, sono e atividade';

  @override
  String get rotinaNenhumItem => 'Nenhum item';

  @override
  String rotinaContagemItens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get rotinaSelecionarVarios => 'Selecionar vários';

  @override
  String get rotinaFotoPrato => 'Foto do prato';

  @override
  String get rotinaApagarItem => 'Apagar item';

  @override
  String get rotinaMarcarComoFeito => 'Marcar como feito';

  @override
  String rotinaMarcarNComoFeito(int count) {
    return 'Marcar $count como feito';
  }

  @override
  String get rotinaAdicionarItem => 'Adicionar item';

  @override
  String get humorGraficoTitulo => 'Estado de Humor';

  @override
  String get humorGraficoSemRegistos =>
      'Ainda não há registos de humor neste período.';

  @override
  String get diaSegAbrev => 'Seg';

  @override
  String get diaTerAbrev => 'Ter';

  @override
  String get diaQuaAbrev => 'Qua';

  @override
  String get diaQuiAbrev => 'Qui';

  @override
  String get diaSexAbrev => 'Sex';

  @override
  String get diaSabAbrev => 'Sáb';

  @override
  String get diaDomAbrev => 'Dom';

  @override
  String get horariosTodosDias => 'Todos os dias';

  @override
  String get medicacaoFormEditarTitulo => 'Editar medicação';

  @override
  String get medicacaoFormNovoTitulo => 'Nova medicação';

  @override
  String get medicacaoFormNome => 'Nome do medicamento *';

  @override
  String get medicacaoFormNomeErro => 'Indica o nome do medicamento';

  @override
  String get medicacaoFormDose => 'Dose';

  @override
  String get medicacaoFormDoseHint => 'Ex.: 1 comprimido, 500 mg, 10 gotas';

  @override
  String get medicacaoFormVia => 'Via de administração';

  @override
  String get medicacaoFormViaHint => 'Ex.: Oral, Intravenosa';

  @override
  String get medicacaoFormHorariosTitulo => 'Horários *';

  @override
  String get medicacaoFormPreenchimentoRapido =>
      'Preenchimento rápido por frequência (substitui os horários atuais):';

  @override
  String get medicacaoForm1xDia => '1x por dia';

  @override
  String get medicacaoForm12h => 'De 12 em 12h';

  @override
  String get medicacaoForm8h => 'De 8 em 8h';

  @override
  String get medicacaoFormPrimeiraToma => 'Primeira toma';

  @override
  String get medicacaoFormAdicionarHorario => 'Adicionar horário';

  @override
  String get medicacaoFormErroHorarios => 'Adiciona pelo menos um horário';

  @override
  String get medicacaoFormDiasSemanaTitulo => 'Dias da semana';

  @override
  String get medicacaoFormDiasSemanaDescricao =>
      'Não escolhas nenhum para tomar todos os dias.';

  @override
  String get medicacaoFormDataInicio => 'Data de início';

  @override
  String get medicacaoFormDataFim => 'Data de fim (opcional)';

  @override
  String get medicacaoFormNaoDefinida => 'Não definida';

  @override
  String get medicacaoFormSemDataDefinida => 'Sem data definida';

  @override
  String get medicacaoFormLembretesAtivos => 'Lembretes ativos';

  @override
  String get medicacaoFormLembretesDescricao =>
      'Desliga para pausar sem apagar o registo';

  @override
  String get consultaFormEditarTratamento => 'Editar tratamento';

  @override
  String get consultaFormEditarConsulta => 'Editar consulta';

  @override
  String get consultaFormNovoTratamento => 'Novo tratamento';

  @override
  String get consultaFormNovaConsulta => 'Nova consulta';

  @override
  String get consultaFormDataConsulta => 'Data da consulta';

  @override
  String get consultaFormHoraConsulta => 'Hora da consulta';

  @override
  String get consultaFormTipoConsultaMedica => 'Consulta médica';

  @override
  String get consultaFormTipoTratamento => 'Tratamento';

  @override
  String get consultaFormTipoTratamentoLabel => 'Tipo de tratamento *';

  @override
  String get consultaFormEspecialidadeLabel => 'Especialidade *';

  @override
  String get consultaFormTipoTratamentoHint => 'Ex.: Fisioterapia, Enfermagem';

  @override
  String get consultaFormEspecialidadeHint => 'Ex.: Clínica geral, Cardiologia';

  @override
  String get consultaFormTipoTratamentoErro => 'Indica o tipo de tratamento';

  @override
  String get consultaFormEspecialidadeErro => 'Indica a especialidade';

  @override
  String get consultaFormLocal => 'Local';

  @override
  String get consultaFormLocalHint =>
      'Ex.: Centro de Saúde, Hospital, Clínica privada';

  @override
  String get consultaFormProfissional => 'Profissional';

  @override
  String get consultaFormNomeMedico => 'Nome do médico';

  @override
  String get consultaFormProfissionalHint => 'Ex.: Enf. Maria Santos';

  @override
  String get consultaFormNomeMedicoHint => 'Ex.: Dr. António Silva';

  @override
  String get consultaFormTratamentoRecorrente => 'Tratamento recorrente';

  @override
  String get consultaFormTratamentoRecorrenteDescricao =>
      'Repete-se diariamente ou em dias específicos da semana';

  @override
  String get consultaFormDataHoraInicio => 'Data e hora de início';

  @override
  String get consultaFormDataHora => 'Data e hora';

  @override
  String get consultaFormDiasSemanaDescricao =>
      'Não escolhas nenhum para repetir todos os dias.';

  @override
  String get consultaFormProximoTratamento => 'Próximo tratamento (opcional)';

  @override
  String get consultaFormProximaConsultaOpcional =>
      'Próxima consulta (opcional)';

  @override
  String get consultaFormLembreteAtivo => 'Lembrete ativo';

  @override
  String get consultaFormLembreteRecorrente =>
      'Avisa todos os dias (ou nos dias escolhidos) à hora definida';

  @override
  String get consultaFormLembreteTratamento =>
      'Avisa antes do tratamento e do próximo, se forem futuros';

  @override
  String get consultaFormLembreteConsulta =>
      'Avisa antes da consulta e da próxima consulta, se forem futuras';

  @override
  String get profissionaisEspecialidadeLabel => 'Especialidade';

  @override
  String get profissionaisEspecialidadeHint => 'Ex.: Cardiologia';

  @override
  String get profissionaisInstituicao => 'Instituição';

  @override
  String get profissionaisInstituicaoHint => 'Ex.: Hospital, clínica, farmácia';

  @override
  String get profissionaisContacto => 'Contacto';

  @override
  String get profissionaisVazio =>
      'Ainda não há profissionais registados. Ficam aqui automaticamente à medida que preenches o nome do médico/profissional numa consulta ou tratamento.';

  @override
  String get profissionaisLigarTooltip => 'Ligar';

  @override
  String get tipoCuidadoHumor => 'Humor';

  @override
  String get tipoCuidadoOutro => 'Outro';

  @override
  String get relatorioSeccaoCuidados => 'Rotina / cuidados diários';

  @override
  String get relatorioSeccaoNotas => 'Notas persistentes';

  @override
  String get relatorioPartilharTitulo => 'Partilhar com quem?';

  @override
  String relatorioEuMesmo(String email) {
    return 'Eu mesmo ($email)';
  }

  @override
  String get relatorioNenhum => 'Nenhum';

  @override
  String get relatorioContinuar => 'Continuar';

  @override
  String get relatorioTitulo => 'Gerar relatório';

  @override
  String get relatorioPeriodoTitulo => 'Período';

  @override
  String get relatorioPeriodoHoje => 'Hoje';

  @override
  String get relatorioPeriodoUltimos7Dias => 'Últimos 7 dias';

  @override
  String get relatorioPeriodoUltimos30Dias => 'Últimos 30 dias';

  @override
  String get relatorioPeriodoPersonalizado => 'Período personalizado';

  @override
  String get relatorioPeriodoPersonalizadoUpsell =>
      'Escolher um período personalizado é uma funcionalidade Premium. No plano Grátis, tens os últimos 7 ou 30 dias.';

  @override
  String get relatorioPeriodoHelpText => 'Período do relatório';

  @override
  String relatorioIntervalo(String inicio, String fim) {
    return '$inicio a $fim';
  }

  @override
  String get relatorioSeccoesTitulo => 'Secções a incluir';

  @override
  String get relatorioSeccoesDescricao =>
      'Medicação e consultas fazem sempre parte do relatório.';

  @override
  String get relatorioPersonalizacaoTitulo => 'Personalização';

  @override
  String get relatorioPersonalizacaoUpsell =>
      'Adicionar o teu nome e logótipo ao relatório é uma funcionalidade Premium.';

  @override
  String get relatorioNomeCuidador =>
      'Nome do cuidador profissional (opcional)';

  @override
  String get relatorioAdicionarLogo => 'Adicionar logótipo';

  @override
  String get relatorioAlterarLogo => 'Alterar logótipo';

  @override
  String get relatorioLogoUpsell =>
      'Personalizar o relatório com logótipo é uma funcionalidade Premium.';

  @override
  String get relatorioGerarBotao => 'Gerar relatório';

  @override
  String get relatorioPreviewTitulo => 'Relatório';

  @override
  String relatorioPdfTitulo(String nome) {
    return 'Relatório de cuidados - $nome';
  }

  @override
  String relatorioPdfPeriodo(String inicio, String fim) {
    return 'Período: $inicio a $fim';
  }

  @override
  String relatorioPdfGeradoEm(String dataHora) {
    return 'Gerado em: $dataHora';
  }

  @override
  String relatorioPdfCuidador(String nome) {
    return 'Cuidador: $nome';
  }

  @override
  String get relatorioPdfMedicacaoTitulo => 'Medicação atual';

  @override
  String get relatorioPdfSemMedicacao => 'Sem medicação ativa registada.';

  @override
  String get relatorioPdfColunaMedicamento => 'Medicamento';

  @override
  String get relatorioPdfColunaDose => 'Dose';

  @override
  String get relatorioPdfColunaVia => 'Via';

  @override
  String get relatorioPdfColunaHorarios => 'Horários';

  @override
  String get relatorioPdfColunaDias => 'Dias';

  @override
  String get relatorioPdfConsultasTitulo =>
      'Consultas e tratamentos no período';

  @override
  String get relatorioPdfSemConsultas =>
      'Sem consultas ou tratamentos registados no período.';

  @override
  String get relatorioPdfColunaTipo => 'Tipo';

  @override
  String get relatorioPdfColunaData => 'Data';

  @override
  String get relatorioPdfColunaEspecialidade => 'Especialidade/Tratamento';

  @override
  String get relatorioPdfColunaLocal => 'Local';

  @override
  String get relatorioPdfColunaProfissional => 'Profissional';

  @override
  String get relatorioPdfColunaNotas => 'Notas';

  @override
  String get relatorioPdfTipoConsulta => 'Consulta';

  @override
  String get relatorioPdfCuidadosTitulo => 'Cuidados diários no período';

  @override
  String get relatorioPdfSemCuidados =>
      'Sem cuidados diários registados no período.';

  @override
  String get relatorioPdfColunaNota => 'Nota';

  @override
  String get relatorioPdfSinaisVitaisTitulo => 'Sinais vitais no período';

  @override
  String get relatorioPdfSemSinaisVitais =>
      'Sem sinais vitais registados no período.';

  @override
  String get relatorioPdfColunaPressao => 'Pressão';

  @override
  String get relatorioPdfColunaTemp => 'Temp.';

  @override
  String get relatorioPdfColunaFreqCardiaca => 'Freq. cardíaca';

  @override
  String calendarioTitulo(String nome) {
    return 'Calendário · $nome';
  }

  @override
  String get calendarioFiltroConsultas => 'Consultas';

  @override
  String get calendarioFiltroTratamentos => 'Tratamentos';

  @override
  String get calendarioFiltroCuidados => 'Cuidados diários';

  @override
  String get calendarioMesFormato => 'Mês';

  @override
  String get calendarioSemEventos => 'Sem eventos neste dia.';

  @override
  String get avaliacaoTitulo => 'Estás a gostar do CuidarPT?';

  @override
  String get avaliacaoDescricao =>
      'Se o CuidarPT te está a ajudar a cuidar de quem mais precisa, uma avaliação na loja ajuda outras famílias a encontrarem a app.';

  @override
  String get avaliacaoAgoraNao => 'Agora não';

  @override
  String get avaliacaoAvaliar => 'Avaliar a app';

  @override
  String get freqCardiacaTitulo => 'Medir frequência cardíaca';

  @override
  String get freqCardiacaErroGenerico => 'Ocorreu um erro.';

  @override
  String get freqCardiacaComoMedir => 'Como medir';

  @override
  String get freqCardiacaInstrucoesIntro =>
      'Na parte de trás do telemóvel, a lente da câmara e o pequeno LED do flash ficam normalmente muito próximos um do outro, junto ao canto superior. Precisas de tapar os dois ao mesmo tempo:';

  @override
  String get freqCardiacaPasso1 =>
      'Liga o flash: acende-se sozinho quando a medição começa.';

  @override
  String get freqCardiacaPasso2 =>
      'Coloca a ponta de um dedo (não a unha) a tapar completamente a lente da câmara e o flash ao mesmo tempo.';

  @override
  String get freqCardiacaPasso3 =>
      'Faz um pouco de pressão — o suficiente para não entrar luz pelas bordas, mas sem apertar com força.';

  @override
  String get freqCardiacaPasso4 =>
      'Mantém o dedo completamente parado até à medição terminar (~12 segundos).';

  @override
  String get freqCardiacaAvisoNaoMedico =>
      'A app não é um dispositivo médico — o valor é apenas informativo.';

  @override
  String get freqCardiacaDicasTitulo => 'Se falhar muitas vezes, tenta isto:';

  @override
  String get freqCardiacaDicasTexto =>
      '• Confirma que estás a tapar a câmara E o flash, não só um dos dois.\n• Não apertes com força — cortar a circulação piora a leitura.\n• Encosta o cotovelo a algo estável para o dedo não tremer.\n• Limpa a lente se tiver dedadas ou sujidade.\n• Tira uma capa muito grossa que tape mal o flash.';

  @override
  String get freqCardiacaAMedir =>
      'A medir... mantém o dedo parado, a tapar bem a câmara e o flash.';

  @override
  String get freqCardiacaResultadoTitulo => 'Frequência cardíaca';

  @override
  String get freqCardiacaAvisoResultado =>
      'Este valor é apenas informativo e não é um diagnóstico. Em caso de dúvida ou sintomas, consulta um profissional de saúde.';

  @override
  String get freqCardiacaUsarValor => 'Usar este valor';

  @override
  String get freqCardiacaMedirNovamente => 'Medir novamente';

  @override
  String get freqCardiacaTentarNovamente => 'Tentar novamente';

  @override
  String get faixaBaixa => 'Baixa';

  @override
  String get faixaNormal => 'Normal';

  @override
  String get faixaElevada => 'Elevada';
}
