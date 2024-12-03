import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import '/backend/api_requests/api_calls.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  PokemonStruct _Pokemon = PokemonStruct.fromSerializableMap(jsonDecode(
      '{\"id\":\"0\",\"name\":\"none\",\"imageUrl\":\"none\",\"height\":\"0\",\"weight\":\"0\",\"types\":\"[]\"}'));
  PokemonStruct get Pokemon => _Pokemon;
  set Pokemon(PokemonStruct value) {
    _Pokemon = value;
  }

  void updatePokemonStruct(Function(PokemonStruct) updateFn) {
    updateFn(_Pokemon);
  }

  ResultsStruct _Results = ResultsStruct.fromSerializableMap(
      jsonDecode('{\"name\":\"0\",\"url\":\"0\"}'));
  ResultsStruct get Results => _Results;
  set Results(ResultsStruct value) {
    _Results = value;
  }

  void updateResultsStruct(Function(ResultsStruct) updateFn) {
    updateFn(_Results);
  }

  PokedexStruct _pokedex = PokedexStruct.fromSerializableMap(jsonDecode(
      '{\"count\":\"0\",\"next\":\"0\",\"previous\":\"0\",\"results\":\"[]\"}'));
  PokedexStruct get pokedex => _pokedex;
  set pokedex(PokedexStruct value) {
    _pokedex = value;
  }

  void updatePokedexStruct(Function(PokedexStruct) updateFn) {
    updateFn(_pokedex);
  }
}
