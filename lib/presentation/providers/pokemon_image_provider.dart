import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:pokeapp_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:tuple/tuple.dart';

// Proveedor para el repositorio de Pokémon
final mPokemonRepositoryProvider = Provider<PokemonRepositoryImpl>((ref) {
  return PokemonRepositoryImpl(mPokemonDataSource: PokemonDataSourceImpl());
});

final mPokemonImageByIdProvider = FutureProvider.family<Tuple2<bool, Uint8List?>, String>((ref, mUrl) async {
  final mRepository = ref.watch(mPokemonRepositoryProvider);
  return mRepository.getPokemonImage(mUrl);
});

// Proveedor para almacenar las imágenes de Pokémon en caché
final mPokemonImageCacheProvider = StateProvider<Map<String, Uint8List>>((ref) => {});

// Proveedor para obtener y almacenar la imagen de un Pokémon
final mCachedPokemonImageProvider = FutureProvider.family<Uint8List?, String>((ref, mUrl) async {
  final mCachedImages = ref.watch(mPokemonImageCacheProvider);

  if (mCachedImages.containsKey(mUrl)) {
    return mCachedImages[mUrl];
  }

  final mImageResult = await ref.watch(mPokemonImageByIdProvider(mUrl).future);

  if (mImageResult.item1 && mImageResult.item2 != null) {
    ref.read(mPokemonImageCacheProvider.notifier).state = {...mCachedImages, mUrl: mImageResult.item2!};
    return mImageResult.item2;
  }

  return null;
});
