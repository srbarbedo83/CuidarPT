/// Gera IDs de notificação determinísticos e sem colisões entre os
/// diferentes tipos de lembrete (medicação, consultas, ...).
///
/// Cada registo (identificado pelo seu `id` do Isar) reserva um bloco de
/// [blocoPorRegisto] IDs; cada tipo de lembrete usa um sub-intervalo fixo
/// desse bloco, para que o mesmo `id` numérico em coleções diferentes
/// (ex.: um `RegistoMedicacao` e um `RegistoConsulta`, cada um com o seu
/// próprio contador Isar) nunca produza o mesmo ID de notificação.
class NotificationIds {
  NotificationIds._();

  static const blocoPorRegisto = 1000;

  static const _offsetMedicacao = 0;
  static const _offsetConsulta = 500;

  static int medicacao(int registoId, int indice) {
    assert(indice < _offsetConsulta - _offsetMedicacao);
    return registoId * blocoPorRegisto + _offsetMedicacao + indice;
  }

  static int consulta(int registoId, int indice) {
    assert(indice < blocoPorRegisto - _offsetConsulta);
    return registoId * blocoPorRegisto + _offsetConsulta + indice;
  }
}
