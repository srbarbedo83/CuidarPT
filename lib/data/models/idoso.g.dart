// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idoso.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIdosoCollection on Isar {
  IsarCollection<Idoso> get idosos => this.collection();
}

const IdosoSchema = CollectionSchema(
  name: r'Idoso',
  id: 2313243858971341846,
  properties: {
    r'atualizadoEm': PropertySchema(
      id: 0,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'contactoEmergenciaNome': PropertySchema(
      id: 1,
      name: r'contactoEmergenciaNome',
      type: IsarType.string,
    ),
    r'contactoEmergenciaTelefone': PropertySchema(
      id: 2,
      name: r'contactoEmergenciaTelefone',
      type: IsarType.string,
    ),
    r'criadoEm': PropertySchema(
      id: 3,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'dataNascimento': PropertySchema(
      id: 4,
      name: r'dataNascimento',
      type: IsarType.dateTime,
    ),
    r'fotoPath': PropertySchema(
      id: 5,
      name: r'fotoPath',
      type: IsarType.string,
    ),
    r'nome': PropertySchema(id: 6, name: r'nome', type: IsarType.string),
    r'notas': PropertySchema(id: 7, name: r'notas', type: IsarType.string),
  },

  estimateSize: _idosoEstimateSize,
  serialize: _idosoSerialize,
  deserialize: _idosoDeserialize,
  deserializeProp: _idosoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _idosoGetId,
  getLinks: _idosoGetLinks,
  attach: _idosoAttach,
  version: '3.3.2',
);

int _idosoEstimateSize(
  Idoso object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contactoEmergenciaNome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactoEmergenciaTelefone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fotoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nome.length * 3;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _idosoSerialize(
  Idoso object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.atualizadoEm);
  writer.writeString(offsets[1], object.contactoEmergenciaNome);
  writer.writeString(offsets[2], object.contactoEmergenciaTelefone);
  writer.writeDateTime(offsets[3], object.criadoEm);
  writer.writeDateTime(offsets[4], object.dataNascimento);
  writer.writeString(offsets[5], object.fotoPath);
  writer.writeString(offsets[6], object.nome);
  writer.writeString(offsets[7], object.notas);
}

Idoso _idosoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Idoso();
  object.atualizadoEm = reader.readDateTime(offsets[0]);
  object.contactoEmergenciaNome = reader.readStringOrNull(offsets[1]);
  object.contactoEmergenciaTelefone = reader.readStringOrNull(offsets[2]);
  object.criadoEm = reader.readDateTime(offsets[3]);
  object.dataNascimento = reader.readDateTimeOrNull(offsets[4]);
  object.fotoPath = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.nome = reader.readString(offsets[6]);
  object.notas = reader.readStringOrNull(offsets[7]);
  return object;
}

P _idosoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _idosoGetId(Idoso object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _idosoGetLinks(Idoso object) {
  return [];
}

void _idosoAttach(IsarCollection<dynamic> col, Id id, Idoso object) {
  object.id = id;
}

extension IdosoQueryWhereSort on QueryBuilder<Idoso, Idoso, QWhere> {
  QueryBuilder<Idoso, Idoso, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IdosoQueryWhere on QueryBuilder<Idoso, Idoso, QWhereClause> {
  QueryBuilder<Idoso, Idoso, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IdosoQueryFilter on QueryBuilder<Idoso, Idoso, QFilterCondition> {
  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> atualizadoEmEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'atualizadoEm', value: value),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> atualizadoEmGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'atualizadoEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> atualizadoEmLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'atualizadoEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> atualizadoEmBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'atualizadoEm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contactoEmergenciaNome'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contactoEmergenciaNome'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactoEmergenciaNome',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactoEmergenciaNome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactoEmergenciaNome',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactoEmergenciaNome', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaNomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'contactoEmergenciaNome',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contactoEmergenciaTelefone'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'contactoEmergenciaTelefone',
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactoEmergenciaTelefone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactoEmergenciaTelefone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactoEmergenciaTelefone',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactoEmergenciaTelefone',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition>
  contactoEmergenciaTelefoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'contactoEmergenciaTelefone',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> criadoEmEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'criadoEm', value: value),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> criadoEmGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'criadoEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> criadoEmLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'criadoEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> criadoEmBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'criadoEm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dataNascimento'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dataNascimento'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataNascimento', value: value),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataNascimento',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataNascimento',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> dataNascimentoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataNascimento',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fotoPath'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fotoPath'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fotoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fotoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fotoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fotoPath', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> fotoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fotoPath', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nome',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nome',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nome', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nome', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notas',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notas',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notas',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterFilterCondition> notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notas', value: ''),
      );
    });
  }
}

extension IdosoQueryObject on QueryBuilder<Idoso, Idoso, QFilterCondition> {}

extension IdosoQueryLinks on QueryBuilder<Idoso, Idoso, QFilterCondition> {}

extension IdosoQuerySortBy on QueryBuilder<Idoso, Idoso, QSortBy> {
  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByContactoEmergenciaNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaNome', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByContactoEmergenciaNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaNome', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByContactoEmergenciaTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaTelefone', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy>
  sortByContactoEmergenciaTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaTelefone', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByDataNascimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataNascimento', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByDataNascimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataNascimento', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByFotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByFotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension IdosoQuerySortThenBy on QueryBuilder<Idoso, Idoso, QSortThenBy> {
  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByContactoEmergenciaNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaNome', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByContactoEmergenciaNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaNome', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByContactoEmergenciaTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaTelefone', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy>
  thenByContactoEmergenciaTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoEmergenciaTelefone', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByDataNascimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataNascimento', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByDataNascimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataNascimento', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByFotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByFotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Idoso, Idoso, QAfterSortBy> thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension IdosoQueryWhereDistinct on QueryBuilder<Idoso, Idoso, QDistinct> {
  QueryBuilder<Idoso, Idoso, QDistinct> distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByContactoEmergenciaNome({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactoEmergenciaNome',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByContactoEmergenciaTelefone({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactoEmergenciaTelefone',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByDataNascimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataNascimento');
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByFotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByNome({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Idoso, Idoso, QDistinct> distinctByNotas({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }
}

extension IdosoQueryProperty on QueryBuilder<Idoso, Idoso, QQueryProperty> {
  QueryBuilder<Idoso, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Idoso, DateTime, QQueryOperations> atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<Idoso, String?, QQueryOperations>
  contactoEmergenciaNomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoEmergenciaNome');
    });
  }

  QueryBuilder<Idoso, String?, QQueryOperations>
  contactoEmergenciaTelefoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoEmergenciaTelefone');
    });
  }

  QueryBuilder<Idoso, DateTime, QQueryOperations> criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<Idoso, DateTime?, QQueryOperations> dataNascimentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataNascimento');
    });
  }

  QueryBuilder<Idoso, String?, QQueryOperations> fotoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotoPath');
    });
  }

  QueryBuilder<Idoso, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<Idoso, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }
}
