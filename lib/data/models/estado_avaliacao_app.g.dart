// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_avaliacao_app.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEstadoAvaliacaoAppCollection on Isar {
  IsarCollection<EstadoAvaliacaoApp> get estadoAvaliacaoApps =>
      this.collection();
}

const EstadoAvaliacaoAppSchema = CollectionSchema(
  name: r'EstadoAvaliacaoApp',
  id: 8078084135223201094,
  properties: {
    r'ultimaVezMostrado': PropertySchema(
      id: 0,
      name: r'ultimaVezMostrado',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _estadoAvaliacaoAppEstimateSize,
  serialize: _estadoAvaliacaoAppSerialize,
  deserialize: _estadoAvaliacaoAppDeserialize,
  deserializeProp: _estadoAvaliacaoAppDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _estadoAvaliacaoAppGetId,
  getLinks: _estadoAvaliacaoAppGetLinks,
  attach: _estadoAvaliacaoAppAttach,
  version: '3.3.2',
);

int _estadoAvaliacaoAppEstimateSize(
  EstadoAvaliacaoApp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _estadoAvaliacaoAppSerialize(
  EstadoAvaliacaoApp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.ultimaVezMostrado);
}

EstadoAvaliacaoApp _estadoAvaliacaoAppDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EstadoAvaliacaoApp();
  object.id = id;
  object.ultimaVezMostrado = reader.readDateTimeOrNull(offsets[0]);
  return object;
}

P _estadoAvaliacaoAppDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _estadoAvaliacaoAppGetId(EstadoAvaliacaoApp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _estadoAvaliacaoAppGetLinks(
  EstadoAvaliacaoApp object,
) {
  return [];
}

void _estadoAvaliacaoAppAttach(
  IsarCollection<dynamic> col,
  Id id,
  EstadoAvaliacaoApp object,
) {
  object.id = id;
}

extension EstadoAvaliacaoAppQueryWhereSort
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QWhere> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EstadoAvaliacaoAppQueryWhere
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QWhereClause> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhereClause>
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

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterWhereClause>
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
}

extension EstadoAvaliacaoAppQueryFilter
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QFilterCondition> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
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

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
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

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
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

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ultimaVezMostrado'),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ultimaVezMostrado'),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ultimaVezMostrado', value: value),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ultimaVezMostrado',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ultimaVezMostrado',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterFilterCondition>
  ultimaVezMostradoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ultimaVezMostrado',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension EstadoAvaliacaoAppQueryObject
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QFilterCondition> {}

extension EstadoAvaliacaoAppQueryLinks
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QFilterCondition> {}

extension EstadoAvaliacaoAppQuerySortBy
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QSortBy> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  sortByUltimaVezMostrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaVezMostrado', Sort.asc);
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  sortByUltimaVezMostradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaVezMostrado', Sort.desc);
    });
  }
}

extension EstadoAvaliacaoAppQuerySortThenBy
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QSortThenBy> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  thenByUltimaVezMostrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaVezMostrado', Sort.asc);
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QAfterSortBy>
  thenByUltimaVezMostradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaVezMostrado', Sort.desc);
    });
  }
}

extension EstadoAvaliacaoAppQueryWhereDistinct
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QDistinct> {
  QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QDistinct>
  distinctByUltimaVezMostrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaVezMostrado');
    });
  }
}

extension EstadoAvaliacaoAppQueryProperty
    on QueryBuilder<EstadoAvaliacaoApp, EstadoAvaliacaoApp, QQueryProperty> {
  QueryBuilder<EstadoAvaliacaoApp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EstadoAvaliacaoApp, DateTime?, QQueryOperations>
  ultimaVezMostradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaVezMostrado');
    });
  }
}
