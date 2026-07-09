import 'package:isar_community/isar.dart';

part 'registo_frequencia_cardiaca.g.dart';

/// De onde veio a medição — hoje só há a câmara do telemóvel, mas a
/// arquitetura já está preparada para outras fontes (Bluetooth, Health
/// Connect, etc.) sem precisar de alterar o modelo.
enum FonteFrequenciaCardiaca { camera, manual, bluetooth }

/// Uma medição de frequência cardíaca (BPM) de um idoso, guardada no
/// histórico. Nunca sai do dispositivo.
@collection
class RegistoFrequenciaCardiaca {
  Id id = Isar.autoIncrement;

  @Index()
  late int idosoId;

  late int bpm;

  @Enumerated(EnumType.name)
  FonteFrequenciaCardiaca fonte = FonteFrequenciaCardiaca.camera;

  String? notas;

  @Index()
  late DateTime timestamp;
}
