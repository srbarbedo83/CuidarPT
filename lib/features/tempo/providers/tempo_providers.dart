import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/isar_providers.dart';
import '../../../data/models/localidade_ipma.dart';
import '../../../data/repositories/info_local_cache_repository.dart';
import '../../../data/repositories/localidade_ipma_repository.dart';
import '../../../data/repositories/localizacao_selecionada_repository.dart';
import '../models/aviso_meteorologico.dart';
import '../models/previsao_dia.dart';
import '../services/ipma_service.dart';

final ipmaServiceProvider = Provider<IpmaService>((ref) => IpmaService());

final localidadeIpmaRepositoryProvider = Provider<LocalidadeIpmaRepository>((ref) {
  return LocalidadeIpmaRepository(ref.watch(isarInstanceProvider));
});

final localizacaoSelecionadaRepositoryProvider = Provider<LocalizacaoSelecionadaRepository>((ref) {
  return LocalizacaoSelecionadaRepository(ref.watch(isarInstanceProvider));
});

final infoLocalCacheRepositoryProvider = Provider<InfoLocalCacheRepository>((ref) {
  return InfoLocalCacheRepository(ref.watch(isarInstanceProvider));
});

final localizacaoSelecionadaProvider = StreamProvider((ref) {
  return ref.watch(localizacaoSelecionadaRepositoryProvider).watch();
});

/// Lista de localidades (distritos/ilhas) para o seletor — tenta atualizar
/// a partir do IPMA e cai para a cópia local se não houver ligação.
final localidadesProvider = FutureProvider<List<LocalidadeIpma>>((ref) async {
  final repository = ref.watch(localidadeIpmaRepositoryProvider);
  final servico = ref.watch(ipmaServiceProvider);
  try {
    final corpo = await servico.obterCorpo(IpmaService.urlLocalidades);
    final localidades = parseLocalidades(corpo);
    if (localidades.isNotEmpty) {
      await repository.substituirTodas(localidades);
    }
    return localidades;
  } catch (_) {
    return repository.listarTodas();
  }
});

class InfoLocalEstado {
  const InfoLocalEstado({
    required this.previsao,
    required this.avisos,
    required this.deCache,
    this.atualizadoEm,
  });

  final List<PrevisaoDia> previsao;
  final List<AvisoMeteorologico> avisos;
  final bool deCache;
  final DateTime? atualizadoEm;

  static const vazio = InfoLocalEstado(previsao: [], avisos: [], deCache: false);
}

/// Previsão do tempo e avisos oficiais da localização escolhida. Tenta
/// sempre atualizar a partir do IPMA; se falhar (sem rede, IPMA em baixo),
/// usa a última cópia guardada localmente.
final infoLocalProvider = FutureProvider.autoDispose<InfoLocalEstado>((ref) async {
  final localizacao = ref.watch(localizacaoSelecionadaProvider).valueOrNull;
  final globalIdLocal = localizacao?.globalIdLocal;
  if (globalIdLocal == null) return InfoLocalEstado.vazio;

  final idAreaAviso = localizacao?.idAreaAviso;
  final servico = ref.watch(ipmaServiceProvider);
  final cacheRepository = ref.watch(infoLocalCacheRepositoryProvider);

  try {
    final corpoPrevisao = await servico.obterCorpo(IpmaService.urlPrevisao(globalIdLocal));
    final previsao = parsePrevisao(corpoPrevisao);

    String? corpoAvisos;
    var avisos = const <AvisoMeteorologico>[];
    if (idAreaAviso != null) {
      corpoAvisos = await servico.obterCorpo(IpmaService.urlAvisos);
      avisos = parseAvisos(corpoAvisos, idAreaAviso);
    }

    await cacheRepository.guardar(previsaoJson: corpoPrevisao, avisosJson: corpoAvisos);
    return InfoLocalEstado(previsao: previsao, avisos: avisos, deCache: false, atualizadoEm: DateTime.now());
  } catch (_) {
    final cache = await cacheRepository.obter();
    final previsaoCache = cache?.previsaoJson;
    if (previsaoCache == null) return InfoLocalEstado.vazio;

    final previsao = parsePrevisao(previsaoCache);
    final avisosCache = cache?.avisosJson;
    final avisos = (avisosCache != null && idAreaAviso != null)
        ? parseAvisos(avisosCache, idAreaAviso)
        : const <AvisoMeteorologico>[];

    return InfoLocalEstado(previsao: previsao, avisos: avisos, deCache: true, atualizadoEm: cache?.atualizadoEm);
  }
});
