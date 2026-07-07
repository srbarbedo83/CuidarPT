// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_medicacao.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoMedicacaoCollection on Isar {
  IsarCollection<RegistoMedicacao> get registoMedicacaos => this.collection();
}

const RegistoMedicacaoSchema = CollectionSchema(
  name: r'RegistoMedicacao',
  id: 5997855557492422552,
  properties: {
    r'ativo': PropertySchema(id: 0, name: r'ativo', type: IsarType.bool),
    r'atualizadoEm': PropertySchema(
      id: 1,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'criadoEm': PropertySchema(
      id: 2,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'dataFim': PropertySchema(
      id: 3,
      name: r'dataFim',
      type: IsarType.dateTime,
    ),
    r'dataInicio': PropertySchema(
      id: 4,
      name: r'dataInicio',
      type: IsarType.dateTime,
    ),
    r'diasSemana': PropertySchema(
      id: 5,
      name: r'diasSemana',
      type: IsarType.longList,
    ),
    r'dose': PropertySchema(id: 6, name: r'dose', type: IsarType.string),
    r'horariosMinutos': PropertySchema(
      id: 7,
      name: r'horariosMinutos',
      type: IsarType.longList,
    ),
    r'idosoId': PropertySchema(id: 8, name: r'idosoId', type: IsarType.long),
    r'nomeMedicamento': PropertySchema(
      id: 9,
      name: r'nomeMedicamento',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(id: 10, name: r'notas', type: IsarType.string),
    r'notificacaoIds': PropertySchema(
      id: 11,
      name: r'notificacaoIds',
      type: IsarType.longList,
    ),
    r'viaAdministracao': PropertySchema(
      id: 12,
      name: r'viaAdministracao',
      type: IsarType.string,
    ),
  },

  estimateSize: _registoMedicacaoEstimateSize,
  serialize: _registoMedicacaoSerialize,
  deserialize: _registoMedicacaoDeserialize,
  deserializeProp: _registoMedicacaoDeserializeProp,
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _registoMedicacaoGetId,
  getLinks: _registoMedicacaoGetLinks,
  attach: _registoMedicacaoAttach,
  version: '3.3.2',
);

int _registoMedicacaoEstimateSize(
  RegistoMedicacao object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.diasSemana.length * 8;
  {
    final value = object.dose;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.horariosMinutos.length * 8;
  bytesCount += 3 + object.nomeMedicamento.length * 3;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.notificacaoIds.length * 8;
  {
    final value = object.viaAdministracao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _registoMedicacaoSerialize(
  RegistoMedicacao object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.ativo);
  writer.writeDateTime(offsets[1], object.atualizadoEm);
  writer.writeDateTime(offsets[2], object.criadoEm);
  writer.writeDateTime(offsets[3], object.dataFim);
  writer.writeDateTime(offsets[4], object.dataInicio);
  writer.writeLongList(offsets[5], object.diasSemana);
  writer.writeString(offsets[6], object.dose);
  writer.writeLongList(offsets[7], object.horariosMinutos);
  writer.writeLong(offsets[8], object.idosoId);
  writer.writeString(offsets[9], object.nomeMedicamento);
  writer.writeString(offsets[10], object.notas);
  writer.writeLongList(offsets[11], object.notificacaoIds);
  writer.writeString(offsets[12], object.viaAdministracao);
}

RegistoMedicacao _registoMedicacaoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoMedicacao();
  object.ativo = reader.readBool(offsets[0]);
  object.atualizadoEm = reader.readDateTime(offsets[1]);
  object.criadoEm = reader.readDateTime(offsets[2]);
  object.dataFim = reader.readDateTimeOrNull(offsets[3]);
  object.dataInicio = reader.readDateTimeOrNull(offsets[4]);
  object.diasSemana = reader.readLongList(offsets[5]) ?? [];
  object.dose = reader.readStringOrNull(offsets[6]);
  object.horariosMinutos = reader.readLongList(offsets[7]) ?? [];
  object.id = id;
  object.idosoId = reader.readLong(offsets[8]);
  object.nomeMedicamento = reader.readString(offsets[9]);
  object.notas = reader.readStringOrNull(offsets[10]);
  object.notificacaoIds = reader.readLongList(offsets[11]) ?? [];
  object.viaAdministracao = reader.readStringOrNull(offsets[12]);
  return object;
}

P _registoMedicacaoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongList(offset) ?? []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongList(offset) ?? []) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _registoMedicacaoGetId(RegistoMedicacao object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoMedicacaoGetLinks(RegistoMedicacao object) {
  return [];
}

void _registoMedicacaoAttach(
  IsarCollection<dynamic> col,
  Id id,
  RegistoMedicacao object,
) {
  object.id = id;
}

extension RegistoMedicacaoQueryWhereSort
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QWhere> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhere> anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }
}

extension RegistoMedicacaoQueryWhere
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QWhereClause> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause> idBetween(
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterWhereClause>
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
}

extension RegistoMedicacaoQueryFilter
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QFilterCondition> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  ativoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ativo', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  atualizadoEmEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'atualizadoEm', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  atualizadoEmGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  atualizadoEmLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  atualizadoEmBetween(
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  criadoEmEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'criadoEm', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  criadoEmGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  criadoEmLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  criadoEmBetween(
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dataFim'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dataFim'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataFim', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataFim',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataFim',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataFimBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataFim',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dataInicio'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dataInicio'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataInicio', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataInicio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataInicio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  dataInicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataInicio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'diasSemana', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'diasSemana',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'diasSemana',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'diasSemana',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'diasSemana', length, true, length, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'diasSemana', 0, true, 0, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'diasSemana', 0, false, 999999, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'diasSemana', 0, true, length, include);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'diasSemana', length, include, 999999, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  diasSemanaLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasSemana',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dose'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dose'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dose',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dose',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dose',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dose', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  doseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dose', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'horariosMinutos', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'horariosMinutos',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'horariosMinutos',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'horariosMinutos',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'horariosMinutos', length, true, length, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'horariosMinutos', 0, true, 0, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'horariosMinutos', 0, false, 999999, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'horariosMinutos', 0, true, length, include);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosMinutos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  horariosMinutosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosMinutos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idosoId', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nomeMedicamento',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nomeMedicamento',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nomeMedicamento',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nomeMedicamento', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  nomeMedicamentoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nomeMedicamento', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notificacaoIds', value: value),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notificacaoIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notificacaoIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notificacaoIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'notificacaoIds', length, true, length, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'notificacaoIds', 0, true, 0, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'notificacaoIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'notificacaoIds', 0, true, length, include);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  notificacaoIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'notificacaoIds', length, include, 999999, true);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
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

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'viaAdministracao'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'viaAdministracao'),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'viaAdministracao',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'viaAdministracao',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'viaAdministracao',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'viaAdministracao', value: ''),
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterFilterCondition>
  viaAdministracaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'viaAdministracao', value: ''),
      );
    });
  }
}

extension RegistoMedicacaoQueryObject
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QFilterCondition> {}

extension RegistoMedicacaoQueryLinks
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QFilterCondition> {}

extension RegistoMedicacaoQuerySortBy
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QSortBy> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> sortByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByDataFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFim', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByDataFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFim', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> sortByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByNomeMedicamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeMedicamento', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByNomeMedicamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeMedicamento', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByViaAdministracao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viaAdministracao', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  sortByViaAdministracaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viaAdministracao', Sort.desc);
    });
  }
}

extension RegistoMedicacaoQuerySortThenBy
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QSortThenBy> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> thenByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByDataFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFim', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByDataFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFim', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> thenByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByNomeMedicamento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeMedicamento', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByNomeMedicamentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeMedicamento', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByViaAdministracao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viaAdministracao', Sort.asc);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QAfterSortBy>
  thenByViaAdministracaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viaAdministracao', Sort.desc);
    });
  }
}

extension RegistoMedicacaoQueryWhereDistinct
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct> {
  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ativo');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByDataFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataFim');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataInicio');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByDiasSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasSemana');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct> distinctByDose({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dose', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByHorariosMinutos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horariosMinutos');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByNomeMedicamento({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nomeMedicamento',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct> distinctByNotas({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByNotificacaoIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificacaoIds');
    });
  }

  QueryBuilder<RegistoMedicacao, RegistoMedicacao, QDistinct>
  distinctByViaAdministracao({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'viaAdministracao',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension RegistoMedicacaoQueryProperty
    on QueryBuilder<RegistoMedicacao, RegistoMedicacao, QQueryProperty> {
  QueryBuilder<RegistoMedicacao, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoMedicacao, bool, QQueryOperations> ativoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ativo');
    });
  }

  QueryBuilder<RegistoMedicacao, DateTime, QQueryOperations>
  atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<RegistoMedicacao, DateTime, QQueryOperations>
  criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<RegistoMedicacao, DateTime?, QQueryOperations>
  dataFimProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataFim');
    });
  }

  QueryBuilder<RegistoMedicacao, DateTime?, QQueryOperations>
  dataInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataInicio');
    });
  }

  QueryBuilder<RegistoMedicacao, List<int>, QQueryOperations>
  diasSemanaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasSemana');
    });
  }

  QueryBuilder<RegistoMedicacao, String?, QQueryOperations> doseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dose');
    });
  }

  QueryBuilder<RegistoMedicacao, List<int>, QQueryOperations>
  horariosMinutosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horariosMinutos');
    });
  }

  QueryBuilder<RegistoMedicacao, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoMedicacao, String, QQueryOperations>
  nomeMedicamentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomeMedicamento');
    });
  }

  QueryBuilder<RegistoMedicacao, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<RegistoMedicacao, List<int>, QQueryOperations>
  notificacaoIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificacaoIds');
    });
  }

  QueryBuilder<RegistoMedicacao, String?, QQueryOperations>
  viaAdministracaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viaAdministracao');
    });
  }
}
