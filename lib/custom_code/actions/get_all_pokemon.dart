// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future getAllPokemon() async {
  // to get all pokemon and fill state

  var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<Pokemon> pokemonList = [];

    for (var pokemon in data['results']) {
      Pokemon newPokemon = Pokemon(
          name: pokemon['name'],
          height: pokemon['height'],
          id: pokemon['id'],
          imageUrl: pokemon['imageUrl'],
          types: pokemon['types'],
          weight: pokemon['weight']);
      pokemonList.add(newPokemon);
    }

    return pokemonList;
  } else {
    throw Exception('Failed to load pokemon');
  }
}

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final double height;
  final double weight;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'] ??
          json['sprites']['front_default'],
      height: json['height'] / 10,
      weight: json['weight'] / 10,
      types:
          List<String>.from(json['types'].map((type) => type['type']['name'])),
    );
  }
}
