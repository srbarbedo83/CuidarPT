const _diasMinimosDesdeInstalacao = 2;
const _diasEntreConvites = 7;

/// Decide se o convite de avaliação deve aparecer: nunca antes do
/// [_diasMinimosDesdeInstalacao]º dia de uso; depois disso, no máximo uma
/// vez a cada [_diasEntreConvites] dias — exceto quando [forcar] é `true`
/// (ex.: ao gerar um relatório), caso em que ignora esse intervalo mas
/// continua a respeitar o mínimo de dias desde a instalação.
bool deveMostrarConviteAvaliacao({
  required DateTime agora,
  required DateTime instalacaoEm,
  required DateTime? ultimaVezMostrado,
  bool forcar = false,
}) {
  if (agora.difference(instalacaoEm).inDays < _diasMinimosDesdeInstalacao) {
    return false;
  }
  if (ultimaVezMostrado == null || forcar) {
    return true;
  }
  return agora.difference(ultimaVezMostrado).inDays >= _diasEntreConvites;
}
