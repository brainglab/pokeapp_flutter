import 'package:pokeapp_flutter/domain/entities/pokemon.dart';

abstract class PokemonsRemoteDataSource {
  Future<List<Pokemon>> getPokemons();
}
