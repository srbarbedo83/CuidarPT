// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_consulta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoConsultaCollection on Isar {
  IsarCollection<RegistoConsulta> get registoConsultas => this.collection();
}

const RegistoConsultaSchema = CollectionSchema(
  name: r'RegistoConsulta',
  id: -6503890334676559466,
  properties: {
    r'atualizadoEm': PropertySchema(
      id: 0,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'criadoEm': PropertySchema(
      id: 1,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'dataHora': PropertySchema(
      id: 2,
      name: r'dataHora',
      type: IsarType.dateTime,
    ),
    r'especialidade': PropertySchema(
      id: 3,
      name: r'especialidade',
      type: IsarType.string,
    ),
    r'idosoId': PropertySchema(
      id: 4,
      name: r'idosoId',
      type: IsarType.long,
    ),
    r'lembreteAtivo': PropertySchema(
      id: 5,
      name: r'lembreteAtivo',
      type: IsarType.bool,
    ),
    r'local': PropertySchema(
      id: 6,
      name: r'local',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 7,
      name: r'notas',
      type: IsarType.string,
    ),
    r'notificacaoIds': PropertySchema(
      id: 8,
      name: r'notificacaoIds',
      type: IsarType.longList,
    ),
    r'proximaConsultaData': PropertySchema(
      id: 9,
      name: r'proximaConsultaData',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _registoConsultaEstimateSize,
  serialize: _registoConsultaSerialize,
  deserialize: _registoConsultaDeserialize,
  deserializeProp: _registoConsultaDeserializeProp,
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
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _registoConsultaGetId,
  getLinks: _registoConsultaGetLinks,
  attach: _registoConsultaAttach,
  version: '3.1.0+1',
);

int _registoConsultaEstimateSize(
  RegistoConsulta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.especialidade.length * 3;
  {
    final value = object.local;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.notificacaoIds.length * 8;
  return bytesCount;
}

void _registoConsultaSerialize(
  RegistoConsulta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.atualizadoEm);
  writer.writeDateTime(offsets[1], object.criadoEm);
  writer.writeDateTime(offsets[2], object.dataHora);
  writer.writeString(offsets[3], object.especialidade);
  writer.writeLong(offsets[4], object.idosoId);
  writer.writeBool(offsets[5], object.lembreteAtivo);
  writer.writeString(offsets[6], object.local);
  writer.writeString(offsets[7], object.notas);
  writer.writeLongList(offsets[8], object.notificacaoIds);
  writer.writeDateTime(offsets[9], object.proximaConsultaData);
}

RegistoConsulta _registoConsultaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoConsulta();
  object.atualizadoEm = reader.readDateTime(offsets[0]);
  object.criadoEm = reader.readDateTime(offsets[1]);
  object.dataHora = reader.readDateTime(offsets[2]);
  object.especialidade = reader.readString(offsets[3]);
  object.id = id;
  object.idosoId = reader.readLong(offsets[4]);
  object.lembreteAtivo = reader.readBool(offsets[5]);
  object.local = reader.readStringOrNull(offsets[6]);
  object.notas = reader.readStringOrNull(offsets[7]);
  object.notificacaoIds = reader.readLongList(offsets[8]) ?? [];
  object.proximaConsultaData = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _registoConsultaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _registoConsultaGetId(RegistoConsulta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoConsultaGetLinks(RegistoConsulta object) {
  return [];
}

void _registoConsultaAttach(
    IsarCollection<dynamic> col, Id id, RegistoConsulta object) {
  object.id = id;
}

extension RegistoConsultaQueryWhereSort
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QWhere> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhere> anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }
}

extension RegistoConsultaQueryWhere
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QWhereClause> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
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

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idosoId',
        value: [idosoId],
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idosoIdNotEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idosoId',
              lower: [],
              upper: [idosoId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idosoId',
              lower: [idosoId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idosoId',
              lower: [idosoId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idosoId',
              lower: [],
              upper: [idosoId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idosoIdGreaterThan(
    int idosoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idosoId',
        lower: [idosoId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idosoIdLessThan(
    int idosoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idosoId',
        lower: [],
        upper: [idosoId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterWhereClause>
      idosoIdBetween(
    int lowerIdosoId,
    int upperIdosoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idosoId',
        lower: [lowerIdosoId],
        includeLower: includeLower,
        upper: [upperIdosoId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegistoConsultaQueryFilter
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QFilterCondition> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      atualizadoEmEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      atualizadoEmGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      atualizadoEmLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      atualizadoEmBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'atualizadoEm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      criadoEmEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      criadoEmGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      criadoEmLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      criadoEmBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criadoEm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      dataHoraEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataHora',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      dataHoraGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataHora',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      dataHoraLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataHora',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      dataHoraBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataHora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'especialidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'especialidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'especialidade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'especialidade',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      especialidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'especialidade',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idosoId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idosoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idosoId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idosoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idosoId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      idosoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idosoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      lembreteAtivoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lembreteAtivo',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'local',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'local',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'local',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'local',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'local',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'local',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      localIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'local',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificacaoIds',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificacaoIds',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificacaoIds',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificacaoIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      notificacaoIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notificacaoIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proximaConsultaData',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proximaConsultaData',
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximaConsultaData',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proximaConsultaData',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proximaConsultaData',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterFilterCondition>
      proximaConsultaDataBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proximaConsultaData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegistoConsultaQueryObject
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QFilterCondition> {}

extension RegistoConsultaQueryLinks
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QFilterCondition> {}

extension RegistoConsultaQuerySortBy
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QSortBy> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByDataHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHora', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByDataHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHora', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByEspecialidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'especialidade', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByEspecialidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'especialidade', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByLembreteAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lembreteAtivo', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByLembreteAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lembreteAtivo', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> sortByLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'local', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'local', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByProximaConsultaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaConsultaData', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      sortByProximaConsultaDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaConsultaData', Sort.desc);
    });
  }
}

extension RegistoConsultaQuerySortThenBy
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QSortThenBy> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByDataHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHora', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByDataHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHora', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByEspecialidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'especialidade', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByEspecialidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'especialidade', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByLembreteAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lembreteAtivo', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByLembreteAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lembreteAtivo', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> thenByLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'local', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'local', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByProximaConsultaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaConsultaData', Sort.asc);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QAfterSortBy>
      thenByProximaConsultaDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaConsultaData', Sort.desc);
    });
  }
}

extension RegistoConsultaQueryWhereDistinct
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct> {
  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByDataHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataHora');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByEspecialidade({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'especialidade',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByLembreteAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lembreteAtivo');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct> distinctByLocal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'local', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByNotificacaoIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificacaoIds');
    });
  }

  QueryBuilder<RegistoConsulta, RegistoConsulta, QDistinct>
      distinctByProximaConsultaData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximaConsultaData');
    });
  }
}

extension RegistoConsultaQueryProperty
    on QueryBuilder<RegistoConsulta, RegistoConsulta, QQueryProperty> {
  QueryBuilder<RegistoConsulta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoConsulta, DateTime, QQueryOperations>
      atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<RegistoConsulta, DateTime, QQueryOperations> criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<RegistoConsulta, DateTime, QQueryOperations> dataHoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataHora');
    });
  }

  QueryBuilder<RegistoConsulta, String, QQueryOperations>
      especialidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'especialidade');
    });
  }

  QueryBuilder<RegistoConsulta, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoConsulta, bool, QQueryOperations>
      lembreteAtivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lembreteAtivo');
    });
  }

  QueryBuilder<RegistoConsulta, String?, QQueryOperations> localProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'local');
    });
  }

  QueryBuilder<RegistoConsulta, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<RegistoConsulta, List<int>, QQueryOperations>
      notificacaoIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificacaoIds');
    });
  }

  QueryBuilder<RegistoConsulta, DateTime?, QQueryOperations>
      proximaConsultaDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximaConsultaData');
    });
  }
}
