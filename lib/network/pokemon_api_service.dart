import 'dart:convert';
import 'dart:developer';

import 'package:pokemon_riverpod/model/pokemon.dart';
import 'package:pokemon_riverpod/network/network_api_service.dart';
import 'package:pokemon_riverpod/utlis/constant.dart';

class PokemonApiService extends NetworkApiService {
  Future<List<Pokemon>> getPokemonList() async {
    final response = await getResponse(POKEMON_API_URL);
    final List jsonResponse = json.decode(response);
    return jsonResponse.map((e) => Pokemon.fromJson(e)).toList();
  }
}
