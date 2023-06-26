import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/model/pokemon.dart';
import 'package:pokemon_riverpod/utlis/hive_service.dart';

import '../network/pokemon_api_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _allPokemon = [];
  Pokemon? _selectedPokemon;
  List<Pokemon> _favPokemon = [];
  HiveService hiveService = HiveService();
  bool _isFav = false;

  List<Pokemon> get allPokemon => _allPokemon;
  Pokemon? get selectedPokemon => _selectedPokemon;
  List<Pokemon> get favPokemon => _favPokemon;
  bool get isFav => _isFav;

  Future<void> getPokemons() async {
    final apiService = PokemonApiService();
    _allPokemon = await apiService.getPokemonList();
    log('getPokemons: ${_allPokemon.length}');
    notifyListeners();
  }

  void setSelectedPokemon(Pokemon pokemon) {
    _selectedPokemon = pokemon;
    _favPokemon.forEach((pok) {
      if (pok.id == pokemon.id) {
        _isFav = true;
      } else {
        _isFav = false;
      }
    });
    notifyListeners();
  }

  Future getFavPokemon() async {
    _favPokemon = await hiveService.getPokemon();
    notifyListeners();
    log(_favPokemon.map((e) => e.name).toString());
  }

  Future toggleFavPokemon() async {
    // _favPokemon.forEach((pokemon) async {
    //   if (pokemon.id == selectedPokemon!.id) {
    //     _isFav = true;
    //     await hiveService.removePokemon(selectedPokemon!.id!);
    //     log('Pokemon removed from fav ${selectedPokemon!.name}');
    //     await getFavPokemon();
    //     notifyListeners();
    //   } else {
    //     await hiveService.addPokemon(selectedPokemon!);
    //     log('Pokemon added to fav ${selectedPokemon!.name}');
    //     _isFav = true;
    //     await getFavPokemon();
    //     notifyListeners();
    //   }
    // });

    if (_favPokemon.contains(selectedPokemon)) {
      await hiveService.removePokemon(selectedPokemon!.id!);
      log('Pokemon removed from fav ${selectedPokemon!.name}');
      await getFavPokemon();
      _isFav = false;
      notifyListeners();
    } else {
      await hiveService.addPokemon(selectedPokemon!);
      log('Pokemon added to fav ${selectedPokemon!.name}');
      _isFav = true;
      await getFavPokemon();
      notifyListeners();
    }
  }
}

final pokemonProvider = ChangeNotifierProvider((ref) => PokemonProvider());
