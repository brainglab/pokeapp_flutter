import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';
import 'package:tuple/tuple.dart';

class GetPokemonsUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonsUseCase({required this.pokemonRepository});

  Future<Tuple2<List<PokemonModel>, String?>> call(String mParameters) async {
    return await pokemonRepository.getPokemons(mParameters);
  }
}
