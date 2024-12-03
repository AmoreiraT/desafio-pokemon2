// ignore_for_file: unnecessary_getters_setters

import 'package:desafio_pokemon2_2c1go2/backend/schema/structs/results_struct.dart'
    as desafio_pokemon2_2c1go2_data_schema;

import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart';

class PokedexStruct extends BaseStruct {
  PokedexStruct({
    int? count,
    String? next,
    String? previous,
    List<desafio_pokemon2_2c1go2_data_schema.ResultsStruct>? results,
  })  : _count = count,
        _next = next,
        _previous = previous,
        _results = results;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "next" field.
  String? _next;
  String get next => _next ?? '';
  set next(String? val) => _next = val;

  bool hasNext() => _next != null;

  // "previous" field.
  String? _previous;
  String get previous => _previous ?? '';
  set previous(String? val) => _previous = val;

  bool hasPrevious() => _previous != null;

  // "results" field.
  List<desafio_pokemon2_2c1go2_data_schema.ResultsStruct>? _results;
  List<desafio_pokemon2_2c1go2_data_schema.ResultsStruct> get results =>
      _results ?? const [];
  set results(List<desafio_pokemon2_2c1go2_data_schema.ResultsStruct>? val) =>
      _results = val;

  void updateResults(
      Function(List<desafio_pokemon2_2c1go2_data_schema.ResultsStruct>)
          updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  static PokedexStruct fromMap(Map<String, dynamic> data) => PokedexStruct(
        count: castToType<int>(data['count']),
        next: data['next'] as String?,
        previous: data['previous'] as String?,
        results: getStructList(
          data['results'],
          desafio_pokemon2_2c1go2_data_schema.ResultsStruct.fromMap,
        ),
      );

  static PokedexStruct? maybeFromMap(dynamic data) =>
      data is Map ? PokedexStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
        'next': _next,
        'previous': _previous,
        'results': _results?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'next': serializeParam(
          _next,
          ParamType.String,
        ),
        'previous': serializeParam(
          _previous,
          ParamType.String,
        ),
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PokedexStruct fromSerializableMap(Map<String, dynamic> data) =>
      PokedexStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        next: deserializeParam(
          data['next'],
          ParamType.String,
          false,
        ),
        previous: deserializeParam(
          data['previous'],
          ParamType.String,
          false,
        ),
        results: deserializeStructParam<
            desafio_pokemon2_2c1go2_data_schema.ResultsStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: desafio_pokemon2_2c1go2_data_schema
              .ResultsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PokedexStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PokedexStruct &&
        count == other.count &&
        next == other.next &&
        previous == other.previous &&
        listEquality.equals(results, other.results);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([count, next, previous, results]);
}

PokedexStruct createPokedexStruct({
  int? count,
  String? next,
  String? previous,
}) =>
    PokedexStruct(
      count: count,
      next: next,
      previous: previous,
    );
