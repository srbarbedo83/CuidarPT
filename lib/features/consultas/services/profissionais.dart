import '../../../data/models/info_profissional.dart';
import '../../../data/models/registo_consulta.dart';

class Profissional {
  Profissional({
    required this.nome,
    required this.especialidades,
    this.contacto,
    this.notas,
  });

  final String nome;
  final Set<String> especialidades;
  final String? contacto;
  final String? notas;
}

/// Deriva a lista de profissionais (médicos/enfermeiros) já registados nas
/// consultas/tratamentos de um idoso, sem precisar de uma tabela própria
/// para os nomes — a lista "cresce" à medida que se vão registando nomes.
/// O contacto e as notas, se tiverem sido preenchidos, vêm de [infos].
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
      .map(
        (entry) => Profissional(
          nome: entry.key,
          especialidades: entry.value,
          contacto: infoPorNome[entry.key]?.contacto,
          notas: infoPorNome[entry.key]?.notas,
        ),
      )
      .toList()
    ..sort((a, b) => a.nome.compareTo(b.nome));
  return profissionais;
}
