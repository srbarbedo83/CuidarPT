/// Secções que podem ser incluídas/excluídas ao gerar um relatório.
/// Medicação e consultas fazem sempre parte do relatório; as restantes são
/// opcionais.
enum SeccaoRelatorio { sinaisVitais, cuidados, notas }

String labelSeccaoRelatorio(SeccaoRelatorio seccao) {
  return switch (seccao) {
    SeccaoRelatorio.sinaisVitais => 'Sinais vitais',
    SeccaoRelatorio.cuidados => 'Rotina / cuidados diários',
    SeccaoRelatorio.notas => 'Notas persistentes',
  };
}
