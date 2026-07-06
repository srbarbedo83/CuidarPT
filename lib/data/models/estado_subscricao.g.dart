// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_subscricao.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEstadoSubscricaoCollection on Isar {
  IsarCollection<EstadoSubscricao> get estadoSubscricaos => this.collection();
}

const EstadoSubscricaoSchema = CollectionSchema(
  name: r'EstadoSubscricao',
  id: -897993666953604579,
  properties: {
    r'plano': PropertySchema(
      id: 0,
      name: r'plano',
      type: IsarType.string,
      enumMap: _EstadoSubscricaoplanoEnumValueMap,
    ),
    r'premiumExpiraEm': PropertySchema(
      id: 1,
      name: r'premiumExpiraEm',
      type: IsarType.dateTime,
    ),
    r'produtoPlayStoreId': PropertySchema(
      id: 2,
      name: r'produtoPlayStoreId',
      type: IsarType.string,
    ),
    r'trialFim': PropertySchema(
      id: 3,
      name: r'trialFim',
      type: IsarType.dateTime,
    ),
    r'trialInicio': PropertySchema(
      id: 4,
      name: r'trialInicio',
      type: IsarType.dateTime,
    ),
    r'ultimaValidacaoCompra': PropertySchema(
      id: 5,
      name: r'ultimaValidacaoCompra',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _estadoSubscricaoEstimateSize,
  serialize: _estadoSubscricaoSerialize,
  deserialize: _estadoSubscricaoDeserialize,
  deserializeProp: _estadoSubscricaoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _estadoSubscricaoGetId,
  getLinks: _estadoSubscricaoGetLinks,
  attach: _estadoSubscricaoAttach,
  version: '3.3.2',
);

int _estadoSubscricaoEstimateSize(
  EstadoSubscricao object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.plano.name.length * 3;
  {
    final value = object.produtoPlayStoreId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _estadoSubscricaoSerialize(
  EstadoSubscricao object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.plano.name);
  writer.writeDateTime(offsets[1], object.premiumExpiraEm);
  writer.writeString(offsets[2], object.produtoPlayStoreId);
  writer.writeDateTime(offsets[3], object.trialFim);
  writer.writeDateTime(offsets[4], object.trialInicio);
  writer.writeDateTime(offsets[5], object.ultimaValidacaoCompra);
}

EstadoSubscricao _estadoSubscricaoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EstadoSubscricao();
  object.id = id;
  object.plano =
      _EstadoSubscricaoplanoValueEnumMap[reader.readStringOrNull(offsets[0])] ??
      Plano.free;
  object.premiumExpiraEm = reader.readDateTimeOrNull(offsets[1]);
  object.produtoPlayStoreId = reader.readStringOrNull(offsets[2]);
  object.trialFim = reader.readDateTime(offsets[3]);
  object.trialInicio = reader.readDateTime(offsets[4]);
  object.ultimaValidacaoCompra = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _estadoSubscricaoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_EstadoSubscricaoplanoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              Plano.free)
          as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EstadoSubscricaoplanoEnumValueMap = {
  r'free': r'free',
  r'premium': r'premium',
};
const _EstadoSubscricaoplanoValueEnumMap = {
  r'free': Plano.free,
  r'premium': Plano.premium,
};

Id _estadoSubscricaoGetId(EstadoSubscricao object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _estadoSubscricaoGetLinks(EstadoSubscricao object) {
  return [];
}

void _estadoSubscricaoAttach(
  IsarCollection<dynamic> col,
  Id id,
  EstadoSubscricao object,
) {
  object.id = id;
}

extension EstadoSubscricaoQueryWhereSort
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QWhere> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EstadoSubscricaoQueryWhere
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QWhereClause> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhereClause>
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

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterWhereClause> idBetween(
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

extension EstadoSubscricaoQueryFilter
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QFilterCondition> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
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

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
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

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
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

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoEqualTo(Plano value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoGreaterThan(
    Plano value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoLessThan(
    Plano value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoBetween(
    Plano lower,
    Plano upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'plano',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'plano',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'plano',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'plano', value: ''),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  planoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'plano', value: ''),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'premiumExpiraEm'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'premiumExpiraEm'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'premiumExpiraEm', value: value),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'premiumExpiraEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'premiumExpiraEm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  premiumExpiraEmBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'premiumExpiraEm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'produtoPlayStoreId'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'produtoPlayStoreId'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'produtoPlayStoreId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'produtoPlayStoreId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'produtoPlayStoreId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'produtoPlayStoreId', value: ''),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  produtoPlayStoreIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'produtoPlayStoreId', value: ''),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialFimEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trialFim', value: value),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialFimGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trialFim',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialFimLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trialFim',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialFimBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trialFim',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialInicioEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trialInicio', value: value),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialInicioGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trialInicio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialInicioLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trialInicio',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  trialInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trialInicio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ultimaValidacaoCompra'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ultimaValidacaoCompra'),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ultimaValidacaoCompra',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ultimaValidacaoCompra',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ultimaValidacaoCompra',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterFilterCondition>
  ultimaValidacaoCompraBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ultimaValidacaoCompra',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension EstadoSubscricaoQueryObject
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QFilterCondition> {}

extension EstadoSubscricaoQueryLinks
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QFilterCondition> {}

extension EstadoSubscricaoQuerySortBy
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QSortBy> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy> sortByPlano() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plano', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByPlanoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plano', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByPremiumExpiraEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premiumExpiraEm', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByPremiumExpiraEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premiumExpiraEm', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByProdutoPlayStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoPlayStoreId', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByProdutoPlayStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoPlayStoreId', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByTrialFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialFim', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByTrialFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialFim', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByTrialInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialInicio', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByTrialInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialInicio', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByUltimaValidacaoCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaValidacaoCompra', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  sortByUltimaValidacaoCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaValidacaoCompra', Sort.desc);
    });
  }
}

extension EstadoSubscricaoQuerySortThenBy
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QSortThenBy> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy> thenByPlano() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plano', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByPlanoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plano', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByPremiumExpiraEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premiumExpiraEm', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByPremiumExpiraEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'premiumExpiraEm', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByProdutoPlayStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoPlayStoreId', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByProdutoPlayStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoPlayStoreId', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByTrialFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialFim', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByTrialFimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialFim', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByTrialInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialInicio', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByTrialInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialInicio', Sort.desc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByUltimaValidacaoCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaValidacaoCompra', Sort.asc);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QAfterSortBy>
  thenByUltimaValidacaoCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaValidacaoCompra', Sort.desc);
    });
  }
}

extension EstadoSubscricaoQueryWhereDistinct
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct> {
  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct> distinctByPlano({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plano', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct>
  distinctByPremiumExpiraEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'premiumExpiraEm');
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct>
  distinctByProdutoPlayStoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'produtoPlayStoreId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct>
  distinctByTrialFim() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialFim');
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct>
  distinctByTrialInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialInicio');
    });
  }

  QueryBuilder<EstadoSubscricao, EstadoSubscricao, QDistinct>
  distinctByUltimaValidacaoCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaValidacaoCompra');
    });
  }
}

extension EstadoSubscricaoQueryProperty
    on QueryBuilder<EstadoSubscricao, EstadoSubscricao, QQueryProperty> {
  QueryBuilder<EstadoSubscricao, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EstadoSubscricao, Plano, QQueryOperations> planoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plano');
    });
  }

  QueryBuilder<EstadoSubscricao, DateTime?, QQueryOperations>
  premiumExpiraEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'premiumExpiraEm');
    });
  }

  QueryBuilder<EstadoSubscricao, String?, QQueryOperations>
  produtoPlayStoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'produtoPlayStoreId');
    });
  }

  QueryBuilder<EstadoSubscricao, DateTime, QQueryOperations>
  trialFimProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialFim');
    });
  }

  QueryBuilder<EstadoSubscricao, DateTime, QQueryOperations>
  trialInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialInicio');
    });
  }

  QueryBuilder<EstadoSubscricao, DateTime?, QQueryOperations>
  ultimaValidacaoCompraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaValidacaoCompra');
    });
  }
}
