import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';

class GetPokemonForIdUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonForIdUseCase({required this.pokemonRepository});

  Future<Pokemon> call(int id) async {
    return await pokemonRepository.getPokemonForId(id);
  }
}
