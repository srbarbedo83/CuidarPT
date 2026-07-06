// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localidade_ipma.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalidadeIpmaCollection on Isar {
  IsarCollection<LocalidadeIpma> get localidadeIpmas => this.collection();
}

const LocalidadeIpmaSchema = CollectionSchema(
  name: r'LocalidadeIpma',
  id: 8811039798229572069,
  properties: {
    r'globalIdLocal': PropertySchema(
      id: 0,
      name: r'globalIdLocal',
      type: IsarType.long,
    ),
    r'idAreaAviso': PropertySchema(
      id: 1,
      name: r'idAreaAviso',
      type: IsarType.string,
    ),
    r'nome': PropertySchema(id: 2, name: r'nome', type: IsarType.string),
  },

  estimateSize: _localidadeIpmaEstimateSize,
  serialize: _localidadeIpmaSerialize,
  deserialize: _localidadeIpmaDeserialize,
  deserializeProp: _localidadeIpmaDeserializeProp,
  idName: r'id',
  indexes: {
    r'globalIdLocal': IndexSchema(
      id: -163073488036492278,
      name: r'globalIdLocal',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'globalIdLocal',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _localidadeIpmaGetId,
  getLinks: _localidadeIpmaGetLinks,
  attach: _localidadeIpmaAttach,
  version: '3.3.2',
);

int _localidadeIpmaEstimateSize(
  LocalidadeIpma object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idAreaAviso.length * 3;
  bytesCount += 3 + object.nome.length * 3;
  return bytesCount;
}

void _localidadeIpmaSerialize(
  LocalidadeIpma object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.globalIdLocal);
  writer.writeString(offsets[1], object.idAreaAviso);
  writer.writeString(offsets[2], object.nome);
}

LocalidadeIpma _localidadeIpmaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalidadeIpma();
  object.globalIdLocal = reader.readLong(offsets[0]);
  object.id = id;
  object.idAreaAviso = reader.readString(offsets[1]);
  object.nome = reader.readString(offsets[2]);
  return object;
}

P _localidadeIpmaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localidadeIpmaGetId(LocalidadeIpma object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localidadeIpmaGetLinks(LocalidadeIpma object) {
  return [];
}

void _localidadeIpmaAttach(
  IsarCollection<dynamic> col,
  Id id,
  LocalidadeIpma object,
) {
  object.id = id;
}

extension LocalidadeIpmaQueryWhereSort
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QWhere> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhere> anyGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'globalIdLocal'),
      );
    });
  }
}

extension LocalidadeIpmaQueryWhere
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QWhereClause> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause> idBetween(
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause>
  globalIdLocalEqualTo(int globalIdLocal) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'globalIdLocal',
          value: [globalIdLocal],
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause>
  globalIdLocalNotEqualTo(int globalIdLocal) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'globalIdLocal',
                lower: [],
                upper: [globalIdLocal],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'globalIdLocal',
                lower: [globalIdLocal],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'globalIdLocal',
                lower: [globalIdLocal],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'globalIdLocal',
                lower: [],
                upper: [globalIdLocal],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause>
  globalIdLocalGreaterThan(int globalIdLocal, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'globalIdLocal',
          lower: [globalIdLocal],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause>
  globalIdLocalLessThan(int globalIdLocal, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'globalIdLocal',
          lower: [],
          upper: [globalIdLocal],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterWhereClause>
  globalIdLocalBetween(
    int lowerGlobalIdLocal,
    int upperGlobalIdLocal, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'globalIdLocal',
          lower: [lowerGlobalIdLocal],
          includeLower: includeLower,
          upper: [upperGlobalIdLocal],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LocalidadeIpmaQueryFilter
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QFilterCondition> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  globalIdLocalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'globalIdLocal', value: value),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  globalIdLocalGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'globalIdLocal',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  globalIdLocalLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'globalIdLocal',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  globalIdLocalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'globalIdLocal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idAreaAviso',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idAreaAviso',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idAreaAviso',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idAreaAviso', value: ''),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  idAreaAvisoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idAreaAviso', value: ''),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
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

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nome', value: ''),
      );
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterFilterCondition>
  nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nome', value: ''),
      );
    });
  }
}

extension LocalidadeIpmaQueryObject
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QFilterCondition> {}

extension LocalidadeIpmaQueryLinks
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QFilterCondition> {}

extension LocalidadeIpmaQuerySortBy
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QSortBy> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  sortByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  sortByGlobalIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.desc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  sortByIdAreaAviso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  sortByIdAreaAvisoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.desc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension LocalidadeIpmaQuerySortThenBy
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QSortThenBy> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  thenByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  thenByGlobalIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.desc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  thenByIdAreaAviso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy>
  thenByIdAreaAvisoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.desc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension LocalidadeIpmaQueryWhereDistinct
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QDistinct> {
  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QDistinct>
  distinctByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalIdLocal');
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QDistinct>
  distinctByIdAreaAviso({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAreaAviso', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalidadeIpma, LocalidadeIpma, QDistinct> distinctByNome({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }
}

extension LocalidadeIpmaQueryProperty
    on QueryBuilder<LocalidadeIpma, LocalidadeIpma, QQueryProperty> {
  QueryBuilder<LocalidadeIpma, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalidadeIpma, int, QQueryOperations> globalIdLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalIdLocal');
    });
  }

  QueryBuilder<LocalidadeIpma, String, QQueryOperations> idAreaAvisoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAreaAviso');
    });
  }

  QueryBuilder<LocalidadeIpma, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }
}
