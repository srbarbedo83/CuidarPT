import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/horarios.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/models/registo_medicacao.dart';
import '../../calendario/presentation/calendario_screen.dart';
import '../../consultas/presentation/consulta_form_screen.dart';
import '../../consultas/presentation/profissionais_screen.dart';
import '../../consultas/providers/consulta_providers.dart';
import '../../consultas/services/consulta_scheduler.dart';
import '../../cuidados_diarios/presentation/grafico_humor_card.dart';
import '../../cuidados_diarios/providers/cuidado_diario_providers.dart';
import '../../documentos/presentation/documentos_section.dart';
import '../../frequencia_cardiaca/presentation/frequencia_cardiaca_section.dart';
import '../../medicacao/presentation/medicacao_form_screen.dart';
import '../../medicacao/providers/medicacao_providers.dart';
import '../../medicacao/services/medicacao_scheduler.dart';
import '../../relatorios/presentation/relatorio_screen.dart';
import '../../relatorios/services/periodo_relatorio.dart';
import '../../rotina/presentation/rotina_section.dart';
import '../../sinais_vitais/presentation/sinais_vitais_section.dart';
import '../../subscricao/feature_limits.dart';
import '../services/proximo_evento.dart';
import 'idoso_form_screen.dart';
import 'notas_section.dart';

class IdosoDetailScreen extends ConsumerWidget {
  const IdosoDetailScreen({super.key, required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicacaoAsync = ref.watch(medicacaoListProvider(idoso.id));
    final consultasAsync = ref.watch(consultaListProvider(idoso.id));
    final cuidadosAsync = ref.watch(cuidadoDiarioListProvider(idoso.id));

    final proximo = proximoEvento(
      DateTime.now(),
      medicacoes: medicacaoAsync.valueOrNull ?? const [],
      consultas: consultasAsync.valueOrNull ?? const [],
    );

    final telefoneEmergencia = idoso.contactosEmergencia
        .map((c) => c.telefone)
        .firstWhere(
          (telefone) => telefone != null && telefone.isNotEmpty,
          orElse: () => null,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          idoso.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          if (telefoneEmergencia != null)
            IconButton(
              icon: const Icon(
                Icons.phone_in_talk_outlined,
                color: Colors.redAccent,
              ),
              tooltip: 'Ligar para contacto de emergência',
              onPressed: () =>
                  launchUrl(Uri(scheme: 'tel', path: telefoneEmergencia)),
            ),
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            tooltip: 'Calendário',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CalendarioScreen(idoso: idoso)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: 'Gerar relatório',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => RelatorioScreen(idoso: idoso)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar perfil',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => IdosoFormScreen(idoso: idoso)),
            ),
          ),
          PopupMenuButton<VoidCallback>(
            onSelected: (acao) => acao(),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProfissionaisScreen(idoso: idoso),
                  ),
                ),
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.badge_outlined),
                  title: Text('Profissionais'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _CabecalhoFixoDelegate(idoso: idoso),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _InfoSecundariaIdoso(idoso: idoso),
              _ComoSenteHoje(idoso: idoso),
              if (proximo != null) _ProximoEventoCard(proximo: proximo),
              const Divider(height: 32),
              _CabecalhoSeccao(
                titulo: 'Medicação',
                tooltip: 'Adicionar medicação',
                onAdicionar: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MedicacaoFormScreen(idoso: idoso),
                  ),
                ),
              ),
              medicacaoAsync.when(
                data: (registos) {
                  if (registos.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text('Ainda não há medicação registada.'),
                    );
                  }
                  return Column(
                    children: registos
                        .map(
                          (registo) =>
                              _MedicacaoTile(idoso: idoso, registo: registo),
                        )
                        .toList(),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (erro, _) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Erro ao carregar medicação: $erro'),
                ),
              ),
              const Divider(height: 32),
              _CabecalhoSeccao(
                titulo: 'Consultas e tratamentos',
                tooltip: 'Adicionar consulta ou tratamento',
                onAdicionar: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ConsultaFormScreen(idoso: idoso),
                  ),
                ),
              ),
              consultasAsync.when(
                data: (consultas) {
                  if (consultas.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        'Ainda não há consultas ou tratamentos registados.',
                      ),
                    );
                  }
                  return Column(
                    children: consultas
                        .map(
                          (consulta) =>
                              _ConsultaTile(idoso: idoso, consulta: consulta),
                        )
                        .toList(),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (erro, _) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Erro ao carregar consultas: $erro'),
                ),
              ),
              if (idoso.rotinasAtivas &&
                  ref.watch(featureLimitsProvider).permiteRotinas) ...[
                const Divider(height: 32),
                RotinaSection(idoso: idoso),
              ],
              const Divider(height: 32),
              SinaisVitaisSection(idoso: idoso),
              const Divider(height: 32),
              FrequenciaCardiacaSection(idoso: idoso),
              if ((cuidadosAsync.valueOrNull ?? const []).any(
                (r) => r.tipo == TipoCuidadoDiario.humor,
              )) ...[
                const Divider(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GraficoHumorCard(idosoId: idoso.id),
                ),
              ],
              const Divider(height: 32),
              NotasSection(idoso: idoso),
              const Divider(height: 32),
              DocumentosSection(idoso: idoso),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RelatorioScreen(
                        idoso: idoso,
                        periodoInicial: PeriodoRelatorio.hoje,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.summarize_outlined),
                  label: const Text('Gerar relatório diário'),
                ),
              ),
              const SizedBox(height: 24),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ProximoEventoCard extends StatelessWidget {
  const _ProximoEventoCard({required this.proximo});

  final ProximoEvento proximo;

  @override
  Widget build(BuildContext context) {
    final ehMedicacao = proximo.tipo == TipoProximoEvento.medicacao;
    final rotulo = ehMedicacao ? 'Próxima toma' : 'Próxima consulta';
    final formato = ehMedicacao
        ? DateFormat('HH:mm')
        : DateFormat('dd/MM/yyyy HH:mm');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          leading: Icon(
            ehMedicacao ? Icons.medication_outlined : Icons.event_note_outlined,
          ),
          title: Text('$rotulo: ${proximo.titulo}'),
          subtitle: Text(
            '${formato.format(proximo.dataHora)} · ${formatarContagem(DateTime.now(), proximo.dataHora)}',
          ),
        ),
      ),
    );
  }
}

class _CabecalhoSeccao extends StatelessWidget {
  const _CabecalhoSeccao({
    required this.titulo,
    required this.tooltip,
    required this.onAdicionar,
  });

  final String titulo;
  final String tooltip;
  final VoidCallback onAdicionar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              titulo,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: tooltip,
            onPressed: onAdicionar,
          ),
        ],
      ),
    );
  }
}

/// Cabeçalho fixo (foto + nome + nascimento) que fica sempre visível ao
/// fazer scroll no perfil do idoso.
class _CabecalhoFixoDelegate extends SliverPersistentHeaderDelegate {
  _CabecalhoFixoDelegate({required this.idoso});

  final Idoso idoso;

  static const _altura = 88.0;

  @override
  double get minExtent => _altura;

  @override
  double get maxExtent => _altura;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final fotoPath = idoso.fotoPath;
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: overlapsContent ? 2 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: fotoPath != null
                      ? FileImage(File(fotoPath))
                      : null,
                  child: fotoPath == null ? const Icon(Icons.elderly) : null,
                ),
                if (idoso.mobilidadeReduzida)
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(
                        Icons.accessible,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                if (idoso.acamado)
                  Positioned(
                    left: -2,
                    bottom: -2,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(
                        Icons.bed,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    idoso.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (idoso.dataNascimento != null)
                    Text(
                      'Nascimento: ${DateFormat('dd/MM/yyyy').format(idoso.dataNascimento!)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _CabecalhoFixoDelegate oldDelegate) =>
      oldDelegate.idoso != idoso;
}

/// Contactos de emergência, notas e preferências — informação secundária
/// que já não precisa de ficar fixa, ao contrário da foto e do nome.
class _InfoSecundariaIdoso extends StatelessWidget {
  const _InfoSecundariaIdoso({required this.idoso});

  final Idoso idoso;

  @override
  Widget build(BuildContext context) {
    if (idoso.contactosEmergencia.isEmpty &&
        (idoso.notas == null || idoso.notas!.isEmpty) &&
        idoso.preferencias == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final contacto in idoso.contactosEmergencia)
            Text(
              'Emergência: ${contacto.nome ?? ''} ${contacto.telefone ?? ''}'
                  .trim(),
            ),
          if (idoso.notas != null && idoso.notas!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                idoso.notas!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          if (idoso.preferencias != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((idoso.preferencias!.comidaPreferida ?? '').isNotEmpty)
                    _LinhaPreferencia(
                      icone: Icons.restaurant_outlined,
                      texto: idoso.preferencias!.comidaPreferida!,
                    ),
                  if ((idoso.preferencias!.musica ?? '').isNotEmpty)
                    _LinhaPreferencia(
                      icone: Icons.music_note_outlined,
                      texto: idoso.preferencias!.musica!,
                    ),
                  if ((idoso.preferencias!.interesses ?? '').isNotEmpty)
                    _LinhaPreferencia(
                      icone: Icons.interests_outlined,
                      texto: idoso.preferencias!.interesses!,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _LinhaPreferencia extends StatelessWidget {
  const _LinhaPreferencia({required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(icone, size: 14),
          const SizedBox(width: 4),
          Expanded(
            child: Text(texto, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

class _OpcaoHumor {
  const _OpcaoHumor(this.emoji, this.rotulo, this.nivel);

  final String emoji;
  final String rotulo;
  final int nivel;
}

const _opcoesHumorDoDia = [
  _OpcaoHumor('🤕', 'Com dores', 1),
  _OpcaoHumor('😩', 'Cansado', 2),
  _OpcaoHumor('😴', 'Sonolento', 2),
  _OpcaoHumor('🙂', 'Normal', 3),
  _OpcaoHumor('⚡', 'Enérgico', 4),
  _OpcaoHumor('😊', 'Contente', 5),
];

bool _mesmoDiaHumor(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

class _ComoSenteHoje extends ConsumerStatefulWidget {
  const _ComoSenteHoje({required this.idoso});

  final Idoso idoso;

  @override
  ConsumerState<_ComoSenteHoje> createState() => _ComoSenteHojeState();
}

class _ComoSenteHojeState extends ConsumerState<_ComoSenteHoje> {
  bool _aMudar = false;

  Future<void> _registar(
    _OpcaoHumor opcao,
    RegistoCuidadoDiario? existente,
  ) async {
    final registo = existente ?? RegistoCuidadoDiario()
      ..idosoId = widget.idoso.id
      ..tipo = TipoCuidadoDiario.humor;
    registo
      ..humorNivel = opcao.nivel
      ..notaRapida = opcao.rotulo
      ..timestamp = DateTime.now();
    await ref.read(registoCuidadoDiarioRepositoryProvider).save(registo);
    if (mounted) setState(() => _aMudar = false);
  }

  @override
  Widget build(BuildContext context) {
    final cuidados =
        ref.watch(cuidadoDiarioListProvider(widget.idoso.id)).valueOrNull ??
        const [];
    final agora = DateTime.now();
    final registoHoje = cuidados.firstWhereOrNull(
      (c) =>
          c.tipo == TipoCuidadoDiario.humor &&
          _mesmoDiaHumor(c.timestamp, agora),
    );
    final opcaoAtual = registoHoje == null
        ? null
        : _opcoesHumorDoDia.firstWhereOrNull(
            (o) => o.rotulo == registoHoje.notaRapida,
          );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Como se sente hoje?',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              if (opcaoAtual != null && !_aMudar)
                Row(
                  children: [
                    Text(
                      opcaoAtual.emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(opcaoAtual.rotulo)),
                    TextButton(
                      onPressed: () => setState(() => _aMudar = true),
                      child: const Text('Mudar'),
                    ),
                  ],
                )
              else
                Wrap(
                  spacing: 8,
                  children: [
                    for (final opcao in _opcoesHumorDoDia)
                      ActionChip(
                        avatar: Text(
                          opcao.emoji,
                          style: const TextStyle(fontSize: 16),
                        ),
                        label: Text(opcao.rotulo),
                        onPressed: () => _registar(opcao, registoHoje),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicacaoTile extends ConsumerWidget {
  const _MedicacaoTile({required this.idoso, required this.registo});

  final Idoso idoso;
  final RegistoMedicacao registo;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar medicação'),
        content: Text('Queres mesmo apagar "${registo.nomeMedicamento}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      await MedicacaoScheduler.cancelar(registo);
      await ref.read(registoMedicacaoRepositoryProvider).delete(registo.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horarios = registo.horariosMinutos.map(formatarHorario).join(', ');
    return ListTile(
      leading: Icon(
        Icons.medication_outlined,
        color: registo.ativo ? null : Theme.of(context).disabledColor,
      ),
      title: Text(registo.nomeMedicamento),
      subtitle: Text(
        '${registo.dose != null ? '${registo.dose} · ' : ''}'
        '${registo.viaAdministracao != null ? '${registo.viaAdministracao} · ' : ''}$horarios · '
        '${formatarDiasSemana(registo.diasSemana)}'
        '${registo.ativo ? '' : ' · pausada'}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar medicação',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MedicacaoFormScreen(idoso: idoso, registo: registo),
        ),
      ),
    );
  }
}

class _ConsultaTile extends ConsumerWidget {
  const _ConsultaTile({required this.idoso, required this.consulta});

  final Idoso idoso;
  final RegistoConsulta consulta;

  Future<void> _confirmarApagar(BuildContext context, WidgetRef ref) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          consulta.tipo == TipoRegistoConsulta.tratamento
              ? 'Apagar tratamento'
              : 'Apagar consulta',
        ),
        content: Text('Queres mesmo apagar "${consulta.especialidade}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      await ConsultaScheduler.cancelar(consulta);
      await ref.read(registoConsultaRepositoryProvider).delete(consulta.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proxima = consulta.proximaConsultaData;
    final ehTratamento = consulta.tipo == TipoRegistoConsulta.tratamento;
    return ListTile(
      leading: Icon(
        ehTratamento ? Icons.healing_outlined : Icons.event_note_outlined,
      ),
      title: Text(consulta.especialidade),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy HH:mm').format(consulta.dataHora)}'
        '${consulta.local != null ? ' · ${consulta.local}' : ''}'
        '${consulta.nomeMedico != null ? ' · ${consulta.nomeMedico}' : ''}'
        '${proxima != null ? ' · próxima: ${DateFormat('dd/MM/yyyy').format(proxima)}' : ''}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: 'Apagar consulta',
        onPressed: () => _confirmarApagar(context, ref),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ConsultaFormScreen(idoso: idoso, consulta: consulta),
        ),
      ),
    );
  }
}
