import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';

import '../network/pokemon_api_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _allPokemon = [];

  List<Pokemon> get allPokemon => _allPokemon;

  Future<void> getPokemons() async {
    final apiService = PokemonApiService();
    _allPokemon = await apiService.getPokemonList();
    log('getPokemons: ${_allPokemon.length}');
    notifyListeners();
  }
}

final pokemonProvider = ChangeNotifierProvider((ref) => PokemonProvider());
