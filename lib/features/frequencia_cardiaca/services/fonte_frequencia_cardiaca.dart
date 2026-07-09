import 'processador_ppg.dart';

/// Contrato comum para qualquer forma de medir a frequência cardíaca.
/// Hoje só existe a câmara do telemóvel ([MedicaoPpgCamera]), mas o mesmo
/// contrato serve para uma futura fonte por Bluetooth (pulseiras,
/// tensiómetros com sensor de pulso), Health Connect ou Apple Health, sem
/// alterar o ecrã de medição nem o resto da app.
abstract class FonteFrequenciaCardiaca {
  /// Começa a medição e devolve um stream de resultados intermédios (à
  /// espera de sinal, a medir com progresso, concluído com o BPM, ou erro).
  Stream<ResultadoPpg> iniciar();

  /// Termina a medição e liberta os recursos associados (câmara, ligação
  /// Bluetooth, etc.). Deve ser sempre chamado, mesmo que a medição já
  /// tenha terminado sozinha.
  Future<void> parar();
}
