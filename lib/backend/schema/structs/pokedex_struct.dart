// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PokedexStruct extends BaseStruct {
  PokedexStruct({
    int? count,
    String? next,
    String? previous,
    List<ResultsStruct>? results,
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
  List<ResultsStruct>? _results;
  List<ResultsStruct> get results => _results ?? const [];
  set results(List<ResultsStruct>? val) => _results = val;

  void updateResults(Function(List<ResultsStruct>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  static PokedexStruct fromMap(Map<String, dynamic> data) => PokedexStruct(
        count: castToType<int>(data['count']),
        next: data['next'] as String?,
        previous: data['previous'] as String?,
        results: getStructList(
          data['results'],
          ResultsStruct.fromMap,
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
        results: deserializeStructParam<ResultsStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: ResultsStruct.fromSerializableMap,
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
