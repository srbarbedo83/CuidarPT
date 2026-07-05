import 'package:flutter/material.dart';

import '../../data/models/registo_cuidado_diario.dart';

String tipoCuidadoDiarioLabel(TipoCuidadoDiario tipo) {
  switch (tipo) {
    case TipoCuidadoDiario.higiene:
      return 'Higiene';
    case TipoCuidadoDiario.alimentacao:
      return 'Alimentação';
    case TipoCuidadoDiario.humor:
      return 'Humor';
    case TipoCuidadoDiario.sono:
      return 'Sono';
    case TipoCuidadoDiario.outro:
      return 'Outro';
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
    case TipoCuidadoDiario.outro:
      return Icons.notes_outlined;
  }
}
