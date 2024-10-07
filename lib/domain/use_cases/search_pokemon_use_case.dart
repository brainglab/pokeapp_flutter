import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';

class SearchPokemonUseCase {
  final PokemonRepository pokemonRepository;

  SearchPokemonUseCase({required this.pokemonRepository});

  Future<List<Pokemon>> call(String search) async {
    return await pokemonRepository.searchPokemon(search);
  }
}
