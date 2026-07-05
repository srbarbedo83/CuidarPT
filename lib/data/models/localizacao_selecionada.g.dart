// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_selecionada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalizacaoSelecionadaCollection on Isar {
  IsarCollection<LocalizacaoSelecionada> get localizacaoSelecionadas =>
      this.collection();
}

const LocalizacaoSelecionadaSchema = CollectionSchema(
  name: r'LocalizacaoSelecionada',
  id: 7784659881450545860,
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
    r'nome': PropertySchema(
      id: 2,
      name: r'nome',
      type: IsarType.string,
    )
  },
  estimateSize: _localizacaoSelecionadaEstimateSize,
  serialize: _localizacaoSelecionadaSerialize,
  deserialize: _localizacaoSelecionadaDeserialize,
  deserializeProp: _localizacaoSelecionadaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localizacaoSelecionadaGetId,
  getLinks: _localizacaoSelecionadaGetLinks,
  attach: _localizacaoSelecionadaAttach,
  version: '3.1.0+1',
);

int _localizacaoSelecionadaEstimateSize(
  LocalizacaoSelecionada object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.idAreaAviso;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localizacaoSelecionadaSerialize(
  LocalizacaoSelecionada object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.globalIdLocal);
  writer.writeString(offsets[1], object.idAreaAviso);
  writer.writeString(offsets[2], object.nome);
}

LocalizacaoSelecionada _localizacaoSelecionadaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalizacaoSelecionada();
  object.globalIdLocal = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.idAreaAviso = reader.readStringOrNull(offsets[1]);
  object.nome = reader.readStringOrNull(offsets[2]);
  return object;
}

P _localizacaoSelecionadaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localizacaoSelecionadaGetId(LocalizacaoSelecionada object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localizacaoSelecionadaGetLinks(
    LocalizacaoSelecionada object) {
  return [];
}

void _localizacaoSelecionadaAttach(
    IsarCollection<dynamic> col, Id id, LocalizacaoSelecionada object) {
  object.id = id;
}

extension LocalizacaoSelecionadaQueryWhereSort
    on QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QWhere> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalizacaoSelecionadaQueryWhere on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QWhereClause> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterWhereClause> idBetween(
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

extension LocalizacaoSelecionadaQueryFilter on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QFilterCondition> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'globalIdLocal',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'globalIdLocal',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'globalIdLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'globalIdLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'globalIdLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> globalIdLocalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'globalIdLocal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idAreaAviso',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idAreaAviso',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAreaAviso',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
          QAfterFilterCondition>
      idAreaAvisoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAreaAviso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
          QAfterFilterCondition>
      idAreaAvisoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAreaAviso',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreaAviso',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> idAreaAvisoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAreaAviso',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nome',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nome',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
          QAfterFilterCondition>
      nomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
          QAfterFilterCondition>
      nomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada,
      QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }
}

extension LocalizacaoSelecionadaQueryObject on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QFilterCondition> {}

extension LocalizacaoSelecionadaQueryLinks on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QFilterCondition> {}

extension LocalizacaoSelecionadaQuerySortBy
    on QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QSortBy> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByGlobalIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.desc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByIdAreaAviso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByIdAreaAvisoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.desc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension LocalizacaoSelecionadaQuerySortThenBy on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QSortThenBy> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByGlobalIdLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalIdLocal', Sort.desc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByIdAreaAviso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByIdAreaAvisoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreaAviso', Sort.desc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QAfterSortBy>
      thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension LocalizacaoSelecionadaQueryWhereDistinct
    on QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QDistinct> {
  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QDistinct>
      distinctByGlobalIdLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalIdLocal');
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QDistinct>
      distinctByIdAreaAviso({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAreaAviso', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalizacaoSelecionada, LocalizacaoSelecionada, QDistinct>
      distinctByNome({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }
}

extension LocalizacaoSelecionadaQueryProperty on QueryBuilder<
    LocalizacaoSelecionada, LocalizacaoSelecionada, QQueryProperty> {
  QueryBuilder<LocalizacaoSelecionada, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalizacaoSelecionada, int?, QQueryOperations>
      globalIdLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalIdLocal');
    });
  }

  QueryBuilder<LocalizacaoSelecionada, String?, QQueryOperations>
      idAreaAvisoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAreaAviso');
    });
  }

  QueryBuilder<LocalizacaoSelecionada, String?, QQueryOperations>
      nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }
}
