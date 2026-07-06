import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

/// Instância do Isar, injetada em [main.dart] depois de aberta de forma
/// assíncrona (ver [IsarService.open]).
final isarInstanceProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar ainda não foi inicializado.');
});
