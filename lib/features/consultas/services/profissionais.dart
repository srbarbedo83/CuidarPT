import '../../../data/models/info_profissional.dart';
import '../../../data/models/registo_consulta.dart';

class Profissional {
  Profissional({
    required this.nome,
    required this.especialidades,
    this.contacto,
    this.notas,
    this.instituicao,
    this.especialidadeManual,
  });

  final String nome;
  final Set<String> especialidades;
  final String? contacto;
  final String? notas;

  /// Instituição associada — hospital, clínica, farmácia, etc.
  final String? instituicao;

  /// Especialidade indicada manualmente (subconjunto de [especialidades]),
  /// usada para pré-preencher o formulário de edição.
  final String? especialidadeManual;
}

/// Deriva a lista de profissionais (médicos/enfermeiros) já registados nas
/// consultas/tratamentos de um idoso, sem precisar de uma tabela própria
/// para os nomes — a lista "cresce" à medida que se vão registando nomes.
/// O contacto, a instituição e as notas, se tiverem sido preenchidos, vêm
/// de [infos]; a especialidade indicada manualmente complementa as que já
/// são detetadas a partir das consultas.
List<Profissional> profissionaisDoIdoso(
  List<RegistoConsulta> consultas, {
  List<InfoProfissional> infos = const [],
}) {
  final porNome = <String, Set<String>>{};
  for (final consulta in consultas) {
    final nome = consulta.nomeMedico?.trim();
    if (nome == null || nome.isEmpty) continue;
    porNome.putIfAbsent(nome, () => {}).add(consulta.especialidade);
  }

  final infoPorNome = {for (final info in infos) info.nome: info};

  final profissionais = porNome.entries
      .map((entry) {
        final info = infoPorNome[entry.key];
        final especialidadeManual = info?.especialidade;
        return Profissional(
          nome: entry.key,
          especialidades: {
            ...entry.value,
            if (especialidadeManual != null && especialidadeManual.isNotEmpty) especialidadeManual,
          },
          contacto: info?.contacto,
          notas: info?.notas,
          instituicao: info?.instituicao,
          especialidadeManual: especialidadeManual,
        );
      })
      .toList()
    ..sort((a, b) => a.nome.compareTo(b.nome));
  return profissionais;
}
