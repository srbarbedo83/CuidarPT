// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_local_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInfoLocalCacheCollection on Isar {
  IsarCollection<InfoLocalCache> get infoLocalCaches => this.collection();
}

const InfoLocalCacheSchema = CollectionSchema(
  name: r'InfoLocalCache',
  id: -7760220126791348170,
  properties: {
    r'atualizadoEm': PropertySchema(
      id: 0,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'avisosJson': PropertySchema(
      id: 1,
      name: r'avisosJson',
      type: IsarType.string,
    ),
    r'previsaoJson': PropertySchema(
      id: 2,
      name: r'previsaoJson',
      type: IsarType.string,
    )
  },
  estimateSize: _infoLocalCacheEstimateSize,
  serialize: _infoLocalCacheSerialize,
  deserialize: _infoLocalCacheDeserialize,
  deserializeProp: _infoLocalCacheDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _infoLocalCacheGetId,
  getLinks: _infoLocalCacheGetLinks,
  attach: _infoLocalCacheAttach,
  version: '3.1.0+1',
);

int _infoLocalCacheEstimateSize(
  InfoLocalCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avisosJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.previsaoJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _infoLocalCacheSerialize(
  InfoLocalCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.atualizadoEm);
  writer.writeString(offsets[1], object.avisosJson);
  writer.writeString(offsets[2], object.previsaoJson);
}

InfoLocalCache _infoLocalCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InfoLocalCache();
  object.atualizadoEm = reader.readDateTimeOrNull(offsets[0]);
  object.avisosJson = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.previsaoJson = reader.readStringOrNull(offsets[2]);
  return object;
}

P _infoLocalCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _infoLocalCacheGetId(InfoLocalCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _infoLocalCacheGetLinks(InfoLocalCache object) {
  return [];
}

void _infoLocalCacheAttach(
    IsarCollection<dynamic> col, Id id, InfoLocalCache object) {
  object.id = id;
}

extension InfoLocalCacheQueryWhereSort
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QWhere> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InfoLocalCacheQueryWhere
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QWhereClause> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterWhereClause> idBetween(
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
}

extension InfoLocalCacheQueryFilter
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QFilterCondition> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmGreaterThan(
    DateTime? value, {
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmLessThan(
    DateTime? value, {
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      atualizadoEmBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avisosJson',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avisosJson',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avisosJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avisosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avisosJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avisosJson',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      avisosJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avisosJson',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'previsaoJson',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'previsaoJson',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previsaoJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previsaoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previsaoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previsaoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterFilterCondition>
      previsaoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previsaoJson',
        value: '',
      ));
    });
  }
}

extension InfoLocalCacheQueryObject
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QFilterCondition> {}

extension InfoLocalCacheQueryLinks
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QFilterCondition> {}

extension InfoLocalCacheQuerySortBy
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QSortBy> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByAvisosJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avisosJson', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByAvisosJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avisosJson', Sort.desc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByPrevisaoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previsaoJson', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      sortByPrevisaoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previsaoJson', Sort.desc);
    });
  }
}

extension InfoLocalCacheQuerySortThenBy
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QSortThenBy> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByAvisosJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avisosJson', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByAvisosJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avisosJson', Sort.desc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByPrevisaoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previsaoJson', Sort.asc);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QAfterSortBy>
      thenByPrevisaoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previsaoJson', Sort.desc);
    });
  }
}

extension InfoLocalCacheQueryWhereDistinct
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QDistinct> {
  QueryBuilder<InfoLocalCache, InfoLocalCache, QDistinct>
      distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QDistinct> distinctByAvisosJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avisosJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InfoLocalCache, InfoLocalCache, QDistinct>
      distinctByPrevisaoJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previsaoJson', caseSensitive: caseSensitive);
    });
  }
}

extension InfoLocalCacheQueryProperty
    on QueryBuilder<InfoLocalCache, InfoLocalCache, QQueryProperty> {
  QueryBuilder<InfoLocalCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InfoLocalCache, DateTime?, QQueryOperations>
      atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<InfoLocalCache, String?, QQueryOperations> avisosJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avisosJson');
    });
  }

  QueryBuilder<InfoLocalCache, String?, QQueryOperations>
      previsaoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previsaoJson');
    });
  }
}
