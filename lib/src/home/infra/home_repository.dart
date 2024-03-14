import 'package:bwolfmon_app/src/home/data/home_datasource.dart';
import 'package:bwolfmon_app/src/home/domain/entities/pokemon_entity.dart';

class HomeRepository {
  final _homeDataSource = HomeDataSource();

  Future<List<PokemonEntity>> getPokemons() async {
    return _homeDataSource.getPokemons();
  }
}
