import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';

import '../network/pokemon_api_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _allPokemon = [];
  Pokemon? _selectedPokemon;

  List<Pokemon> get allPokemon => _allPokemon;
  Pokemon? get selectedPokemon => _selectedPokemon;

  Future<void> getPokemons() async {
    final apiService = PokemonApiService();
    _allPokemon = await apiService.getPokemonList();
    log('getPokemons: ${_allPokemon.length}');
    notifyListeners();
  }

  void setSelectedPokemon(Pokemon pokemon) {
    _selectedPokemon = pokemon;
    notifyListeners();
  }
}

final pokemonProvider = ChangeNotifierProvider((ref) => PokemonProvider());
