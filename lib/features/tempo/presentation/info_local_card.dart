import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/widgets/premium_upsell.dart';
import '../../subscricao/feature_limits.dart';
import '../models/aviso_meteorologico.dart';
import '../providers/tempo_providers.dart';
import 'selecionar_localizacao_screen.dart';

class InfoLocalCard extends ConsumerWidget {
  const InfoLocalCard({super.key});

  Color _corNivel(BuildContext context, NivelAviso nivel) {
    switch (nivel) {
      case NivelAviso.amarelo:
        return Colors.amber;
      case NivelAviso.laranja:
        return Colors.orange;
      case NivelAviso.vermelho:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizacao = ref.watch(localizacaoSelecionadaProvider).valueOrNull;
    final limites = ref.watch(featureLimitsProvider);

    if (localizacao?.globalIdLocal == null) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.cloud_outlined),
          title: const Text('Previsão do tempo'),
          subtitle: const Text('Escolhe a tua localização para veres a previsão.'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const SelecionarLocalizacaoScreen()),
          ),
        ),
      );
    }

    final infoAsync = ref.watch(infoLocalProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tempo em ${localizacao!.nome}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_location_alt_outlined),
                  tooltip: 'Mudar localização',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SelecionarLocalizacaoScreen()),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Atualizar',
                  onPressed: () => ref.invalidate(infoLocalProvider),
                ),
              ],
            ),
            infoAsync.when(
              data: (info) => _Conteudo(info: info, limites: limites, corNivel: _corNivel),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (erro, _) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Não foi possível obter a previsão: $erro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Conteudo extends StatelessWidget {
  const _Conteudo({required this.info, required this.limites, required this.corNivel});

  final InfoLocalEstado info;
  final FeatureLimits limites;
  final Color Function(BuildContext, NivelAviso) corNivel;

  @override
  Widget build(BuildContext context) {
    final previsao = info.previsao;
    final avisos = info.avisos;
    final deCache = info.deCache;
    final atualizadoEm = info.atualizadoEm;

    if (previsao.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text('Sem dados de previsão disponíveis.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 84,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: previsao.length.clamp(0, 5),
            separatorBuilder: (context, _) => const SizedBox(width: 16),
            itemBuilder: (context, indice) {
              final dia = previsao[indice];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat('EEE', 'pt_PT').format(dia.data)),
                  const SizedBox(height: 4),
                  Text(
                    '${dia.tMax?.round() ?? '—'}° / ${dia.tMin?.round() ?? '—'}°',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (dia.precipitaProb != null)
                    Text(
                      '${dia.precipitaProb!.round()}% chuva',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        if (!limites.permiteAvisosOficiais)
          Row(
            children: [
              const Icon(Icons.star_outline, size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: TextButton(
                  onPressed: () => mostrarLimiteAtingido(
                    context,
                    mensagem: 'Os avisos meteorológicos oficiais (calor/frio extremo, etc.) são '
                        'uma funcionalidade Premium.',
                  ),
                  child: const Text('Avisos oficiais — Premium'),
                ),
              ),
            ],
          )
        else if (avisos.isEmpty)
          const Text('Sem avisos oficiais ativos.')
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: avisos
                .map(
                  (aviso) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: corNivel(context, aviso.nivel),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(aviso.tipo)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        const SizedBox(height: 8),
        Text(
          'Dados: IPMA'
          '${deCache && atualizadoEm != null ? ' · última atualização: ${DateFormat('dd/MM HH:mm').format(atualizadoEm)}' : ''}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
