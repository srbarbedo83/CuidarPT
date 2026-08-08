import 'package:flutter/material.dart';

import '../../data/models/registo_cuidado_diario.dart';
import '../../l10n/app_localizations.dart';

String tipoCuidadoDiarioLabel(AppLocalizations l10n, TipoCuidadoDiario tipo) {
  switch (tipo) {
    case TipoCuidadoDiario.higiene:
      return l10n.rotinaCategoriaHigiene;
    case TipoCuidadoDiario.alimentacao:
      return l10n.rotinaCategoriaAlimentacao;
    case TipoCuidadoDiario.humor:
      return l10n.tipoCuidadoHumor;
    case TipoCuidadoDiario.sono:
      return l10n.rotinaCategoriaSono;
    case TipoCuidadoDiario.atividade:
      return l10n.rotinaCategoriaAtividade;
    case TipoCuidadoDiario.outro:
      return l10n.tipoCuidadoOutro;
  }
}

IconData tipoCuidadoDiarioIcone(TipoCuidadoDiario tipo) {
  switch (tipo) {
    case TipoCuidadoDiario.higiene:
      return Icons.shower_outlined;
    case TipoCuidadoDiario.alimentacao:
      return Icons.restaurant_outlined;
    case TipoCuidadoDiario.humor:
      return Icons.mood_outlined;
    case TipoCuidadoDiario.sono:
      return Icons.bedtime_outlined;
    case TipoCuidadoDiario.atividade:
      return Icons.directions_walk_outlined;
    case TipoCuidadoDiario.outro:
      return Icons.notes_outlined;
  }
}
