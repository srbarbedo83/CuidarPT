// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferencias_idoso.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PreferenciasIdosoSchema = Schema(
  name: r'PreferenciasIdoso',
  id: -6023488574693038325,
  properties: {
    r'comidaPreferida': PropertySchema(
      id: 0,
      name: r'comidaPreferida',
      type: IsarType.string,
    ),
    r'interesses': PropertySchema(
      id: 1,
      name: r'interesses',
      type: IsarType.string,
    ),
    r'musica': PropertySchema(id: 2, name: r'musica', type: IsarType.string),
  },

  estimateSize: _preferenciasIdosoEstimateSize,
  serialize: _preferenciasIdosoSerialize,
  deserialize: _preferenciasIdosoDeserialize,
  deserializeProp: _preferenciasIdosoDeserializeProp,
);

int _preferenciasIdosoEstimateSize(
  PreferenciasIdoso object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.comidaPreferida;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.interesses;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.musica;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _preferenciasIdosoSerialize(
  PreferenciasIdoso object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.comidaPreferida);
  writer.writeString(offsets[1], object.interesses);
  writer.writeString(offsets[2], object.musica);
}

PreferenciasIdoso _preferenciasIdosoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PreferenciasIdoso();
  object.comidaPreferida = reader.readStringOrNull(offsets[0]);
  object.interesses = reader.readStringOrNull(offsets[1]);
  object.musica = reader.readStringOrNull(offsets[2]);
  return object;
}

P _preferenciasIdosoDeserializeProp<P>(
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
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PreferenciasIdosoQueryFilter
    on QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QFilterCondition> {
  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'comidaPreferida'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'comidaPreferida'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'comidaPreferida',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'comidaPreferida',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'comidaPreferida',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'comidaPreferida', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  comidaPreferidaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'comidaPreferida', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'interesses'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'interesses'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'interesses',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'interesses',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'interesses',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'interesses', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  interessesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'interesses', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'musica'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'musica'),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'musica',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'musica',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'musica',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'musica', value: ''),
      );
    });
  }

  QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QAfterFilterCondition>
  musicaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'musica', value: ''),
      );
    });
  }
}

extension PreferenciasIdosoQueryObject
    on QueryBuilder<PreferenciasIdoso, PreferenciasIdoso, QFilterCondition> {}
