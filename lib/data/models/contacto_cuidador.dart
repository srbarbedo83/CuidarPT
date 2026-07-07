import 'package:isar_community/isar.dart';

part 'contacto_cuidador.g.dart';

/// Contacto de outro cuidador (nome/email) guardado localmente, para
/// selecionar rapidamente quem deve receber um relatório partilhado.
@collection
class ContactoCuidador {
  Id id = Isar.autoIncrement;

  late String nome;

  late String email;
}
