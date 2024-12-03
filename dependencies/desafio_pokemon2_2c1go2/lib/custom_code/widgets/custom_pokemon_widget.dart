// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:data_table_2/data_table_2.dart';
import 'pokemonservice.dart'; // Imports other custom widgets

class CustomPokemonWidget extends StatefulWidget {
  const CustomPokemonWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _CustomPokemonWidgetState createState() => _CustomPokemonWidgetState();
}

class _CustomPokemonWidgetState extends State<CustomPokemonWidget> {
  final List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  int _offset = 0;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final pokemons = await getPokemons(limit: _limit, offset: _offset);
      setState(() {
        _pokemons.addAll(pokemons);
        _offset += _limit;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading Pokemon: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading && _pokemons.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable2(
              columns: const [
                DataColumn2(label: Text('ID'), size: ColumnSize.S),
                DataColumn2(label: Text('Image'), size: ColumnSize.S),
                DataColumn2(label: Text('Name'), size: ColumnSize.M),
                DataColumn2(label: Text('Types'), size: ColumnSize.L),
              ],
              rows: _pokemons.map((pokemon) {
                return DataRow2(
                  cells: [
                    DataCell(Text('#${pokemon.id.toString().padLeft(3, '0')}')),
                    DataCell(CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      height: 50,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                    DataCell(Text(pokemon.name.toUpperCase())),
                    DataCell(Wrap(
                      spacing: 8,
                      children: pokemon.types.map((type) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getTypeColor(type),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            type.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    )),
                  ],
                );
              }).toList(),
            ),
          );
  }

  Color _getTypeColor(String type) {
    final colors = {
      'normal': const Color(0xFFA8A878),
      'fire': const Color(0xFFF08030),
      'water': const Color(0xFF6890F0),
      'electric': const Color(0xFFF8D030),
      'grass': const Color(0xFF78C850),
      'ice': const Color(0xFF98D8D8),
      'fighting': const Color(0xFFC03028),
      'poison': const Color(0xFFA040A0),
      'ground': const Color(0xFFE0C068),
      'flying': const Color(0xFFA890F0),
      'psychic': const Color(0xFFF85888),
      'bug': const Color(0xFFA8B820),
      'rock': const Color(0xFFB8A038),
      'ghost': const Color(0xFF705898),
      'dragon': const Color(0xFF7038F8),
      'dark': const Color(0xFF705848),
      'steel': const Color(0xFFB8B8D0),
      'fairy': const Color(0xFFEE99AC),
    };
    return colors[type.toLowerCase()] ?? Colors.grey;
  }
}
