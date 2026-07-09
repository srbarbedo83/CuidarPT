// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_sinais_vitais.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoSinaisVitaisCollection on Isar {
  IsarCollection<RegistoSinaisVitais> get registoSinaisVitais =>
      this.collection();
}

const RegistoSinaisVitaisSchema = CollectionSchema(
  name: r'RegistoSinaisVitais',
  id: 1136713076825343746,
  properties: {
    r'frequenciaCardiaca': PropertySchema(
      id: 0,
      name: r'frequenciaCardiaca',
      type: IsarType.long,
    ),
    r'glicemia': PropertySchema(id: 1, name: r'glicemia', type: IsarType.long),
    r'idosoId': PropertySchema(id: 2, name: r'idosoId', type: IsarType.long),
    r'notas': PropertySchema(id: 3, name: r'notas', type: IsarType.string),
    r'peso': PropertySchema(id: 4, name: r'peso', type: IsarType.double),
    r'pressaoDiastolica': PropertySchema(
      id: 5,
      name: r'pressaoDiastolica',
      type: IsarType.long,
    ),
    r'pressaoSistolica': PropertySchema(
      id: 6,
      name: r'pressaoSistolica',
      type: IsarType.long,
    ),
    r'temperatura': PropertySchema(
      id: 7,
      name: r'temperatura',
      type: IsarType.double,
    ),
    r'timestamp': PropertySchema(
      id: 8,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _registoSinaisVitaisEstimateSize,
  serialize: _registoSinaisVitaisSerialize,
  deserialize: _registoSinaisVitaisDeserialize,
  deserializeProp: _registoSinaisVitaisDeserializeProp,
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

  getId: _registoSinaisVitaisGetId,
  getLinks: _registoSinaisVitaisGetLinks,
  attach: _registoSinaisVitaisAttach,
  version: '3.3.2',
);

int _registoSinaisVitaisEstimateSize(
  RegistoSinaisVitais object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _registoSinaisVitaisSerialize(
  RegistoSinaisVitais object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.frequenciaCardiaca);
  writer.writeLong(offsets[1], object.glicemia);
  writer.writeLong(offsets[2], object.idosoId);
  writer.writeString(offsets[3], object.notas);
  writer.writeDouble(offsets[4], object.peso);
  writer.writeLong(offsets[5], object.pressaoDiastolica);
  writer.writeLong(offsets[6], object.pressaoSistolica);
  writer.writeDouble(offsets[7], object.temperatura);
  writer.writeDateTime(offsets[8], object.timestamp);
}

RegistoSinaisVitais _registoSinaisVitaisDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoSinaisVitais();
  object.frequenciaCardiaca = reader.readLongOrNull(offsets[0]);
  object.glicemia = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.idosoId = reader.readLong(offsets[2]);
  object.notas = reader.readStringOrNull(offsets[3]);
  object.peso = reader.readDoubleOrNull(offsets[4]);
  object.pressaoDiastolica = reader.readLongOrNull(offsets[5]);
  object.pressaoSistolica = reader.readLongOrNull(offsets[6]);
  object.temperatura = reader.readDoubleOrNull(offsets[7]);
  object.timestamp = reader.readDateTime(offsets[8]);
  return object;
}

P _registoSinaisVitaisDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _registoSinaisVitaisGetId(RegistoSinaisVitais object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoSinaisVitaisGetLinks(
  RegistoSinaisVitais object,
) {
  return [];
}

void _registoSinaisVitaisAttach(
  IsarCollection<dynamic> col,
  Id id,
  RegistoSinaisVitais object,
) {
  object.id = id;
}

extension RegistoSinaisVitaisQueryWhereSort
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QWhere> {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhere>
  anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhere>
  anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension RegistoSinaisVitaisQueryWhere
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QWhereClause> {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
  timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'timestamp', value: [timestamp]),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterWhereClause>
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

extension RegistoSinaisVitaisQueryFilter
    on
        QueryBuilder<
          RegistoSinaisVitais,
          RegistoSinaisVitais,
          QFilterCondition
        > {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'frequenciaCardiaca'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'frequenciaCardiaca'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'frequenciaCardiaca', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'frequenciaCardiaca',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'frequenciaCardiaca',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  frequenciaCardiacaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'frequenciaCardiaca',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'glicemia'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'glicemia'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'glicemia', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'glicemia',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'glicemia',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  glicemiaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'glicemia',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idosoId', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'peso'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'peso'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'peso',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'peso',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'peso',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pesoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'peso',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pressaoDiastolica'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pressaoDiastolica'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pressaoDiastolica', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pressaoDiastolica',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pressaoDiastolica',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoDiastolicaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pressaoDiastolica',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pressaoSistolica'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pressaoSistolica'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pressaoSistolica', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pressaoSistolica',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pressaoSistolica',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  pressaoSistolicaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pressaoSistolica',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperatura'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperatura'),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperatura',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperatura',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperatura',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  temperaturaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperatura',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterFilterCondition>
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

extension RegistoSinaisVitaisQueryObject
    on
        QueryBuilder<
          RegistoSinaisVitais,
          RegistoSinaisVitais,
          QFilterCondition
        > {}

extension RegistoSinaisVitaisQueryLinks
    on
        QueryBuilder<
          RegistoSinaisVitais,
          RegistoSinaisVitais,
          QFilterCondition
        > {}

extension RegistoSinaisVitaisQuerySortBy
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QSortBy> {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByFrequenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequenciaCardiaca', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByFrequenciaCardiacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequenciaCardiaca', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByGlicemia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glicemia', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByGlicemiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glicemia', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPeso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peso', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPesoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peso', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPressaoDiastolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoDiastolica', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPressaoDiastolicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoDiastolica', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPressaoSistolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoSistolica', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByPressaoSistolicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoSistolica', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByTemperatura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatura', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByTemperaturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatura', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RegistoSinaisVitaisQuerySortThenBy
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QSortThenBy> {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByFrequenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequenciaCardiaca', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByFrequenciaCardiacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequenciaCardiaca', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByGlicemia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glicemia', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByGlicemiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'glicemia', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPeso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peso', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPesoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peso', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPressaoDiastolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoDiastolica', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPressaoDiastolicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoDiastolica', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPressaoSistolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoSistolica', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByPressaoSistolicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressaoSistolica', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByTemperatura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatura', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByTemperaturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperatura', Sort.desc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension RegistoSinaisVitaisQueryWhereDistinct
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct> {
  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByFrequenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequenciaCardiaca');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByGlicemia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'glicemia');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByNotas({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByPeso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'peso');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByPressaoDiastolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pressaoDiastolica');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByPressaoSistolica() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pressaoSistolica');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByTemperatura() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperatura');
    });
  }

  QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension RegistoSinaisVitaisQueryProperty
    on QueryBuilder<RegistoSinaisVitais, RegistoSinaisVitais, QQueryProperty> {
  QueryBuilder<RegistoSinaisVitais, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoSinaisVitais, int?, QQueryOperations>
  frequenciaCardiacaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequenciaCardiaca');
    });
  }

  QueryBuilder<RegistoSinaisVitais, int?, QQueryOperations> glicemiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'glicemia');
    });
  }

  QueryBuilder<RegistoSinaisVitais, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoSinaisVitais, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<RegistoSinaisVitais, double?, QQueryOperations> pesoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'peso');
    });
  }

  QueryBuilder<RegistoSinaisVitais, int?, QQueryOperations>
  pressaoDiastolicaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pressaoDiastolica');
    });
  }

  QueryBuilder<RegistoSinaisVitais, int?, QQueryOperations>
  pressaoSistolicaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pressaoSistolica');
    });
  }

  QueryBuilder<RegistoSinaisVitais, double?, QQueryOperations>
  temperaturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperatura');
    });
  }

  QueryBuilder<RegistoSinaisVitais, DateTime, QQueryOperations>
  timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
