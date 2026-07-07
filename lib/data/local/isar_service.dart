import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/contacto_cuidador.dart';
import '../models/estado_avaliacao_app.dart';
import '../models/estado_subscricao.dart';
import '../models/idoso.dart';
import '../models/info_profissional.dart';
import '../models/item_rotina.dart';
import '../models/perfil_relatorio.dart';
import '../models/preferencias_app.dart';
import '../models/registo_documento.dart';
import '../models/registo_consulta.dart';
import '../models/registo_cuidado_diario.dart';
import '../models/registo_medicacao.dart';
import '../models/registo_sinais_vitais.dart';

/// Abre a instância única do Isar, guardada na pasta privada de documentos
/// da app. Nenhum dado sai do dispositivo.
class IsarService {
  IsarService._();

  static Future<Isar> open() async {
    final documentosDir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [
        EstadoSubscricaoSchema,
        IdosoSchema,
        RegistoMedicacaoSchema,
        RegistoConsultaSchema,
        RegistoCuidadoDiarioSchema,
        PerfilRelatorioSchema,
        EstadoAvaliacaoAppSchema,
        PreferenciasAppSchema,
        RegistoDocumentoSchema,
        ItemRotinaSchema,
        ContactoCuidadorSchema,
        RegistoSinaisVitaisSchema,
        InfoProfissionalSchema,
      ],
      directory: documentosDir.path,
    );
  }
}
