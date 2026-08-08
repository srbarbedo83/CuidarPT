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
}
