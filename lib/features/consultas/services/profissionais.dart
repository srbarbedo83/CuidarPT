import '../../../data/models/registo_consulta.dart';

class Profissional {
  Profissional({required this.nome, required this.especialidades});

  final String nome;
  final Set<String> especialidades;
}

/// Deriva a lista de profissionais (médicos/enfermeiros) já registados nas
/// consultas/tratamentos de um idoso, sem precisar de uma tabela própria —
/// a lista "cresce" à medida que se vão registando nomes.
List<Profissional> profissionaisDoIdoso(List<RegistoConsulta> consultas) {
  final porNome = <String, Set<String>>{};
  for (final consulta in consultas) {
    final nome = consulta.nomeMedico?.trim();
    if (nome == null || nome.isEmpty) continue;
    porNome.putIfAbsent(nome, () => {}).add(consulta.especialidade);
  }

  final profissionais = porNome.entries
      .map((entry) => Profissional(nome: entry.key, especialidades: entry.value))
      .toList()
    ..sort((a, b) => a.nome.compareTo(b.nome));
  return profissionais;
}
