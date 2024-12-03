// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PokemonStruct extends BaseStruct {
  PokemonStruct({
    int? id,
    String? name,
    String? imageUrl,
    double? height,
    double? weight,
    List<String>? types,
  })  : _id = id,
        _name = name,
        _imageUrl = imageUrl,
        _height = height,
        _weight = weight,
        _types = types;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "types" field.
  List<String>? _types;
  List<String> get types => _types ?? const [];
  set types(List<String>? val) => _types = val;

  void updateTypes(Function(List<String>) updateFn) {
    updateFn(_types ??= []);
  }

  bool hasTypes() => _types != null;

  static PokemonStruct fromMap(Map<String, dynamic> data) => PokemonStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        imageUrl: data['imageUrl'] as String?,
        height: castToType<double>(data['height']),
        weight: castToType<double>(data['weight']),
        types: getDataList(data['types']),
      );

  static PokemonStruct? maybeFromMap(dynamic data) =>
      data is Map ? PokemonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'imageUrl': _imageUrl,
        'height': _height,
        'weight': _weight,
        'types': _types,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'types': serializeParam(
          _types,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PokemonStruct fromSerializableMap(Map<String, dynamic> data) =>
      PokemonStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        types: deserializeParam<String>(
          data['types'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PokemonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PokemonStruct &&
        id == other.id &&
        name == other.name &&
        imageUrl == other.imageUrl &&
        height == other.height &&
        weight == other.weight &&
        listEquality.equals(types, other.types);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, imageUrl, height, weight, types]);
}

PokemonStruct createPokemonStruct({
  int? id,
  String? name,
  String? imageUrl,
  double? height,
  double? weight,
}) =>
    PokemonStruct(
      id: id,
      name: name,
      imageUrl: imageUrl,
      height: height,
      weight: weight,
    );
