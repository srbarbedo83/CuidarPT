import 'package:isar_community/isar.dart';

part 'estado_subscricao.g.dart';

enum Plano { free, premium }

/// Registo único com o estado da subscrição: trial e plano atual. Guardado
/// localmente, tal como todo o resto — sem validação num servidor.
@collection
class EstadoSubscricao {
  Id id = 0;

  late DateTime trialInicio;
  late DateTime trialFim;

  @Enumerated(EnumType.name)
  Plano plano = Plano.free;

  DateTime? premiumExpiraEm;
  String? produtoPlayStoreId;
  DateTime? ultimaValidacaoCompra;

  @ignore
  bool get trialAtivo => DateTime.now().isBefore(trialFim);

  @ignore
  bool get premiumAtivo =>
      plano == Plano.premium &&
      (premiumExpiraEm == null || DateTime.now().isBefore(premiumExpiraEm!));

  @ignore
  bool get isPremium => trialAtivo || premiumAtivo;

  @ignore
  int get diasRestantesTrial {
    final restante = trialFim.difference(DateTime.now());
    if (restante.isNegative) return 0;
    return (restante.inMilliseconds / Duration.millisecondsPerDay).ceil();
  }
}
