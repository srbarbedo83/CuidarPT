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
}
