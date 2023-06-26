import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_riverpod/Providers/theme_provider.dart';
import 'package:pokemon_riverpod/screens/splash_screen.dart';
import 'package:pokemon_riverpod/theme/styles.dart';

import 'model/pokemon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  runApp(const ProviderScope(child: PokemonRiverpod()));
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
        home: const SplashScreen(),
      );
    });
  }
}
