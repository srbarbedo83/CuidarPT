// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferencias_app.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPreferenciasAppCollection on Isar {
  IsarCollection<PreferenciasApp> get preferenciasApps => this.collection();
}

const PreferenciasAppSchema = CollectionSchema(
  name: r'PreferenciasApp',
  id: 2913266274500099162,
  properties: {
    r'disclaimerSaudeAceite': PropertySchema(
      id: 0,
      name: r'disclaimerSaudeAceite',
      type: IsarType.bool,
    ),
    r'escalaTexto': PropertySchema(
      id: 1,
      name: r'escalaTexto',
      type: IsarType.double,
    ),
    r'idioma': PropertySchema(
      id: 2,
      name: r'idioma',
      type: IsarType.string,
      enumMap: _PreferenciasAppidiomaEnumValueMap,
    ),
    r'tema': PropertySchema(
      id: 3,
      name: r'tema',
      type: IsarType.string,
      enumMap: _PreferenciasApptemaEnumValueMap,
    ),
  },

  estimateSize: _preferenciasAppEstimateSize,
  serialize: _preferenciasAppSerialize,
  deserialize: _preferenciasAppDeserialize,
  deserializeProp: _preferenciasAppDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _preferenciasAppGetId,
  getLinks: _preferenciasAppGetLinks,
  attach: _preferenciasAppAttach,
  version: '3.3.2',
);

int _preferenciasAppEstimateSize(
  PreferenciasApp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idioma.name.length * 3;
  bytesCount += 3 + object.tema.name.length * 3;
  return bytesCount;
}

void _preferenciasAppSerialize(
  PreferenciasApp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.disclaimerSaudeAceite);
  writer.writeDouble(offsets[1], object.escalaTexto);
  writer.writeString(offsets[2], object.idioma.name);
  writer.writeString(offsets[3], object.tema.name);
}

PreferenciasApp _preferenciasAppDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PreferenciasApp();
  object.disclaimerSaudeAceite = reader.readBool(offsets[0]);
  object.escalaTexto = reader.readDouble(offsets[1]);
  object.id = id;
  object.idioma =
      _PreferenciasAppidiomaValueEnumMap[reader.readStringOrNull(offsets[2])] ??
      IdiomaPreferido.sistema;
  object.tema =
      _PreferenciasApptemaValueEnumMap[reader.readStringOrNull(offsets[3])] ??
      TemaPreferido.sistema;
  return object;
}

P _preferenciasAppDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (_PreferenciasAppidiomaValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              IdiomaPreferido.sistema)
          as P;
    case 3:
      return (_PreferenciasApptemaValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TemaPreferido.sistema)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PreferenciasAppidiomaEnumValueMap = {
  r'sistema': r'sistema',
  r'pt': r'pt',
  r'en': r'en',
  r'es': r'es',
};
const _PreferenciasAppidiomaValueEnumMap = {
  r'sistema': IdiomaPreferido.sistema,
  r'pt': IdiomaPreferido.pt,
  r'en': IdiomaPreferido.en,
  r'es': IdiomaPreferido.es,
};
const _PreferenciasApptemaEnumValueMap = {
  r'sistema': r'sistema',
  r'claro': r'claro',
  r'escuro': r'escuro',
};
const _PreferenciasApptemaValueEnumMap = {
  r'sistema': TemaPreferido.sistema,
  r'claro': TemaPreferido.claro,
  r'escuro': TemaPreferido.escuro,
};

Id _preferenciasAppGetId(PreferenciasApp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _preferenciasAppGetLinks(PreferenciasApp object) {
  return [];
}

void _preferenciasAppAttach(
  IsarCollection<dynamic> col,
  Id id,
  PreferenciasApp object,
) {
  object.id = id;
}

extension PreferenciasAppQueryWhereSort
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QWhere> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PreferenciasAppQueryWhere
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QWhereClause> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhereClause>
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

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterWhereClause> idBetween(
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
}

extension PreferenciasAppQueryFilter
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QFilterCondition> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  disclaimerSaudeAceiteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'disclaimerSaudeAceite',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  escalaTextoEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'escalaTexto',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  escalaTextoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'escalaTexto',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  escalaTextoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'escalaTexto',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  escalaTextoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'escalaTexto',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
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

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
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

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
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

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaEqualTo(IdiomaPreferido value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaGreaterThan(
    IdiomaPreferido value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaLessThan(
    IdiomaPreferido value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaBetween(
    IdiomaPreferido lower,
    IdiomaPreferido upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idioma',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idioma',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idioma',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idioma', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  idiomaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idioma', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaEqualTo(TemaPreferido value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaGreaterThan(
    TemaPreferido value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaLessThan(
    TemaPreferido value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaBetween(
    TemaPreferido lower,
    TemaPreferido upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tema',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tema',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tema',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tema', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterFilterCondition>
  temaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tema', value: ''),
      );
    });
  }
}

extension PreferenciasAppQueryObject
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QFilterCondition> {}

extension PreferenciasAppQueryLinks
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QFilterCondition> {}

extension PreferenciasAppQuerySortBy
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QSortBy> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByDisclaimerSaudeAceite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclaimerSaudeAceite', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByDisclaimerSaudeAceiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclaimerSaudeAceite', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByEscalaTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escalaTexto', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByEscalaTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escalaTexto', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> sortByIdioma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByIdiomaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> sortByTema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  sortByTemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.desc);
    });
  }
}

extension PreferenciasAppQuerySortThenBy
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QSortThenBy> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByDisclaimerSaudeAceite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclaimerSaudeAceite', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByDisclaimerSaudeAceiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclaimerSaudeAceite', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByEscalaTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escalaTexto', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByEscalaTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escalaTexto', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> thenByIdioma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByIdiomaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.desc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy> thenByTema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.asc);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QAfterSortBy>
  thenByTemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.desc);
    });
  }
}

extension PreferenciasAppQueryWhereDistinct
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QDistinct> {
  QueryBuilder<PreferenciasApp, PreferenciasApp, QDistinct>
  distinctByDisclaimerSaudeAceite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disclaimerSaudeAceite');
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QDistinct>
  distinctByEscalaTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'escalaTexto');
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QDistinct> distinctByIdioma({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idioma', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PreferenciasApp, PreferenciasApp, QDistinct> distinctByTema({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tema', caseSensitive: caseSensitive);
    });
  }
}

extension PreferenciasAppQueryProperty
    on QueryBuilder<PreferenciasApp, PreferenciasApp, QQueryProperty> {
  QueryBuilder<PreferenciasApp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PreferenciasApp, bool, QQueryOperations>
  disclaimerSaudeAceiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disclaimerSaudeAceite');
    });
  }

  QueryBuilder<PreferenciasApp, double, QQueryOperations>
  escalaTextoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'escalaTexto');
    });
  }

  QueryBuilder<PreferenciasApp, IdiomaPreferido, QQueryOperations>
  idiomaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idioma');
    });
  }

  QueryBuilder<PreferenciasApp, TemaPreferido, QQueryOperations>
  temaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tema');
    });
  }
}
