// home_page_widget.dart
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_model.dart';

export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  final int _offset = 0;
  final int _limit = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameFilter = TextEditingController();
  final TextEditingController _idFilter = TextEditingController();
  String? _selectedType;
  List<Pokemon> _filteredPokemons = [];

  final int _itemsPerPage = 20;
  int _currentPage = 1;
  int _totalItems = 0;
  int _currentCarouselIndex = 0;

  FutureOr<void> _loadPokemons() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final offset = (_currentPage - 1) * _itemsPerPage;
      final response = await http.get(
        Uri.parse(
            'https://pokeapi.co/api/v2/pokemon?limit=$_itemsPerPage&offset=$offset'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _totalItems = data['count'];
        _pokemons.clear();

        for (var pokemon in data['results']) {
          final detailResponse = await http.get(Uri.parse(pokemon['url']));
          if (detailResponse.statusCode == 200) {
            final pokemonData = jsonDecode(detailResponse.body);
            setState(() {
              _pokemons.add(Pokemon.fromJson(pokemonData));
            });
          }
        }

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading Pokémon: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handlePageChange(int page) {
    setState(() {
      _currentPage = page;
    });
    _loadPokemons();
  }

  void _filterPokemons() {
    setState(() {
      _filteredPokemons = _pokemons.where((pokemon) {
        final nameMatch =
            pokemon.name.toLowerCase().contains(_nameFilter.text.toLowerCase());
        final idMatch = _idFilter.text.isEmpty ||
            pokemon.id.toString().contains(_idFilter.text);
        final typeMatch = _selectedType == null ||
            pokemon.types.contains(_selectedType!.toLowerCase());
        return nameMatch && idMatch && typeMatch;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    _loadPokemons();
  }

  @override
  void dispose() {
    _nameFilter.dispose();
    _idFilter.dispose();
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading && _pokemons.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.fromLTRB(
                  16, 40, 16, 16), // Added top padding
              child: Column(
                children: [
                  // Logo and Reload button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://www.foursys.com.br/images/logo-foursys.png',
                        color: const Color(0xFFEE1515),
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          setState(() {
                            _pokemons.clear();
                            _currentPage = 1;
                          });
                          _loadPokemons();
                        },
                      ),
                    ],
                  ),

                  // Update Carousel height and spacing
                  if (_pokemons.isNotEmpty) ...[
                    CarouselSlider.builder(
                      itemCount: _pokemons.length,
                      options: CarouselOptions(
                        height: 200, // Reduced height
                        viewportFraction: 0.4, // Show more items
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentCarouselIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        final pokemon = _pokemons[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  pokemon.types.isNotEmpty
                                      ? _getTypeColor(pokemon.types.first)
                                          .withOpacity(0.7)
                                      : Colors.grey,
                                  Colors.white,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: 'pokemon-${pokemon.id}',
                                  child: CachedNetworkImage(
                                    imageUrl: pokemon.imageUrl,
                                    height: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  pokemon.name.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: pokemon.types.map((type) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getTypeColor(type),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        type.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4), // Reduced spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pokemons.asMap().entries.map((entry) {
                        return Container(
                          width: 6, // Smaller dots
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentCarouselIndex == entry.key
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8), // Reduced spacing
                  ],

                  // Existing filter Card and DataTable2...
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _nameFilter,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (_) => _filterPokemons(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: _idFilter,
                              decoration: const InputDecoration(
                                labelText: 'ID',
                                prefixIcon: Icon(Icons.tag),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (_) => _filterPokemons(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: _selectedType,
                            hint: const Text('Tipo'),
                            items: [
                              const DropdownMenuItem(
                                value: null,
                                child: Text('Todos'),
                              ),
                              ...{
                                'normal',
                                'fire',
                                'water',
                                'electric',
                                'grass',
                                'ice',
                                'fighting',
                                'poison',
                                'ground',
                                'flying',
                                'psychic',
                                'bug',
                                'rock',
                                'ghost',
                                'dragon',
                                'dark',
                                'steel',
                                'fairy'
                              }.map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type.toUpperCase()),
                                  )),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value;
                                _filterPokemons();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: DataTable2(
                      columns: [
                        DataColumn2(
                          label: const Text('ID'),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: const Text('Imagem'),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: const Text('Nome'),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: const Text('Elementos'),
                          size: ColumnSize.L,
                        ),
                      ],
                      dataRowHeight: 100, // Increased height
                      headingRowHeight: 60,
                      columnSpacing: 20,
                      horizontalMargin: 12,
                      dividerThickness: 2,
                      rows: (_filteredPokemons.isEmpty
                              ? _pokemons
                              : _filteredPokemons)
                          .map((pokemon) {
                        return DataRow2(
                          cells: [
                            DataCell(
                              Text(
                                '#${pokemon.id.toString().padLeft(3, '0')}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: CachedNetworkImage(
                                  imageUrl: pokemon.imageUrl,
                                  height: 80, // Larger image
                                  width: 80,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                pokemon.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: pokemon.types.map((type) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getTypeColor(type),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _getTypeColor(type)
                                                .withOpacity(0.4),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        type.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: _currentPage > 1
                              ? () => _handlePageChange(_currentPage - 1)
                              : null,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Página $_currentPage de ${(_totalItems / _itemsPerPage).ceil()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: _currentPage <
                                  (_totalItems / _itemsPerPage).ceil()
                              ? () => _handlePageChange(_currentPage + 1)
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'] ??
          json['sprites']['front_default'],
      types:
          List<String>.from(json['types'].map((type) => type['type']['name'])),
    );
  }
}
