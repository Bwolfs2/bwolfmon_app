import 'package:dio/dio.dart';

import '../domain/entities/pokemon_entity.dart';

class HomeDataSource {
  final Dio _client = Dio();

  Future<List<PokemonEntity>> getPokemons() async {
    final result = await _client
        .get('https://pokeapi.co/api/v2/pokemon?offset=20&limit=20');

    final pokemons = (result.data['results'] as List).map((e) {
      return PokemonEntity(
          pokemonId: e['name'], pokemonName: e['name'], pokemonUrl: e['url']);
    }).toList();
 
    return pokemons;
  }
}
