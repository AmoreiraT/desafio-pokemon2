import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;

PokedexStruct? callGetAllPoke() {
  // create a function to call GetAllPokemon custom action to return a component on https://pub.dev/packages/data_table_2
  // Call the custom action to get all Pokemon data
  // Replace the URL with the actual endpoint URL
  final url = 'https://api.example.com/getAllPokemon';

  // Make the API call to fetch the data
  // You can use any HTTP client library to make the API call
  // For example, you can use the http package
  // Make sure to handle errors and exceptions
  // Here is a sample code using http package
  /*
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return PokedexStruct.fromMap(jsonData);
  } else {
    throw Exception('Failed to load Pokemon data');
  }
  */

  // For demonstration purposes, returning a dummy PokedexStruct
  return createPokedexStruct(
    count: 10,
    next: 'https://api.example.com/getAllPokemon?page=2',
    previous: '',
  );
}
