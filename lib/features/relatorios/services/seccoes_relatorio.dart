import '../../../l10n/app_localizations.dart';

/// Secções que podem ser incluídas/excluídas ao gerar um relatório.
/// Medicação e consultas fazem sempre parte do relatório; as restantes são
/// opcionais.
enum SeccaoRelatorio { sinaisVitais, cuidados, notas }

String labelSeccaoRelatorio(AppLocalizations l10n, SeccaoRelatorio seccao) {
  return switch (seccao) {
    SeccaoRelatorio.sinaisVitais => l10n.homeAcaoSinaisVitais,
    SeccaoRelatorio.cuidados => l10n.relatorioSeccaoCuidados,
    SeccaoRelatorio.notas => l10n.relatorioSeccaoNotas,
  };
}
