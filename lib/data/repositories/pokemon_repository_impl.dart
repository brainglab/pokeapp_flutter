import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';
import 'package:tuple/tuple.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSource mPokemonDataSource;

  PokemonRepositoryImpl({required this.mPokemonDataSource});

  @override
  Future<Tuple2<List<PokemonModel>, String?>> getPokemons(String mParameters) async {
    try {
      final mPokemonModel = await mPokemonDataSource.getPokemons(mParameters);
      return mPokemonModel;
    } catch (e, stacktrace) {
      debugPrint('==> $runtimeType error: $e \n\n ${stacktrace.toString()} \n\n');
      Tuple2<List<PokemonModel>, String?> mTuplaVacia = const Tuple2([], null);
      return Future.value(mTuplaVacia);
    }
  }

  @override
  Future<PokemonModel> getPokemonForId(String id) async {
    try {
      final mPokemonModel = await mPokemonDataSource.getPokemonForId(id);
      return mPokemonModel;
    } catch (e, stacktrace) {
      debugPrint('==> $runtimeType error: $e \n\n ${stacktrace.toString()} \n\n');
      PokemonModel mPokemonModel = PokemonModel();
      return Future.value(mPokemonModel);
    }
  }

  @override
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mUrl) async {
    try {
      final mPokemonImage = await mPokemonDataSource.getPokemonImage(mUrl);
      return mPokemonImage;
    } catch (e, stacktrace) {
      debugPrint('==> $runtimeType error: $e \n\n ${stacktrace.toString()} \n\n');
      return const Tuple2<bool, Uint8List?>(false, null);
    }
  }
}
