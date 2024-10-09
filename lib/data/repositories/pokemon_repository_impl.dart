import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';
import 'package:tuple/tuple.dart';

/// Implementación concreta del repositorio de Pokémon.
///
/// Esta clase proporciona la implementación real de los métodos definidos
/// en la interfaz [PokemonRepository]. Actúa como una capa intermedia entre
/// la fuente de datos ([PokemonDataSource]) y la capa de dominio de la aplicación.
///
/// Características principales:
/// - Extiende [PokemonRepository], implementando todos sus métodos abstractos.
/// - Utiliza una instancia de [PokemonDataSource] para acceder a los datos.
/// - Maneja errores y excepciones, proporcionando respuestas seguras en caso de fallos.
/// - Transforma los datos recibidos de la fuente de datos en modelos utilizables por la capa de dominio.
///
/// Métodos implementados:
/// - [getPokemons]: Obtiene una lista paginada de Pokémon.
/// - [getPokemonForId]: Recupera los detalles de un Pokémon específico por su ID.
/// - [getPokemonImage]: Obtiene la imagen de un Pokémon.
///
/// Esta clase es crucial para mantener la separación de responsabilidades
/// entre la capa de datos y la capa de dominio, facilitando la gestión y
/// el mantenimiento del código.
class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSource mPokemonDataSource;

  PokemonRepositoryImpl({required this.mPokemonDataSource});

  /// Obtiene una lista paginada de Pokémon.
  ///
  /// Este método implementa la funcionalidad definida en la interfaz [PokemonRepository]
  /// para recuperar una lista de Pokémon junto con la información de paginación.
  ///
  /// @param mParameters Una cadena que contiene los parámetros de consulta para la paginación
  ///                    (por ejemplo, 'limit=20&offset=0'). Si está vacía, se utilizará una
  ///                    consulta sin parámetros.
  ///
  /// @return Un [Future] que resuelve a un [Tuple2] conteniendo:
  ///   - item1: Una lista de [PokemonModel] representando los Pokémon obtenidos.
  ///   - item2: Una cadena opcional con los parámetros para la siguiente página de resultados.
  ///            Será null si no hay más resultados disponibles.
  ///
  /// Funcionamiento:
  /// 1. Llama al método correspondiente en [mPokemonDataSource].
  /// 2. Si la llamada es exitosa, devuelve los datos obtenidos.
  /// 3. En caso de error, captura la excepción, registra el error, y devuelve una tupla vacía.
  ///
  /// Este método es crucial para la implementación del listado paginado de Pokémon en la aplicación,
  /// permitiendo una carga eficiente de datos y una navegación fluida entre páginas de resultados.
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

  /// Obtiene los detalles de un Pokémon específico por su ID.
  ///
  /// Este método implementa la funcionalidad definida en la interfaz [PokemonRepository]
  /// para recuperar información detallada de un Pokémon individual.
  ///
  /// @param id Una cadena que representa el ID único del Pokémon.
  ///
  /// @return Un [Future] que resuelve a un [PokemonModel] conteniendo todos los
  ///         detalles del Pokémon solicitado.
  ///
  /// Funcionamiento:
  /// 1. Realiza una llamada asíncrona al método correspondiente en [mPokemonDataSource].
  /// 2. Si la llamada es exitosa, devuelve el [PokemonModel] obtenido.
  /// 3. En caso de error:
  ///    - Captura la excepción y el stacktrace.
  ///    - Registra el error en la consola para depuración.
  ///    - Devuelve un [PokemonModel] vacío para evitar fallos en la aplicación.
  ///
  /// Este método es esencial para mostrar información detallada de un Pokémon
  /// específico en la interfaz de usuario, permitiendo acceder a características
  /// como estadísticas, tipos, habilidades, etc.
  ///
  /// Nota: La gestión de errores asegura que la aplicación no falle incluso si
  /// la obtención de datos no es exitosa, proporcionando una experiencia de usuario robusta.
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

  /// Obtiene la imagen de un Pokémon a partir de una URL.
  ///
  /// Este método implementa la funcionalidad definida en la interfaz [PokemonRepository]
  /// para recuperar la imagen de un Pokémon específico.
  ///
  /// @param mUrl Una cadena que representa la URL de la imagen del Pokémon.
  ///
  /// @return Un [Future] que resuelve a un [Tuple2] conteniendo:
  ///   - item1: Un booleano que indica si la obtención de la imagen fue exitosa (true) o no (false).
  ///   - item2: Un [Uint8List] que contiene los datos binarios de la imagen, o null si la obtención falló.
  ///
  /// Funcionamiento:
  /// 1. Realiza una llamada asíncrona al método correspondiente en [mPokemonDataSource].
  /// 2. Si la llamada es exitosa, devuelve el [Tuple2] con los datos de la imagen.
  /// 3. En caso de error:
  ///    - Captura la excepción y el stacktrace.
  ///    - Registra el error en la consola para depuración.
  ///    - Devuelve un [Tuple2] indicando fallo (false) y sin datos de imagen (null).
  ///
  /// Este método es crucial para cargar y mostrar imágenes de Pokémon en la interfaz de usuario,
  /// permitiendo una visualización rica y atractiva de los Pokémon en la aplicación.
  ///
  /// Nota: La gestión de errores asegura que la aplicación maneje graciosamente los casos
  /// donde la imagen no pueda ser obtenida, mejorando la robustez y la experiencia del usuario.
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
