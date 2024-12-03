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

  desafio_pokemon2_2c1go2_data_schema.PokemonStruct _Pokemon =
      desafio_pokemon2_2c1go2_data_schema.PokemonStruct.fromSerializableMap(
          jsonDecode(
              '{\"id\":\"0\",\"name\":\"none\",\"imageUrl\":\"none\",\"height\":\"0\",\"weight\":\"0\",\"types\":\"[]\"}'));
  desafio_pokemon2_2c1go2_data_schema.PokemonStruct get Pokemon => _Pokemon;
  set Pokemon(desafio_pokemon2_2c1go2_data_schema.PokemonStruct value) {
    _Pokemon = value;
  }

  void updatePokemonStruct(
      Function(desafio_pokemon2_2c1go2_data_schema.PokemonStruct) updateFn) {
    updateFn(_Pokemon);
  }

  desafio_pokemon2_2c1go2_data_schema.ResultsStruct _Results =
      desafio_pokemon2_2c1go2_data_schema.ResultsStruct.fromSerializableMap(
          jsonDecode('{\"name\":\"0\",\"url\":\"0\"}'));
  desafio_pokemon2_2c1go2_data_schema.ResultsStruct get Results => _Results;
  set Results(desafio_pokemon2_2c1go2_data_schema.ResultsStruct value) {
    _Results = value;
  }

  void updateResultsStruct(
      Function(desafio_pokemon2_2c1go2_data_schema.ResultsStruct) updateFn) {
    updateFn(_Results);
  }

  desafio_pokemon2_2c1go2_data_schema.PokedexStruct _pokedex =
      desafio_pokemon2_2c1go2_data_schema.PokedexStruct.fromSerializableMap(
          jsonDecode(
              '{\"count\":\"0\",\"next\":\"0\",\"previous\":\"0\",\"results\":\"[]\"}'));
  desafio_pokemon2_2c1go2_data_schema.PokedexStruct get pokedex => _pokedex;
  set pokedex(desafio_pokemon2_2c1go2_data_schema.PokedexStruct value) {
    _pokedex = value;
  }

  void updatePokedexStruct(
      Function(desafio_pokemon2_2c1go2_data_schema.PokedexStruct) updateFn) {
    updateFn(_pokedex);
  }
}
