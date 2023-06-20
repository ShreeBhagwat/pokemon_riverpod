import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Providers/pokemon_provider.dart';
import 'package:pokemon_riverpod/Providers/theme_provider.dart';

class AllPokemonList extends ConsumerStatefulWidget {
  const AllPokemonList({super.key});

  @override
  ConsumerState<AllPokemonList> createState() => _AllPokemonListState();
}

class _AllPokemonListState extends ConsumerState<AllPokemonList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(pokemonProvider).getPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final pokemonNotifier = ref.watch(pokemonProvider);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text('All Pokemon'),
          actions: [
            IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () {
                ref.read(themeProvider).toggleTheme();
              },
            ),
          ],
        ),
        body: pokemonNotifier.allPokemon.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(pokemonNotifier.allPokemon[index].name!),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
      );
    });
  }
}
