import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/Providers/theme_provider.dart';
import 'package:pokemon_riverpod/screens/all_pokemon_list.dart';
import 'package:pokemon_riverpod/theme/styles.dart';

void main() {
  runApp(ProviderScope(child: PokemonRiverpod()));
}

class PokemonRiverpod extends StatelessWidget {
  const PokemonRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeNotifier = ref.watch(themeProvider);
      return MaterialApp(
        theme: Styles.themeData(themeNotifier.isDarkMode, context),
        debugShowCheckedModeBanner: false,
        home: AllPokemonList(),
      );
    });
  }
}
