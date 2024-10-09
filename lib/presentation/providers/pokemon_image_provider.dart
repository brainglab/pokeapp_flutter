import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:pokeapp_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:tuple/tuple.dart';

/// Proveedor para el repositorio de Pokémon.
///
/// Este proveedor crea y proporciona una instancia de [PokemonRepositoryImpl],
/// que es la implementación concreta del repositorio de Pokémon.
///
/// Características principales:
/// - Utiliza [Provider] de Riverpod para crear un proveedor de lectura.
/// - Crea una nueva instancia de [PokemonRepositoryImpl] cada vez que se accede.
/// - Inyecta una instancia de [PokemonDataSourceImpl] como fuente de datos.
///
/// Uso típico:
/// ```dart
/// final repository = ref.watch(mPokemonRepositoryProvider);
/// ```
///
/// Este proveedor es fundamental para la arquitectura de la aplicación, ya que:
/// 1. Centraliza la creación del repositorio, facilitando su uso en toda la app.
/// 2. Permite la inyección de dependencias, lo que mejora la testabilidad.
/// 3. Facilita el cambio de implementación del repositorio si es necesario.
///
/// @return Una instancia de [PokemonRepositoryImpl] configurada con [PokemonDataSourceImpl].
final mPokemonRepositoryProvider = Provider<PokemonRepositoryImpl>((ref) {
  return PokemonRepositoryImpl(mPokemonDataSource: PokemonDataSourceImpl());
});

/// Proveedor para obtener la imagen de un Pokémon por su URL.
///
/// Este proveedor utiliza [FutureProvider.family] de Riverpod para crear un proveedor
/// que puede ser parametrizado con una URL y devuelve un [Future] con la imagen del Pokémon.
///
/// Características principales:
/// - Acepta una URL como parámetro para identificar la imagen del Pokémon.
/// - Retorna un [Tuple2] que contiene:
///   - Un booleano indicando si la operación fue exitosa.
///   - Un [Uint8List] opcional con los datos de la imagen (null si no se encontró).
/// - Utiliza el repositorio de Pokémon para obtener la imagen.
///
/// Uso típico:
/// ```dart
/// final imageResult = ref.watch(mPokemonImageByIdProvider('https://example.com/pokemon/1.png'));
/// ```
///
/// Este proveedor es útil para:
/// 1. Cargar imágenes de Pokémon de forma asíncrona.
/// 2. Manejar casos donde la imagen no está disponible o hay errores de carga.
/// 3. Integrar fácilmente la carga de imágenes en widgets que usan Riverpod.
///
/// @param ref El [ProviderRef] proporcionado por Riverpod.
/// @param mUrl La URL de la imagen del Pokémon a cargar.
/// @return Un [Future] que resuelve a un [Tuple2<bool, Uint8List?>] con el resultado de la carga.
final mPokemonImageByIdProvider = FutureProvider.family<Tuple2<bool, Uint8List?>, String>((ref, mUrl) async {
  final mRepository = ref.watch(mPokemonRepositoryProvider);
  return mRepository.getPokemonImage(mUrl);
});

/// Proveedor para almacenar las imágenes de Pokémon en caché.
///
/// Este proveedor utiliza [StateProvider] de Riverpod para crear un estado mutable
/// que almacena las imágenes de Pokémon en memoria.
///
/// Características principales:
/// - Utiliza un [Map] para asociar URLs de imágenes con sus datos binarios.
/// - La clave del mapa es la URL de la imagen (String).
/// - El valor es la imagen en formato binario (Uint8List).
/// - Inicializa con un mapa vacío.
///
/// Beneficios:
/// 1. Mejora el rendimiento al evitar descargas repetidas de la misma imagen.
/// 2. Reduce el consumo de datos del dispositivo.
/// 3. Proporciona acceso rápido a imágenes previamente cargadas.
///
/// Uso típico:
/// ```dart
/// final imageCache = ref.watch(mPokemonImageCacheProvider);
/// final imageData = imageCache[imageUrl];
/// ```
///
/// Para modificar el caché:
/// ```dart
/// ref.read(mPokemonImageCacheProvider.notifier).state = {...nuevoMapa};
/// ```
///
/// Este proveedor es crucial para la gestión eficiente de imágenes en la aplicación,
/// especialmente cuando se manejan listas largas de Pokémon.
final mPokemonImageCacheProvider = StateProvider<Map<String, Uint8List>>((ref) => {});

/// Proveedor para obtener y almacenar la imagen de un Pokémon en caché.
///
/// Este proveedor utiliza [FutureProvider.family] de Riverpod para manejar la carga
/// asíncrona de imágenes de Pokémon y su almacenamiento en caché.
///
/// Características principales:
/// - Verifica primero si la imagen ya está en caché antes de intentar descargarla.
/// - Si la imagen no está en caché, la descarga utilizando [mPokemonImageByIdProvider].
/// - Almacena la imagen descargada en el caché para futuras consultas.
/// - Maneja casos donde la imagen no está disponible o hay errores de carga.
///
/// Parámetros:
/// @param ref El [ProviderRef] proporcionado por Riverpod.
/// @param mUrl La URL de la imagen del Pokémon a cargar.
///
/// Retorno:
/// @return Un [Future] que resuelve a un [Uint8List?] con los datos binarios de la imagen,
///         o null si la imagen no pudo ser cargada.
///
/// Uso típico:
/// ```dart
/// final imageData = await ref.watch(mCachedPokemonImageProvider('https://example.com/pokemon/1.png').future);
/// ```
///
/// Beneficios:
/// 1. Mejora el rendimiento al evitar descargas repetidas de la misma imagen.
/// 2. Reduce el consumo de datos del dispositivo.
/// 3. Proporciona una interfaz simple para la carga y caché de imágenes de Pokémon.
///
/// Este proveedor es esencial para la gestión eficiente de imágenes en la aplicación,
/// especialmente cuando se manejan múltiples imágenes de Pokémon en diferentes partes de la UI.
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
