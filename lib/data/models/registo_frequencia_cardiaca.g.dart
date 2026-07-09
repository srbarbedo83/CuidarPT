// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_frequencia_cardiaca.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoFrequenciaCardiacaCollection on Isar {
  IsarCollection<RegistoFrequenciaCardiaca> get registoFrequenciaCardiacas =>
      this.collection();
}

const RegistoFrequenciaCardiacaSchema = CollectionSchema(
  name: r'RegistoFrequenciaCardiaca',
  id: -6916564971860403078,
  properties: {
    r'bpm': PropertySchema(id: 0, name: r'bpm', type: IsarType.long),
    r'fonte': PropertySchema(
      id: 1,
      name: r'fonte',
      type: IsarType.string,
      enumMap: _RegistoFrequenciaCardiacafonteEnumValueMap,
    ),
    r'idosoId': PropertySchema(id: 2, name: r'idosoId', type: IsarType.long),
    r'notas': PropertySchema(id: 3, name: r'notas', type: IsarType.string),
    r'timestamp': PropertySchema(
      id: 4,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _registoFrequenciaCardiacaEstimateSize,
  serialize: _registoFrequenciaCardiacaSerialize,
  deserialize: _registoFrequenciaCardiacaDeserialize,
  deserializeProp: _registoFrequenciaCardiacaDeserializeProp,
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

  getId: _registoFrequenciaCardiacaGetId,
  getLinks: _registoFrequenciaCardiacaGetLinks,
  attach: _registoFrequenciaCardiacaAttach,
  version: '3.3.2',
);

int _registoFrequenciaCardiacaEstimateSize(
  RegistoFrequenciaCardiaca object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fonte.name.length * 3;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _registoFrequenciaCardiacaSerialize(
  RegistoFrequenciaCardiaca object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bpm);
  writer.writeString(offsets[1], object.fonte.name);
  writer.writeLong(offsets[2], object.idosoId);
  writer.writeString(offsets[3], object.notas);
  writer.writeDateTime(offsets[4], object.timestamp);
}

RegistoFrequenciaCardiaca _registoFrequenciaCardiacaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoFrequenciaCardiaca();
  object.bpm = reader.readLong(offsets[0]);
  object.fonte =
      _RegistoFrequenciaCardiacafonteValueEnumMap[reader.readStringOrNull(
        offsets[1],
      )] ??
      FonteFrequenciaCardiaca.camera;
  object.id = id;
  object.idosoId = reader.readLong(offsets[2]);
  object.notas = reader.readStringOrNull(offsets[3]);
  object.timestamp = reader.readDateTime(offsets[4]);
  return object;
}

P _registoFrequenciaCardiacaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_RegistoFrequenciaCardiacafonteValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              FonteFrequenciaCardiaca.camera)
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RegistoFrequenciaCardiacafonteEnumValueMap = {
  r'camera': r'camera',
  r'manual': r'manual',
  r'bluetooth': r'bluetooth',
};
const _RegistoFrequenciaCardiacafonteValueEnumMap = {
  r'camera': FonteFrequenciaCardiaca.camera,
  r'manual': FonteFrequenciaCardiaca.manual,
  r'bluetooth': FonteFrequenciaCardiaca.bluetooth,
};

Id _registoFrequenciaCardiacaGetId(RegistoFrequenciaCardiaca object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoFrequenciaCardiacaGetLinks(
  RegistoFrequenciaCardiaca object,
) {
  return [];
}

void _registoFrequenciaCardiacaAttach(
  IsarCollection<dynamic> col,
  Id id,
  RegistoFrequenciaCardiaca object,
) {
  object.id = id;
}

extension RegistoFrequenciaCardiacaQueryWhereSort
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QWhere
        > {
  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhere
  >
  anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhere
  >
  anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension RegistoFrequenciaCardiacaQueryWhere
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QWhereClause
        > {
  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
  timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'timestamp', value: [timestamp]),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterWhereClause
  >
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

extension RegistoFrequenciaCardiacaQueryFilter
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QFilterCondition
        > {
  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  bpmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bpm', value: value),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  bpmGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bpm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  bpmLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bpm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  bpmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteEqualTo(FonteFrequenciaCardiaca value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteGreaterThan(
    FonteFrequenciaCardiaca value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteLessThan(
    FonteFrequenciaCardiaca value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteBetween(
    FonteFrequenciaCardiaca lower,
    FonteFrequenciaCardiaca upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fonte',
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fonte',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fonte',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fonte', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  fonteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fonte', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasGreaterThan(
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasLessThan(
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasBetween(
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterFilterCondition
  >
  notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
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
}

extension RegistoFrequenciaCardiacaQueryObject
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QFilterCondition
        > {}

extension RegistoFrequenciaCardiacaQueryLinks
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QFilterCondition
        > {}

extension RegistoFrequenciaCardiacaQuerySortBy
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QSortBy
        > {
  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByFonte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fonte', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByFonteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fonte', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RegistoFrequenciaCardiacaQuerySortThenBy
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QSortThenBy
        > {
  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByFonte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fonte', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByFonteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fonte', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    RegistoFrequenciaCardiaca,
    QAfterSortBy
  >
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RegistoFrequenciaCardiacaQueryWhereDistinct
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QDistinct
        > {
  QueryBuilder<RegistoFrequenciaCardiaca, RegistoFrequenciaCardiaca, QDistinct>
  distinctByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bpm');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, RegistoFrequenciaCardiaca, QDistinct>
  distinctByFonte({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fonte', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, RegistoFrequenciaCardiaca, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, RegistoFrequenciaCardiaca, QDistinct>
  distinctByNotas({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, RegistoFrequenciaCardiaca, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension RegistoFrequenciaCardiacaQueryProperty
    on
        QueryBuilder<
          RegistoFrequenciaCardiaca,
          RegistoFrequenciaCardiaca,
          QQueryProperty
        > {
  QueryBuilder<RegistoFrequenciaCardiaca, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, int, QQueryOperations> bpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bpm');
    });
  }

  QueryBuilder<
    RegistoFrequenciaCardiaca,
    FonteFrequenciaCardiaca,
    QQueryOperations
  >
  fonteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fonte');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, int, QQueryOperations>
  idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, String?, QQueryOperations>
  notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<RegistoFrequenciaCardiaca, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
