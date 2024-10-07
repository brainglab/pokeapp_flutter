import 'package:pokeapp_flutter/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
  Future<List<Pokemon>> searchPokemon(String search);
  Future<Pokemon> getPokemonForId(int id);
}
