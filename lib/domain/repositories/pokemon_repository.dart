import 'dart:typed_data';

import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:tuple/tuple.dart';

abstract class PokemonRepository {
  Future<Tuple2<List<PokemonModel>, String?>> getPokemons(String mParameters);
  Future<PokemonModel> getPokemonForId(String id);
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mUrl);
}
