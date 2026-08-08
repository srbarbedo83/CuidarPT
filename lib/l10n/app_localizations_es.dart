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

  @override
  String get comumCancelar => 'Cancelar';

  @override
  String get comumApagar => 'Eliminar';

  @override
  String get comumGuardar => 'Guardar';

  @override
  String get comumDefinicoes => 'Ajustes';

  @override
  String get comumSinaisVitaisPremiumMensagem =>
      'Registrar signos vitales es una función Premium. Suscríbete a Premium para usarla.';

  @override
  String proximoEventoFaltamDias(int dias) {
    String _temp0 = intl.Intl.pluralLogic(
      dias,
      locale: localeName,
      other: 'faltan $dias días',
      one: 'falta 1 día',
    );
    return '$_temp0';
  }

  @override
  String proximoEventoFaltamHoras(int horas) {
    return 'faltan ${horas}h';
  }

  @override
  String proximoEventoFaltamMinutos(int minutos) {
    return 'faltan $minutos min';
  }

  @override
  String homeTrialDias(int dias) {
    return 'Prueba: ${dias}d';
  }

  @override
  String homeErroCarregarPerfis(String erro) {
    return 'Error al cargar perfiles: $erro';
  }

  @override
  String get homeCriarNovoPerfil => 'Crear nuevo perfil';

  @override
  String get homeEmptyStateTexto =>
      'Todavía no tienes ningún perfil.\nToca en \"Crear nuevo perfil\" para crear el primero.';

  @override
  String homeLimiteIdososMensagem(int limite) {
    String _temp0 = intl.Intl.pluralLogic(
      limite,
      locale: localeName,
      other:
          'El plan Gratis permite $limite perfiles. Suscríbete a Premium para añadir más perfiles.',
      one:
          'El plan Gratis permite 1 perfil. Suscríbete a Premium para añadir más perfiles.',
    );
    return '$_temp0';
  }

  @override
  String get homeApagarPerfilTitulo => 'Eliminar perfil';

  @override
  String homeApagarPerfilConfirmacao(String nome) {
    return '¿Seguro que quieres eliminar el perfil de $nome?';
  }

  @override
  String get homeLembretesTitulo => 'Recordatorios';

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
  String get homeEscolherIdosoTitulo => '¿Para quién?';

  @override
  String get homeAcaoMedicacao => 'Medicación';

  @override
  String get homeAcaoConsulta => 'Cita';

  @override
  String get homeAcaoSinaisVitais => 'Signos vitales';

  @override
  String get homeAcaoRelatorio => 'Informe';

  @override
  String get homeIdosoSemDataNascimento => 'Fecha de nacimiento no definida';

  @override
  String homeIdosoDataNascimento(String data) {
    return 'Nacimiento: $data';
  }

  @override
  String get idosoDetailLigarEmergencia => 'Llamar al contacto de emergencia';

  @override
  String get idosoDetailCalendario => 'Calendario';

  @override
  String get idosoDetailGerarRelatorio => 'Generar informe';

  @override
  String get idosoDetailEditarPerfil => 'Editar perfil';

  @override
  String get idosoDetailProfissionais => 'Profesionales';

  @override
  String get idosoDetailAdicionarMedicacao => 'Añadir medicación';

  @override
  String idosoDetailErroCarregarMedicacao(String erro) {
    return 'Error al cargar la medicación: $erro';
  }

  @override
  String get idosoDetailConsultasTratamentosTitulo => 'Citas y tratamientos';

  @override
  String get idosoDetailAdicionarConsulta => 'Añadir cita o tratamiento';

  @override
  String idosoDetailErroCarregarConsultas(String erro) {
    return 'Error al cargar las citas: $erro';
  }

  @override
  String get idosoDetailGerarRelatorioDiario => 'Generar informe diario';

  @override
  String get idosoDetailProximaToma => 'Próxima toma';

  @override
  String get idosoDetailProximaConsulta => 'Próxima cita';

  @override
  String idosoDetailEmergenciaContacto(String nome, String telefone) {
    return 'Emergencia: $nome $telefone';
  }

  @override
  String get idosoDetailMudarHumor => 'Cambiar';

  @override
  String get humorComDores => 'Con dolor';

  @override
  String get humorCansado => 'Cansado';

  @override
  String get humorSonolento => 'Somnoliento';

  @override
  String get humorNormal => 'Normal';

  @override
  String get humorEnergico => 'Enérgico';

  @override
  String get humorContente => 'Contento';

  @override
  String get idosoDetailVerMenos => 'Ver menos';

  @override
  String idosoDetailVerTodas(int total) {
    return 'Ver todas ($total)';
  }

  @override
  String get idosoDetailSemMedicacao => 'Todavía no hay medicación registrada.';

  @override
  String get idosoDetailSemConsultas =>
      'Todavía no hay citas ni tratamientos registrados.';

  @override
  String idosoDetailApagarItemConfirmacao(String nome) {
    return '¿Seguro que quieres eliminar \"$nome\"?';
  }

  @override
  String get idosoDetailApagarMedicacaoTitulo => 'Eliminar medicación';

  @override
  String get idosoDetailApagarTratamentoTitulo => 'Eliminar tratamiento';

  @override
  String get idosoDetailApagarConsultaTitulo => 'Eliminar cita';

  @override
  String get idosoDetailStatusPausada => 'en pausa';

  @override
  String idosoDetailProximaData(String data) {
    return 'próxima: $data';
  }

  @override
  String get idosoDetailComoSenteHojeTitulo => '¿Cómo te sientes hoy?';

  @override
  String get premiumUpsellTitulo => 'Función Premium';

  @override
  String get premiumUpsellBotao => 'Entendido';

  @override
  String get alertaPressaoMuitoElevada =>
      'Presión arterial muy alta (posible crisis hipertensiva)';

  @override
  String get alertaPressaoElevada => 'Presión arterial alta (hipertensión)';

  @override
  String get alertaPressaoBaixa => 'Presión arterial baja (hipotensión)';

  @override
  String get alertaFebreAlta => 'Fiebre alta';

  @override
  String get alertaFebre => 'Fiebre';

  @override
  String get alertaHipotermia => 'Temperatura corporal muy baja (hipotermia)';

  @override
  String get alertaGlicemiaBaixa => 'Glucemia baja (hipoglucemia)';

  @override
  String get alertaGlicemiaMuitoElevada => 'Glucemia muy alta';

  @override
  String get alertaGlicemiaElevada => 'Glucemia alta';

  @override
  String get alertaFrequenciaBaixa => 'Frecuencia cardíaca baja (bradicardia)';

  @override
  String get alertaFrequenciaElevada =>
      'Frecuencia cardíaca alta (taquicardia)';

  @override
  String get alertaSinaisVitaisAviso =>
      'Valores de referencia generales de la OMS para adultos en reposo. No sustituye la evaluación médica.';

  @override
  String get sinaisVitaisUpsellDescricao =>
      'Función Premium: presión, temperatura, glucemia, frecuencia cardíaca.';

  @override
  String get sinaisVitaisTooltipHistorico => 'Historial en gráfico';

  @override
  String get sinaisVitaisTooltipNovoRegisto =>
      'Nuevo registro de signos vitales';

  @override
  String get sinaisVitaisSemRegistos =>
      'Todavía no hay registros de signos vitales.';

  @override
  String get sinaisVitaisSemRegistoHoje =>
      'Todavía no has registrado signos vitales hoy.';

  @override
  String sinaisVitaisVerTodos(int total) {
    return 'Ver todos ($total)';
  }

  @override
  String get sinaisVitaisApagarTitulo => 'Eliminar registro';

  @override
  String get sinaisVitaisApagarConfirmacao =>
      '¿Seguro que quieres eliminar este registro de signos vitales?';

  @override
  String get sinaisVitaisSemValores => 'Sin valores registrados';

  @override
  String sinaisVitaisErroCarregar(String erro) {
    return 'Error al cargar los signos vitales: $erro';
  }

  @override
  String get sinaisVitaisFormEditarTitulo => 'Editar signos vitales';

  @override
  String get sinaisVitaisFormNovoTitulo => 'Nuevos signos vitales';

  @override
  String get sinaisVitaisFormDataRegisto => 'Fecha del registro';

  @override
  String get sinaisVitaisFormHoraRegisto => 'Hora del registro';

  @override
  String get sinaisVitaisFormPressaoTitulo => 'Presión arterial (mmHg)';

  @override
  String get sinaisVitaisFormSistolica => 'Sistólica (máxima)';

  @override
  String get sinaisVitaisFormDiastolica => 'Diastólica (mínima)';

  @override
  String get sinaisVitaisFormTemperatura => 'Temperatura (°C)';

  @override
  String get sinaisVitaisFormGlicemia => 'Glucemia (mg/dL)';

  @override
  String get sinaisVitaisFormFrequencia => 'Frecuencia cardíaca (bpm)';

  @override
  String get sinaisVitaisFormMedirCamara => 'Medir con la cámara';

  @override
  String get sinaisVitaisFormPeso => 'Peso (kg)';

  @override
  String get sinaisVitaisFormDataHora => 'Fecha y hora';

  @override
  String get sinaisVitaisFormNotas => 'Notas';

  @override
  String get sinaisVitaisHistoricoTitulo => 'Historial de signos vitales';

  @override
  String get sinaisVitaisHistorico7Dias => '7 días';

  @override
  String get sinaisVitaisHistorico30Dias => '30 días';

  @override
  String get sinaisVitaisHistoricoPressaoSistolica => 'Presión sistólica';

  @override
  String get sinaisVitaisHistoricoPressaoDiastolica => 'Presión diastólica';

  @override
  String get sinaisVitaisHistoricoTemperaturaTitulo => 'Temperatura';

  @override
  String get sinaisVitaisHistoricoGlicemia => 'Glucemia';

  @override
  String get sinaisVitaisHistoricoFrequenciaCardiaca => 'Frecuencia cardíaca';

  @override
  String get sinaisVitaisHistoricoPeso => 'Peso';

  @override
  String sinaisVitaisHistoricoMedia(String valor, String unidade) {
    return 'Media: $valor $unidade';
  }

  @override
  String get sinaisVitaisHistoricoSemRegistos =>
      'Todavía no hay registros en este período.';

  @override
  String get comumNome => 'Nombre';

  @override
  String get comumEmail => 'Email';

  @override
  String get documentosTirarFotografia => 'Hacer foto';

  @override
  String get documentosEscolherGaleria => 'Elegir de la galería';

  @override
  String get documentosNomeTitulo => 'Nombre del documento';

  @override
  String get documentosNomeHint => 'Ej.: Receta Dr. García, Análisis 2026';

  @override
  String documentosTituloOmissao(String data) {
    return 'Documento $data';
  }

  @override
  String get documentosApagarTitulo => 'Eliminar documento';

  @override
  String documentosApagarConfirmacao(String titulo) {
    return '¿Seguro que quieres eliminar \"$titulo\"?';
  }

  @override
  String get documentosTitulo => 'Documentos';

  @override
  String get documentosNenhum => 'Ningún documento';

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
      'Recetas y análisis guardados solo en este móvil.';

  @override
  String get documentosAdicionarTooltip => 'Añadir documento';

  @override
  String get documentosSemDocumentos => 'Todavía no hay documentos guardados.';

  @override
  String get contactosCuidadoresNovoTitulo => 'Nuevo contacto';

  @override
  String get contactosCuidadoresTitulo => 'Contactos de cuidadores';

  @override
  String get contactosCuidadoresAdicionarTooltip => 'Añadir contacto';

  @override
  String get contactosCuidadoresDescricao =>
      'Se usan para elegir rápidamente con quién compartir un informe.';

  @override
  String get contactosCuidadoresSemContactos =>
      'Todavía no hay contactos guardados.';

  @override
  String get contactosCuidadoresApagarTooltip => 'Eliminar contacto';

  @override
  String contactosCuidadoresErro(String erro) {
    return 'Error al cargar los contactos: $erro';
  }

  @override
  String get rotinaCategoriaHigiene => 'Higiene';

  @override
  String get rotinaCategoriaAlimentacao => 'Alimentación';

  @override
  String get rotinaCategoriaSono => 'Sueño';

  @override
  String get rotinaCategoriaAtividade => 'Actividad';

  @override
  String get rotinaSugestaoBanho => 'Baño';

  @override
  String get rotinaSugestaoEscovarDentes => 'Cepillar los dientes';

  @override
  String get rotinaSugestaoHigieneIntima => 'Higiene íntima';

  @override
  String get rotinaSugestaoPentearCabelo => 'Peinar/arreglar el pelo';

  @override
  String get rotinaSugestaoPequenoAlmoco => 'Desayuno';

  @override
  String get rotinaSugestaoAlmoco => 'Almuerzo';

  @override
  String get rotinaSugestaoLanche => 'Merienda';

  @override
  String get rotinaSugestaoJantar => 'Cena';

  @override
  String get rotinaSugestaoHidratacao => 'Hidratación/Agua';

  @override
  String get rotinaSugestaoSesta => 'Siesta';

  @override
  String get rotinaSugestaoDeitarNoite => 'Acostarse';

  @override
  String get rotinaSugestaoAcordar => 'Despertar';

  @override
  String get rotinaSugestaoPasseio => 'Paseo';

  @override
  String get rotinaSugestaoExercicios => 'Ejercicios';

  @override
  String get rotinaSugestaoAlongamentos => 'Estiramientos';

  @override
  String get rotinaNovoItemTitulo => 'Nuevo elemento de rutina';

  @override
  String get rotinaNovoItemHint => 'Ej.: Baño, Desayuno';

  @override
  String get rotinaTitulo =>
      'Rutina de higiene, alimentación, sueño y actividad';

  @override
  String get rotinaNenhumItem => 'Ningún elemento';

  @override
  String rotinaContagemItens(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get rotinaSelecionarVarios => 'Seleccionar varios';

  @override
  String get rotinaFotoPrato => 'Foto del plato';

  @override
  String get rotinaApagarItem => 'Eliminar elemento';

  @override
  String get rotinaMarcarComoFeito => 'Marcar como hecho';

  @override
  String rotinaMarcarNComoFeito(int count) {
    return 'Marcar $count como hecho';
  }

  @override
  String get rotinaAdicionarItem => 'Añadir elemento';

  @override
  String get humorGraficoTitulo => 'Estado de ánimo';

  @override
  String get humorGraficoSemRegistos =>
      'Todavía no hay registros de ánimo en este período.';

  @override
  String get diaSegAbrev => 'Lun';

  @override
  String get diaTerAbrev => 'Mar';

  @override
  String get diaQuaAbrev => 'Mié';

  @override
  String get diaQuiAbrev => 'Jue';

  @override
  String get diaSexAbrev => 'Vie';

  @override
  String get diaSabAbrev => 'Sáb';

  @override
  String get diaDomAbrev => 'Dom';

  @override
  String get horariosTodosDias => 'Todos los días';

  @override
  String get medicacaoFormEditarTitulo => 'Editar medicación';

  @override
  String get medicacaoFormNovoTitulo => 'Nueva medicación';

  @override
  String get medicacaoFormNome => 'Nombre del medicamento *';

  @override
  String get medicacaoFormNomeErro => 'Indica el nombre del medicamento';

  @override
  String get medicacaoFormDose => 'Dosis';

  @override
  String get medicacaoFormDoseHint => 'Ej.: 1 comprimido, 500 mg, 10 gotas';

  @override
  String get medicacaoFormVia => 'Vía de administración';

  @override
  String get medicacaoFormViaHint => 'Ej.: Oral, Intravenosa';

  @override
  String get medicacaoFormHorariosTitulo => 'Horarios *';

  @override
  String get medicacaoFormPreenchimentoRapido =>
      'Relleno rápido por frecuencia (sustituye los horarios actuales):';

  @override
  String get medicacaoForm1xDia => '1 vez al día';

  @override
  String get medicacaoForm12h => 'Cada 12h';

  @override
  String get medicacaoForm8h => 'Cada 8h';

  @override
  String get medicacaoFormPrimeiraToma => 'Primera toma';

  @override
  String get medicacaoFormAdicionarHorario => 'Añadir horario';

  @override
  String get medicacaoFormErroHorarios => 'Añade al menos un horario';

  @override
  String get medicacaoFormDiasSemanaTitulo => 'Días de la semana';

  @override
  String get medicacaoFormDiasSemanaDescricao =>
      'No elijas ninguno para tomarlo todos los días.';

  @override
  String get medicacaoFormDataInicio => 'Fecha de inicio';

  @override
  String get medicacaoFormDataFim => 'Fecha de fin (opcional)';

  @override
  String get medicacaoFormNaoDefinida => 'No definida';

  @override
  String get medicacaoFormSemDataDefinida => 'Sin fecha definida';

  @override
  String get medicacaoFormLembretesAtivos => 'Recordatorios activos';

  @override
  String get medicacaoFormLembretesDescricao =>
      'Desactiva para pausar sin eliminar el registro';

  @override
  String get consultaFormEditarTratamento => 'Editar tratamiento';

  @override
  String get consultaFormEditarConsulta => 'Editar cita';

  @override
  String get consultaFormNovoTratamento => 'Nuevo tratamiento';

  @override
  String get consultaFormNovaConsulta => 'Nueva cita';

  @override
  String get consultaFormDataConsulta => 'Fecha de la cita';

  @override
  String get consultaFormHoraConsulta => 'Hora de la cita';

  @override
  String get consultaFormTipoConsultaMedica => 'Cita médica';

  @override
  String get consultaFormTipoTratamento => 'Tratamiento';

  @override
  String get consultaFormTipoTratamentoLabel => 'Tipo de tratamiento *';

  @override
  String get consultaFormEspecialidadeLabel => 'Especialidad *';

  @override
  String get consultaFormTipoTratamentoHint => 'Ej.: Fisioterapia, Enfermería';

  @override
  String get consultaFormEspecialidadeHint =>
      'Ej.: Medicina general, Cardiología';

  @override
  String get consultaFormTipoTratamentoErro => 'Indica el tipo de tratamiento';

  @override
  String get consultaFormEspecialidadeErro => 'Indica la especialidad';

  @override
  String get consultaFormLocal => 'Lugar';

  @override
  String get consultaFormLocalHint =>
      'Ej.: Centro de salud, Hospital, Clínica privada';

  @override
  String get consultaFormProfissional => 'Profesional';

  @override
  String get consultaFormNomeMedico => 'Nombre del médico';

  @override
  String get consultaFormProfissionalHint => 'Ej.: Enf. María García';

  @override
  String get consultaFormNomeMedicoHint => 'Ej.: Dr. Antonio García';

  @override
  String get consultaFormTratamentoRecorrente => 'Tratamiento recurrente';

  @override
  String get consultaFormTratamentoRecorrenteDescricao =>
      'Se repite a diario o en días específicos de la semana';

  @override
  String get consultaFormDataHoraInicio => 'Fecha y hora de inicio';

  @override
  String get consultaFormDataHora => 'Fecha y hora';

  @override
  String get consultaFormDiasSemanaDescricao =>
      'No elijas ninguno para repetir todos los días.';

  @override
  String get consultaFormProximoTratamento => 'Próximo tratamiento (opcional)';

  @override
  String get consultaFormProximaConsultaOpcional => 'Próxima cita (opcional)';

  @override
  String get consultaFormLembreteAtivo => 'Recordatorio activo';

  @override
  String get consultaFormLembreteRecorrente =>
      'Avisa todos los días (o en los días elegidos) a la hora definida';

  @override
  String get consultaFormLembreteTratamento =>
      'Avisa antes del tratamiento y del siguiente, si son futuros';

  @override
  String get consultaFormLembreteConsulta =>
      'Avisa antes de la cita y de la siguiente, si son futuras';

  @override
  String get profissionaisEspecialidadeLabel => 'Especialidad';

  @override
  String get profissionaisEspecialidadeHint => 'Ej.: Cardiología';

  @override
  String get profissionaisInstituicao => 'Institución';

  @override
  String get profissionaisInstituicaoHint => 'Ej.: Hospital, clínica, farmacia';

  @override
  String get profissionaisContacto => 'Contacto';

  @override
  String get profissionaisVazio =>
      'Todavía no hay profesionales registrados. Aparecen aquí automáticamente a medida que rellenas el nombre del médico/profesional en una cita o tratamiento.';

  @override
  String get profissionaisLigarTooltip => 'Llamar';

  @override
  String get tipoCuidadoHumor => 'Ánimo';

  @override
  String get tipoCuidadoOutro => 'Otro';

  @override
  String get relatorioSeccaoCuidados => 'Rutina / cuidados diarios';

  @override
  String get relatorioSeccaoNotas => 'Notas persistentes';

  @override
  String get relatorioPartilharTitulo => '¿Compartir con quién?';

  @override
  String relatorioEuMesmo(String email) {
    return 'Yo mismo ($email)';
  }

  @override
  String get relatorioNenhum => 'Ninguno';

  @override
  String get relatorioContinuar => 'Continuar';

  @override
  String get relatorioTitulo => 'Generar informe';

  @override
  String get relatorioPeriodoTitulo => 'Período';

  @override
  String get relatorioPeriodoHoje => 'Hoy';

  @override
  String get relatorioPeriodoUltimos7Dias => 'Últimos 7 días';

  @override
  String get relatorioPeriodoUltimos30Dias => 'Últimos 30 días';

  @override
  String get relatorioPeriodoPersonalizado => 'Período personalizado';

  @override
  String get relatorioPeriodoPersonalizadoUpsell =>
      'Elegir un período personalizado es una función Premium. En el plan Gratis, tienes los últimos 7 o 30 días.';

  @override
  String get relatorioPeriodoHelpText => 'Período del informe';

  @override
  String relatorioIntervalo(String inicio, String fim) {
    return '$inicio a $fim';
  }

  @override
  String get relatorioSeccoesTitulo => 'Secciones a incluir';

  @override
  String get relatorioSeccoesDescricao =>
      'La medicación y las citas siempre forman parte del informe.';

  @override
  String get relatorioPersonalizacaoTitulo => 'Personalización';

  @override
  String get relatorioPersonalizacaoUpsell =>
      'Añadir tu nombre y logotipo al informe es una función Premium.';

  @override
  String get relatorioNomeCuidador =>
      'Nombre del cuidador profesional (opcional)';

  @override
  String get relatorioAdicionarLogo => 'Añadir logotipo';

  @override
  String get relatorioAlterarLogo => 'Cambiar logotipo';

  @override
  String get relatorioLogoUpsell =>
      'Personalizar el informe con un logotipo es una función Premium.';

  @override
  String get relatorioGerarBotao => 'Generar informe';

  @override
  String get relatorioPreviewTitulo => 'Informe';

  @override
  String relatorioPdfTitulo(String nome) {
    return 'Informe de cuidados - $nome';
  }

  @override
  String relatorioPdfPeriodo(String inicio, String fim) {
    return 'Período: $inicio a $fim';
  }

  @override
  String relatorioPdfGeradoEm(String dataHora) {
    return 'Generado el: $dataHora';
  }

  @override
  String relatorioPdfCuidador(String nome) {
    return 'Cuidador: $nome';
  }

  @override
  String get relatorioPdfMedicacaoTitulo => 'Medicación actual';

  @override
  String get relatorioPdfSemMedicacao => 'Sin medicación activa registrada.';

  @override
  String get relatorioPdfColunaMedicamento => 'Medicamento';

  @override
  String get relatorioPdfColunaDose => 'Dosis';

  @override
  String get relatorioPdfColunaVia => 'Vía';

  @override
  String get relatorioPdfColunaHorarios => 'Horarios';

  @override
  String get relatorioPdfColunaDias => 'Días';

  @override
  String get relatorioPdfConsultasTitulo =>
      'Citas y tratamientos en el período';

  @override
  String get relatorioPdfSemConsultas =>
      'Sin citas ni tratamientos registrados en el período.';

  @override
  String get relatorioPdfColunaTipo => 'Tipo';

  @override
  String get relatorioPdfColunaData => 'Fecha';

  @override
  String get relatorioPdfColunaEspecialidade => 'Especialidad/Tratamiento';

  @override
  String get relatorioPdfColunaLocal => 'Lugar';

  @override
  String get relatorioPdfColunaProfissional => 'Profesional';

  @override
  String get relatorioPdfColunaNotas => 'Notas';

  @override
  String get relatorioPdfTipoConsulta => 'Cita';

  @override
  String get relatorioPdfCuidadosTitulo => 'Cuidados diarios en el período';

  @override
  String get relatorioPdfSemCuidados =>
      'Sin cuidados diarios registrados en el período.';

  @override
  String get relatorioPdfColunaNota => 'Nota';

  @override
  String get relatorioPdfSinaisVitaisTitulo => 'Signos vitales en el período';

  @override
  String get relatorioPdfSemSinaisVitais =>
      'Sin signos vitales registrados en el período.';

  @override
  String get relatorioPdfColunaPressao => 'Presión';

  @override
  String get relatorioPdfColunaTemp => 'Temp.';

  @override
  String get relatorioPdfColunaFreqCardiaca => 'Frec. cardíaca';

  @override
  String calendarioTitulo(String nome) {
    return 'Calendario · $nome';
  }

  @override
  String get calendarioFiltroConsultas => 'Citas';

  @override
  String get calendarioFiltroTratamentos => 'Tratamientos';

  @override
  String get calendarioFiltroCuidados => 'Cuidados diarios';

  @override
  String get calendarioMesFormato => 'Mes';

  @override
  String get calendarioSemEventos => 'Sin eventos en este día.';

  @override
  String get avaliacaoTitulo => '¿Te está gustando CuidarPT?';

  @override
  String get avaliacaoDescricao =>
      'Si CuidarPT te está ayudando a cuidar de quien más lo necesita, una reseña en la tienda ayuda a otras familias a encontrar la app.';

  @override
  String get avaliacaoAgoraNao => 'Ahora no';

  @override
  String get avaliacaoAvaliar => 'Valorar la app';

  @override
  String get freqCardiacaTitulo => 'Medir frecuencia cardíaca';

  @override
  String get freqCardiacaErroGenerico => 'Se produjo un error.';

  @override
  String get freqCardiacaComoMedir => 'Cómo medir';

  @override
  String get freqCardiacaInstrucoesIntro =>
      'En la parte trasera del móvil, la lente de la cámara y el pequeño LED del flash suelen estar muy cerca uno del otro, junto a la esquina superior. Necesitas tapar ambos a la vez:';

  @override
  String get freqCardiacaPasso1 =>
      'Enciende el flash: se enciende solo cuando empieza la medición.';

  @override
  String get freqCardiacaPasso2 =>
      'Coloca la yema de un dedo (no la uña) tapando completamente la lente de la cámara y el flash a la vez.';

  @override
  String get freqCardiacaPasso3 =>
      'Haz un poco de presión, la suficiente para que no entre luz por los bordes, pero sin apretar con fuerza.';

  @override
  String get freqCardiacaPasso4 =>
      'Mantén el dedo completamente quieto hasta que termine la medición (~12 segundos).';

  @override
  String get freqCardiacaAvisoNaoMedico =>
      'La app no es un dispositivo médico: el valor es solo informativo.';

  @override
  String get freqCardiacaDicasTitulo => 'Si falla muchas veces, prueba esto:';

  @override
  String get freqCardiacaDicasTexto =>
      '• Confirma que estás tapando la cámara Y el flash, no solo uno de ellos.\n• No aprietes con fuerza: cortar la circulación empeora la lectura.\n• Apoya el codo en algo estable para que el dedo no tiemble.\n• Limpia la lente si tiene huellas o suciedad.\n• Quita una funda muy gruesa que tape mal el flash.';

  @override
  String get freqCardiacaAMedir =>
      'Midiendo... mantén el dedo quieto, tapando bien la cámara y el flash.';

  @override
  String get freqCardiacaResultadoTitulo => 'Frecuencia cardíaca';

  @override
  String get freqCardiacaAvisoResultado =>
      'Este valor es solo informativo y no es un diagnóstico. Si tienes dudas o síntomas, consulta a un profesional de la salud.';

  @override
  String get freqCardiacaUsarValor => 'Usar este valor';

  @override
  String get freqCardiacaMedirNovamente => 'Medir de nuevo';

  @override
  String get freqCardiacaTentarNovamente => 'Intentar de nuevo';

  @override
  String get faixaBaixa => 'Baja';

  @override
  String get faixaNormal => 'Normal';

  @override
  String get faixaElevada => 'Alta';

  @override
  String get comumTelefone => 'Teléfono';

  @override
  String notificacaoMedicacaoTitulo(String nome) {
    return 'Medicación · $nome';
  }

  @override
  String notificacaoConsultaTitulo(String nome) {
    return 'Cita · $nome';
  }

  @override
  String notificacaoProximaConsultaTitulo(String nome) {
    return 'Próxima cita · $nome';
  }

  @override
  String notificacaoTratamentoTitulo(String nome) {
    return 'Tratamiento · $nome';
  }

  @override
  String get notificacaoTesteCorpo =>
      'Notificación de prueba: si ves esto, las notificaciones funcionan en este móvil.';

  @override
  String get idosoFormEditarTitulo => 'Editar perfil';

  @override
  String get idosoFormNovoTitulo => 'Nuevo perfil';

  @override
  String get idosoFormRotinaUpsell =>
      'La rutina de higiene y alimentación es una función Premium. Suscríbete a Premium para activarla.';

  @override
  String get idosoFormDataNascimentoHelp => 'Fecha de nacimiento';

  @override
  String get idosoFormIdentificacao => 'Identificación';

  @override
  String get idosoFormMobilidadeReduzida => 'Movilidad reducida';

  @override
  String get idosoFormAcamado => 'Encamado';

  @override
  String get idosoFormSexo => 'Sexo';

  @override
  String get idosoFormMasculino => 'Masculino';

  @override
  String get idosoFormFeminino => 'Femenino';

  @override
  String get idosoFormNome => 'Nombre *';

  @override
  String get idosoFormNomeErro => 'Indica el nombre de la persona';

  @override
  String get idosoFormContactosEmergenciaTitulo => 'Contactos de emergencia';

  @override
  String get idosoFormRemoverContacto => 'Eliminar contacto';

  @override
  String get idosoFormAdicionarContacto => 'Añadir contacto';

  @override
  String get idosoFormSaude => 'Salud';

  @override
  String get idosoFormNotasSaude => 'Notas (alergias, condiciones de salud)';

  @override
  String get idosoFormPreferenciasHabitos => 'Preferencias y hábitos';

  @override
  String get idosoFormComidaPreferida => 'Comida preferida';

  @override
  String get idosoFormMusica => 'Música';

  @override
  String get idosoFormInteressesPessoais => 'Intereses personales';

  @override
  String get idosoFormRotinaTitulo => 'Rutina de higiene, alimentación y sueño';

  @override
  String get idosoFormRotinaDescricao =>
      'Función Premium. Registra elementos recurrentes (ej.: baño, comidas, siesta) y márcalos como hechos en el día.';

  @override
  String get notasEditarTooltip => 'Editar notas';

  @override
  String get notasHint => 'Alergias, preferencias, indicaciones generales...';

  @override
  String get notasSemNotas => 'Sin notas.';

  @override
  String get premiumSubscreverTitulo => 'Suscribirse a Premium';

  @override
  String get premiumErroCarregarPlanos =>
      'No se pudieron cargar los planes en este momento. Comprueba tu conexión e inténtalo de nuevo más tarde.';

  @override
  String premiumErroCarregar(String erro) {
    return 'Error al cargar los planes: $erro';
  }

  @override
  String get premiumRestaurarCompra => 'Ya estoy suscrito: restaurar compra';

  @override
  String get definicoesCancelarAntesTitulo => 'Antes de cancelar';

  @override
  String get definicoesJaConstruiste => 'Ya has construido esto en la app:';

  @override
  String definicoesPerfilIdoso(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perfiles',
      one: '1 perfil',
    );
    return '$_temp0';
  }

  @override
  String definicoesMedicacaoRegistada(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medicaciones registradas',
      one: '1 medicación registrada',
    );
    return '$_temp0';
  }

  @override
  String definicoesConsultaTratamento(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count citas/tratamientos',
      one: '1 cita/tratamiento',
    );
    return '$_temp0';
  }

  @override
  String definicoesRegistoSinaisVitais(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros de signos vitales',
      one: '1 registro de signos vitales',
    );
    return '$_temp0';
  }

  @override
  String get definicoesAoCancelarPremium =>
      'Al cancelar Premium, dejarás de poder:';

  @override
  String get definicoesPerdeVerPerfis => 'Ver más de 2 perfiles';

  @override
  String get definicoesPerdeSinaisVitais => 'Registrar signos vitales';

  @override
  String get definicoesPerdeRelatoriosPersonalizados =>
      'Personalizar informes PDF';

  @override
  String get definicoesPerdeHistoricoIlimitado =>
      'Ver historial y período de informe sin límite';

  @override
  String get definicoesDadosContinuamGuardados =>
      'Tus datos siguen guardados en el móvil: cancelar no elimina nada.';

  @override
  String get definicoesVoltar => 'Volver';

  @override
  String get definicoesContinuarPlayStore => 'Continuar a Play Store';

  @override
  String get definicoesAparencia => 'Apariencia';

  @override
  String get definicoesTema => 'Tema';

  @override
  String get definicoesTemaClaro => 'Claro';

  @override
  String get definicoesTemaEscuro => 'Oscuro';

  @override
  String get definicoesTamanhoLetra => 'Tamaño de letra';

  @override
  String get definicoesTamanhoPequeno => 'Pequeño';

  @override
  String get definicoesTamanhoMedio => 'Mediano';

  @override
  String get definicoesTamanhoGrande => 'Grande';

  @override
  String get definicoesSubscricaoTitulo => 'Suscripción';

  @override
  String get definicoesACarregar => 'Cargando...';

  @override
  String definicoesTrialAtivo(int dias) {
    return 'Período de prueba Premium: quedan $dias día(s).';
  }

  @override
  String get definicoesPlanoPremiumAtivo => 'Plan Premium activo.';

  @override
  String get definicoesPlanoGratis => 'Plan Gratis.';

  @override
  String get definicoesOQueInclui => 'Qué incluye Premium:';

  @override
  String get definicoesBeneficioPerfis => 'Perfiles ilimitados';

  @override
  String get definicoesBeneficioRelatorios =>
      'Informes PDF personalizables (nombre/logotipo)';

  @override
  String get definicoesBeneficioHistorico =>
      'Historial y período de informe ilimitados';

  @override
  String get definicoesBeneficioMeteorologia =>
      'Avisos meteorológicos oficiales';

  @override
  String get definicoesPrecos => '€1,99/mes · €9,99/6 meses · €19,99/año';

  @override
  String get definicoesGerirCancelar => 'Gestionar o cancelar suscripción';

  @override
  String get definicoesPerfisIdosos => 'Perfiles';

  @override
  String get definicoesIlimitados => 'ilimitados';

  @override
  String definicoesPerfisEmUso(int total, String limite) {
    return '$total de $limite perfiles en uso.';
  }

  @override
  String get definicoesVerPerfis => 'Ver perfiles';

  @override
  String get definicoesNotificacoes => 'Notificaciones';

  @override
  String get definicoesNotificacoesDescricao =>
      'Los recordatorios de medicación y citas son notificaciones locales, programadas directamente en este móvil.';

  @override
  String get definicoesTestarNotificacao => 'Probar notificación ahora';

  @override
  String get definicoesNotificacaoTesteEnviada =>
      'Notificación de prueba enviada: comprueba la barra de notificaciones.';

  @override
  String get definicoesTroubleshootingNotificacoes =>
      'Si la notificación de prueba no aparece, o si los recordatorios programados no llegan: comprueba en Ajustes de Android → Aplicaciones → CuidarPT → Notificaciones, si están permitidas; y en Batería, si la optimización de batería está desactivada para CuidarPT (en algunos móviles se llama \"sin restricciones\" o \"permitir actividad en segundo plano\"). Muchas marcas (Xiaomi, Samsung, Huawei, etc.) bloquean los recordatorios de apps en segundo plano por defecto.';

  @override
  String get definicoesSobre => 'Acerca de';

  @override
  String definicoesVersaoSufixo(String versao) {
    return ' — versión $versao';
  }

  @override
  String get definicoesDadosSoTelemovel =>
      'Todos los datos se guardan solo en este móvil.';

  @override
  String get definicoesAvisoNaoDispositivoMedico =>
      'CuidarPT no es un dispositivo médico y no sustituye la evaluación, el diagnóstico ni el tratamiento de un profesional de la salud.';

  @override
  String get definicoesPoliticaPrivacidade => 'Política de privacidad';

  @override
  String get premiumPlanoMensal => 'Mensual';

  @override
  String get premiumPlano6Meses => '6 meses';

  @override
  String get premiumPlanoAnual => 'Anual';

  @override
  String premiumPoupancaLabel(int percentagem, String valor) {
    return 'Ahorras $percentagem% · equivale a $valor/mes';
  }

  @override
  String erroArranqueTexto(String erro) {
    return 'Se produjo un error al cargar la app: $erro';
  }
}
