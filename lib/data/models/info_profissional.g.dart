// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_profissional.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInfoProfissionalCollection on Isar {
  IsarCollection<InfoProfissional> get infoProfissionals => this.collection();
}

const InfoProfissionalSchema = CollectionSchema(
  name: r'InfoProfissional',
  id: 5132190736037437678,
  properties: {
    r'contacto': PropertySchema(
      id: 0,
      name: r'contacto',
      type: IsarType.string,
    ),
    r'idosoId': PropertySchema(id: 1, name: r'idosoId', type: IsarType.long),
    r'nome': PropertySchema(id: 2, name: r'nome', type: IsarType.string),
    r'notas': PropertySchema(id: 3, name: r'notas', type: IsarType.string),
  },

  estimateSize: _infoProfissionalEstimateSize,
  serialize: _infoProfissionalSerialize,
  deserialize: _infoProfissionalDeserialize,
  deserializeProp: _infoProfissionalDeserializeProp,
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
    r'nome': IndexSchema(
      id: -3554607249464315131,
      name: r'nome',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nome',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _infoProfissionalGetId,
  getLinks: _infoProfissionalGetLinks,
  attach: _infoProfissionalAttach,
  version: '3.3.2',
);

int _infoProfissionalEstimateSize(
  InfoProfissional object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contacto;
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

void _infoProfissionalSerialize(
  InfoProfissional object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contacto);
  writer.writeLong(offsets[1], object.idosoId);
  writer.writeString(offsets[2], object.nome);
  writer.writeString(offsets[3], object.notas);
}

InfoProfissional _infoProfissionalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InfoProfissional();
  object.contacto = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.idosoId = reader.readLong(offsets[1]);
  object.nome = reader.readString(offsets[2]);
  object.notas = reader.readStringOrNull(offsets[3]);
  return object;
}

P _infoProfissionalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _infoProfissionalGetId(InfoProfissional object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _infoProfissionalGetLinks(InfoProfissional object) {
  return [];
}

void _infoProfissionalAttach(
  IsarCollection<dynamic> col,
  Id id,
  InfoProfissional object,
) {
  object.id = id;
}

extension InfoProfissionalQueryWhereSort
    on QueryBuilder<InfoProfissional, InfoProfissional, QWhere> {
  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhere> anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }
}

extension InfoProfissionalQueryWhere
    on QueryBuilder<InfoProfissional, InfoProfissional, QWhereClause> {
  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause> idBetween(
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
  nomeEqualTo(String nome) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nome', value: [nome]),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterWhereClause>
  nomeNotEqualTo(String nome) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nome',
                lower: [],
                upper: [nome],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nome',
                lower: [nome],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nome',
                lower: [nome],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nome',
                lower: [],
                upper: [nome],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension InfoProfissionalQueryFilter
    on QueryBuilder<InfoProfissional, InfoProfissional, QFilterCondition> {
  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contacto'),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contacto'),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contacto',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contacto',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contacto',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contacto', value: ''),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  contactoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contacto', value: ''),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idosoId', value: value),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeGreaterThan(
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeLessThan(
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeBetween(
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nome', value: ''),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nome', value: ''),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notas'),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
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

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notas', value: ''),
      );
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterFilterCondition>
  notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notas', value: ''),
      );
    });
  }
}

extension InfoProfissionalQueryObject
    on QueryBuilder<InfoProfissional, InfoProfissional, QFilterCondition> {}

extension InfoProfissionalQueryLinks
    on QueryBuilder<InfoProfissional, InfoProfissional, QFilterCondition> {}

extension InfoProfissionalQuerySortBy
    on QueryBuilder<InfoProfissional, InfoProfissional, QSortBy> {
  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension InfoProfissionalQuerySortThenBy
    on QueryBuilder<InfoProfissional, InfoProfissional, QSortThenBy> {
  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByContacto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByContactoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contacto', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QAfterSortBy>
  thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension InfoProfissionalQueryWhereDistinct
    on QueryBuilder<InfoProfissional, InfoProfissional, QDistinct> {
  QueryBuilder<InfoProfissional, InfoProfissional, QDistinct>
  distinctByContacto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contacto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QDistinct> distinctByNome({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InfoProfissional, InfoProfissional, QDistinct> distinctByNotas({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }
}

extension InfoProfissionalQueryProperty
    on QueryBuilder<InfoProfissional, InfoProfissional, QQueryProperty> {
  QueryBuilder<InfoProfissional, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InfoProfissional, String?, QQueryOperations> contactoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contacto');
    });
  }

  QueryBuilder<InfoProfissional, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<InfoProfissional, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<InfoProfissional, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }
}
