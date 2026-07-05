// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_relatorio.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerfilRelatorioCollection on Isar {
  IsarCollection<PerfilRelatorio> get perfilRelatorios => this.collection();
}

const PerfilRelatorioSchema = CollectionSchema(
  name: r'PerfilRelatorio',
  id: 1286114972680320648,
  properties: {
    r'cuidadorNome': PropertySchema(
      id: 0,
      name: r'cuidadorNome',
      type: IsarType.string,
    ),
    r'logoPath': PropertySchema(
      id: 1,
      name: r'logoPath',
      type: IsarType.string,
    )
  },
  estimateSize: _perfilRelatorioEstimateSize,
  serialize: _perfilRelatorioSerialize,
  deserialize: _perfilRelatorioDeserialize,
  deserializeProp: _perfilRelatorioDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _perfilRelatorioGetId,
  getLinks: _perfilRelatorioGetLinks,
  attach: _perfilRelatorioAttach,
  version: '3.1.0+1',
);

int _perfilRelatorioEstimateSize(
  PerfilRelatorio object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cuidadorNome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _perfilRelatorioSerialize(
  PerfilRelatorio object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cuidadorNome);
  writer.writeString(offsets[1], object.logoPath);
}

PerfilRelatorio _perfilRelatorioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerfilRelatorio();
  object.cuidadorNome = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.logoPath = reader.readStringOrNull(offsets[1]);
  return object;
}

P _perfilRelatorioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _perfilRelatorioGetId(PerfilRelatorio object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _perfilRelatorioGetLinks(PerfilRelatorio object) {
  return [];
}

void _perfilRelatorioAttach(
    IsarCollection<dynamic> col, Id id, PerfilRelatorio object) {
  object.id = id;
}

extension PerfilRelatorioQueryWhereSort
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QWhere> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerfilRelatorioQueryWhere
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QWhereClause> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhereClause>
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

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterWhereClause> idBetween(
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

extension PerfilRelatorioQueryFilter
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QFilterCondition> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cuidadorNome',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cuidadorNome',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuidadorNome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cuidadorNome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cuidadorNome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuidadorNome',
        value: '',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      cuidadorNomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cuidadorNome',
        value: '',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
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

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
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

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
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

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterFilterCondition>
      logoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoPath',
        value: '',
      ));
    });
  }
}

extension PerfilRelatorioQueryObject
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QFilterCondition> {}

extension PerfilRelatorioQueryLinks
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QFilterCondition> {}

extension PerfilRelatorioQuerySortBy
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QSortBy> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      sortByCuidadorNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuidadorNome', Sort.asc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      sortByCuidadorNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuidadorNome', Sort.desc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      sortByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      sortByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }
}

extension PerfilRelatorioQuerySortThenBy
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QSortThenBy> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      thenByCuidadorNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuidadorNome', Sort.asc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      thenByCuidadorNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuidadorNome', Sort.desc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      thenByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QAfterSortBy>
      thenByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }
}

extension PerfilRelatorioQueryWhereDistinct
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QDistinct> {
  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QDistinct>
      distinctByCuidadorNome({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuidadorNome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerfilRelatorio, PerfilRelatorio, QDistinct> distinctByLogoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoPath', caseSensitive: caseSensitive);
    });
  }
}

extension PerfilRelatorioQueryProperty
    on QueryBuilder<PerfilRelatorio, PerfilRelatorio, QQueryProperty> {
  QueryBuilder<PerfilRelatorio, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerfilRelatorio, String?, QQueryOperations>
      cuidadorNomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuidadorNome');
    });
  }

  QueryBuilder<PerfilRelatorio, String?, QQueryOperations> logoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoPath');
    });
  }
}
