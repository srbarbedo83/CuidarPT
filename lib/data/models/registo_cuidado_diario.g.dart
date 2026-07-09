// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_cuidado_diario.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoCuidadoDiarioCollection on Isar {
  IsarCollection<RegistoCuidadoDiario> get registoCuidadoDiarios =>
      this.collection();
}

const RegistoCuidadoDiarioSchema = CollectionSchema(
  name: r'RegistoCuidadoDiario',
  id: 3943698607774551920,
  properties: {
    r'fotoPath': PropertySchema(
      id: 0,
      name: r'fotoPath',
      type: IsarType.string,
    ),
    r'humorNivel': PropertySchema(
      id: 1,
      name: r'humorNivel',
      type: IsarType.long,
    ),
    r'idosoId': PropertySchema(id: 2, name: r'idosoId', type: IsarType.long),
    r'itemRotinaId': PropertySchema(
      id: 3,
      name: r'itemRotinaId',
      type: IsarType.long,
    ),
    r'notaRapida': PropertySchema(
      id: 4,
      name: r'notaRapida',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 5,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'tipo': PropertySchema(
      id: 6,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _RegistoCuidadoDiariotipoEnumValueMap,
    ),
  },

  estimateSize: _registoCuidadoDiarioEstimateSize,
  serialize: _registoCuidadoDiarioSerialize,
  deserialize: _registoCuidadoDiarioDeserialize,
  deserializeProp: _registoCuidadoDiarioDeserializeProp,
  idName: r'id',
  indexes: {
    r'idosoId': IndexSchema(
      id: -5948741541663978970,
      name: r'idosoId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idosoId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _registoCuidadoDiarioGetId,
  getLinks: _registoCuidadoDiarioGetLinks,
  attach: _registoCuidadoDiarioAttach,
  version: '3.3.2',
);

int _registoCuidadoDiarioEstimateSize(
  RegistoCuidadoDiario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fotoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notaRapida;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.name.length * 3;
  return bytesCount;
}

void _registoCuidadoDiarioSerialize(
  RegistoCuidadoDiario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fotoPath);
  writer.writeLong(offsets[1], object.humorNivel);
  writer.writeLong(offsets[2], object.idosoId);
  writer.writeLong(offsets[3], object.itemRotinaId);
  writer.writeString(offsets[4], object.notaRapida);
  writer.writeDateTime(offsets[5], object.timestamp);
  writer.writeString(offsets[6], object.tipo.name);
}

RegistoCuidadoDiario _registoCuidadoDiarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoCuidadoDiario();
  object.fotoPath = reader.readStringOrNull(offsets[0]);
  object.humorNivel = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.idosoId = reader.readLong(offsets[2]);
  object.itemRotinaId = reader.readLongOrNull(offsets[3]);
  object.notaRapida = reader.readStringOrNull(offsets[4]);
  object.timestamp = reader.readDateTime(offsets[5]);
  object.tipo =
      _RegistoCuidadoDiariotipoValueEnumMap[reader.readStringOrNull(
        offsets[6],
      )] ??
      TipoCuidadoDiario.higiene;
  return object;
}

P _registoCuidadoDiarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (_RegistoCuidadoDiariotipoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TipoCuidadoDiario.higiene)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RegistoCuidadoDiariotipoEnumValueMap = {
  r'higiene': r'higiene',
  r'alimentacao': r'alimentacao',
  r'humor': r'humor',
  r'sono': r'sono',
  r'atividade': r'atividade',
  r'outro': r'outro',
};
const _RegistoCuidadoDiariotipoValueEnumMap = {
  r'higiene': TipoCuidadoDiario.higiene,
  r'alimentacao': TipoCuidadoDiario.alimentacao,
  r'humor': TipoCuidadoDiario.humor,
  r'sono': TipoCuidadoDiario.sono,
  r'atividade': TipoCuidadoDiario.atividade,
  r'outro': TipoCuidadoDiario.outro,
};

Id _registoCuidadoDiarioGetId(RegistoCuidadoDiario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoCuidadoDiarioGetLinks(
  RegistoCuidadoDiario object,
) {
  return [];
}

void _registoCuidadoDiarioAttach(
  IsarCollection<dynamic> col,
  Id id,
  RegistoCuidadoDiario object,
) {
  object.id = id;
}

extension RegistoCuidadoDiarioQueryWhereSort
    on QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QWhere> {
  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhere>
  anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhere>
  anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension RegistoCuidadoDiarioQueryWhere
    on QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QWhereClause> {
  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idosoIdNotEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'idosoId',
                lower: [],
                upper: [idosoId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'idosoId',
                lower: [idosoId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'idosoId',
                lower: [idosoId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'idosoId',
                lower: [],
                upper: [idosoId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idosoIdGreaterThan(int idosoId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'idosoId',
          lower: [idosoId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idosoIdLessThan(int idosoId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'idosoId',
          lower: [],
          upper: [idosoId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  idosoIdBetween(
    int lowerIdosoId,
    int upperIdosoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'idosoId',
          lower: [lowerIdosoId],
          includeLower: includeLower,
          upper: [upperIdosoId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'timestamp', value: [timestamp]),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  timestampNotEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [],
                upper: [timestamp],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [timestamp],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [timestamp],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'timestamp',
                lower: [],
                upper: [timestamp],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  timestampGreaterThan(DateTime timestamp, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [timestamp],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  timestampLessThan(DateTime timestamp, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [],
          upper: [timestamp],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterWhereClause>
  timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'timestamp',
          lower: [lowerTimestamp],
          includeLower: includeLower,
          upper: [upperTimestamp],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RegistoCuidadoDiarioQueryFilter
    on
        QueryBuilder<
          RegistoCuidadoDiario,
          RegistoCuidadoDiario,
          QFilterCondition
        > {
  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fotoPath'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fotoPath'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathGreaterThan(
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathLessThan(
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathBetween(
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fotoPath', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  fotoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fotoPath', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'humorNivel'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'humorNivel'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'humorNivel', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'humorNivel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'humorNivel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  humorNivelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'humorNivel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idBetween(
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

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idosoId', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idosoIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idosoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idosoIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idosoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  idosoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idosoId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'itemRotinaId'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'itemRotinaId'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemRotinaId', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemRotinaId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemRotinaId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  itemRotinaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemRotinaId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notaRapida'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notaRapida'),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notaRapida',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notaRapida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notaRapida',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notaRapida', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  notaRapidaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notaRapida', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoEqualTo(TipoCuidadoDiario value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoGreaterThan(
    TipoCuidadoDiario value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoLessThan(
    TipoCuidadoDiario value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoBetween(
    TipoCuidadoDiario lower,
    TipoCuidadoDiario upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tipo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tipo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoCuidadoDiario,
    RegistoCuidadoDiario,
    QAfterFilterCondition
  >
  tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tipo', value: ''),
      );
    });
  }
}

extension RegistoCuidadoDiarioQueryObject
    on
        QueryBuilder<
          RegistoCuidadoDiario,
          RegistoCuidadoDiario,
          QFilterCondition
        > {}

extension RegistoCuidadoDiarioQueryLinks
    on
        QueryBuilder<
          RegistoCuidadoDiario,
          RegistoCuidadoDiario,
          QFilterCondition
        > {}

extension RegistoCuidadoDiarioQuerySortBy
    on QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QSortBy> {
  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByFotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByFotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByHumorNivel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humorNivel', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByHumorNivelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humorNivel', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByItemRotinaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemRotinaId', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByItemRotinaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemRotinaId', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByNotaRapida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notaRapida', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByNotaRapidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notaRapida', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension RegistoCuidadoDiarioQuerySortThenBy
    on QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QSortThenBy> {
  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByFotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByFotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPath', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByHumorNivel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humorNivel', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByHumorNivelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humorNivel', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByItemRotinaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemRotinaId', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByItemRotinaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemRotinaId', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByNotaRapida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notaRapida', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByNotaRapidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notaRapida', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QAfterSortBy>
  thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension RegistoCuidadoDiarioQueryWhereDistinct
    on QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct> {
  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByFotoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByHumorNivel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'humorNivel');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByItemRotinaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemRotinaId');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByNotaRapida({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notaRapida', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, RegistoCuidadoDiario, QDistinct>
  distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension RegistoCuidadoDiarioQueryProperty
    on
        QueryBuilder<
          RegistoCuidadoDiario,
          RegistoCuidadoDiario,
          QQueryProperty
        > {
  QueryBuilder<RegistoCuidadoDiario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, String?, QQueryOperations>
  fotoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotoPath');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, int?, QQueryOperations>
  humorNivelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'humorNivel');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, int?, QQueryOperations>
  itemRotinaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemRotinaId');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, String?, QQueryOperations>
  notaRapidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notaRapida');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<RegistoCuidadoDiario, TipoCuidadoDiario, QQueryOperations>
  tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
