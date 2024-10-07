import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonsUseCase({required this.pokemonRepository});

  Future<List<Pokemon>> call() async {
    return await pokemonRepository.getPokemons();
  }
}
