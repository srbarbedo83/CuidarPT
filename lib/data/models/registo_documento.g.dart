// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registo_documento.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistoDocumentoCollection on Isar {
  IsarCollection<RegistoDocumento> get registoDocumentos => this.collection();
}

const RegistoDocumentoSchema = CollectionSchema(
  name: r'RegistoDocumento',
  id: 7938259525396860375,
  properties: {
    r'caminhoFicheiro': PropertySchema(
      id: 0,
      name: r'caminhoFicheiro',
      type: IsarType.string,
    ),
    r'criadoEm': PropertySchema(
      id: 1,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'idosoId': PropertySchema(id: 2, name: r'idosoId', type: IsarType.long),
    r'titulo': PropertySchema(id: 3, name: r'titulo', type: IsarType.string),
  },

  estimateSize: _registoDocumentoEstimateSize,
  serialize: _registoDocumentoSerialize,
  deserialize: _registoDocumentoDeserialize,
  deserializeProp: _registoDocumentoDeserializeProp,
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

  getId: _registoDocumentoGetId,
  getLinks: _registoDocumentoGetLinks,
  attach: _registoDocumentoAttach,
  version: '3.3.2',
);

int _registoDocumentoEstimateSize(
  RegistoDocumento object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.caminhoFicheiro.length * 3;
  bytesCount += 3 + object.titulo.length * 3;
  return bytesCount;
}

void _registoDocumentoSerialize(
  RegistoDocumento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.caminhoFicheiro);
  writer.writeDateTime(offsets[1], object.criadoEm);
  writer.writeLong(offsets[2], object.idosoId);
  writer.writeString(offsets[3], object.titulo);
}

RegistoDocumento _registoDocumentoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistoDocumento();
  object.caminhoFicheiro = reader.readString(offsets[0]);
  object.criadoEm = reader.readDateTime(offsets[1]);
  object.id = id;
  object.idosoId = reader.readLong(offsets[2]);
  object.titulo = reader.readString(offsets[3]);
  return object;
}

P _registoDocumentoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _registoDocumentoGetId(RegistoDocumento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registoDocumentoGetLinks(RegistoDocumento object) {
  return [];
}

void _registoDocumentoAttach(
  IsarCollection<dynamic> col,
  Id id,
  RegistoDocumento object,
) {
  object.id = id;
}

extension RegistoDocumentoQueryWhereSort
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QWhere> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhere> anyIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idosoId'),
      );
    });
  }
}

extension RegistoDocumentoQueryWhere
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QWhereClause> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause> idBetween(
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
  idosoIdEqualTo(int idosoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'idosoId', value: [idosoId]),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterWhereClause>
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

extension RegistoDocumentoQueryFilter
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QFilterCondition> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'caminhoFicheiro',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'caminhoFicheiro',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'caminhoFicheiro',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'caminhoFicheiro', value: ''),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  caminhoFicheiroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'caminhoFicheiro', value: ''),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  criadoEmEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'criadoEm', value: value),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  idosoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idosoId', value: value),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
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

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titulo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titulo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titulo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titulo', value: ''),
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterFilterCondition>
  tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titulo', value: ''),
      );
    });
  }
}

extension RegistoDocumentoQueryObject
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QFilterCondition> {}

extension RegistoDocumentoQueryLinks
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QFilterCondition> {}

extension RegistoDocumentoQuerySortBy
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QSortBy> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByCaminhoFicheiro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caminhoFicheiro', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByCaminhoFicheiroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caminhoFicheiro', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension RegistoDocumentoQuerySortThenBy
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QSortThenBy> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByCaminhoFicheiro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caminhoFicheiro', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByCaminhoFicheiroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caminhoFicheiro', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByIdosoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idosoId', Sort.desc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QAfterSortBy>
  thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension RegistoDocumentoQueryWhereDistinct
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QDistinct> {
  QueryBuilder<RegistoDocumento, RegistoDocumento, QDistinct>
  distinctByCaminhoFicheiro({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'caminhoFicheiro',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QDistinct>
  distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QDistinct>
  distinctByIdosoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idosoId');
    });
  }

  QueryBuilder<RegistoDocumento, RegistoDocumento, QDistinct> distinctByTitulo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }
}

extension RegistoDocumentoQueryProperty
    on QueryBuilder<RegistoDocumento, RegistoDocumento, QQueryProperty> {
  QueryBuilder<RegistoDocumento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistoDocumento, String, QQueryOperations>
  caminhoFicheiroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caminhoFicheiro');
    });
  }

  QueryBuilder<RegistoDocumento, DateTime, QQueryOperations>
  criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<RegistoDocumento, int, QQueryOperations> idosoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idosoId');
    });
  }

  QueryBuilder<RegistoDocumento, String, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }
}
