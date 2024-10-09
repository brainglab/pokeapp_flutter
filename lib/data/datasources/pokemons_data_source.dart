import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/data/helpers/bl_dio.dart';
import 'package:pokeapp_flutter/data/helpers/bl_endpoint.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:tuple/tuple.dart';

/// Clase abstracta que define la interfaz para la fuente de datos de Pokémon.
///
/// Esta clase abstracta establece el contrato para las operaciones relacionadas
/// con la obtención de datos de Pokémon. Define los métodos que deben ser
/// implementados por cualquier fuente de datos concreta, ya sea una API remota,
/// una base de datos local, o cualquier otra fuente.
///
/// Métodos definidos:
/// - [getPokemons]: Obtiene una lista paginada de Pokémon.
/// - [getPokemonForId]: Obtiene los detalles de un Pokémon específico por su ID.
/// - [getPokemonImage]: Obtiene la imagen de un Pokémon.
///
/// Al utilizar esta interfaz, se facilita la implementación de diferentes
/// fuentes de datos y se permite una fácil sustitución o modificación de la
/// fuente de datos sin afectar al resto del código de la aplicación.
///
/// Esta abstracción es crucial para mantener una separación clara entre
/// la lógica de obtención de datos y el resto de la lógica de la aplicación,
/// lo que mejora la modularidad y facilita las pruebas unitarias.
abstract class PokemonDataSource {
  Future<Tuple2<List<PokemonModel>, String?>> getPokemons(String mParameters);
  Future<PokemonModel> getPokemonForId(String id);
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mUrl);
}

/// Implementación concreta de la fuente de datos de Pokémon.
///
/// Esta clase proporciona la implementación real de los métodos definidos
/// en la interfaz [PokemonDataSource]. Se encarga de realizar las solicitudes
/// HTTP a la API de Pokémon y procesar las respuestas.
///
/// Características principales:
/// - Utiliza instancias de [Dio] para realizar solicitudes HTTP.
/// - Implementa métodos para obtener listas de Pokémon, detalles de Pokémon individuales,
///   y imágenes de Pokémon.
/// - Maneja la paginación de resultados al obtener listas de Pokémon.
/// - Procesa las respuestas JSON de la API y las convierte en modelos de datos utilizables.
///
/// Esta clase es fundamental para la capa de datos de la aplicación, actuando como
/// intermediario entre la API externa de Pokémon y la lógica de negocio de la aplicación.
class PokemonDataSourceImpl implements PokemonDataSource {
  final Dio mDio = getDio();
  final Dio mDioImage = getDioImage();

  /// Obtiene una lista de Pokémon y los parámetros para la siguiente página.
  ///
  /// Este método realiza una solicitud a la API de Pokémon para obtener una lista
  /// paginada de Pokémon. Utiliza los parámetros proporcionados para la consulta.
  ///
  /// @param mParameters Una cadena que contiene los parámetros de consulta (por ejemplo, 'limit=20&offset=0').
  ///                    Si está vacía, se utilizará una consulta sin parámetros.
  ///
  /// @return Un [Future] que resuelve a un [Tuple2] conteniendo:
  ///   - item1: Una lista de [PokemonModel] representando los Pokémon obtenidos.
  ///   - item2: Una cadena con los parámetros para la siguiente página de resultados.
  ///            Será null si no hay más resultados.
  ///
  /// @throws [Exception] Si ocurre un error durante la solicitud HTTP o al procesar la respuesta.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// try {
  ///   final resultado = await getPokemons('limit=20&offset=0');
  ///   final listaPokemon = resultado.item1;
  ///   final parametrosSiguientePagina = resultado.item2;
  ///   // Usar listaPokemon y parametrosSiguientePagina
  /// } catch (e) {
  ///   print('Error al obtener Pokémon: $e');
  /// }
  /// ```
  ///
  /// Nota: Este método construye la URL de la solicitud utilizando los parámetros
  /// proporcionados y las constantes definidas en [BlEndpoint]. Si ocurre un error,
  /// se imprime en la consola y se devuelve una lista vacía con parámetros nulos.
  @override
  Future<Tuple2<List<PokemonModel>, String>> getPokemons(String mParameters) async {
    var mAuxParameters = mParameters.isNotEmpty ? mParameters : '';
    try {
      final mUrl = Uri(
        scheme: BlEndpoint.mWebServiceScheme,
        host: BlEndpoint.mWebServiceURL,
        port: BlEndpoint.mWebServicePort,
        path: '/api/v2/pokemon',
        query: mAuxParameters,
      );
      final mResponse = await mDio.get(mUrl.toString());
      String mNextUrl = mResponse.data['next'] ?? '';
      String mNextParams = mNextUrl.contains('?') ? mNextUrl.split('?')[1] : '';
      return Tuple2<List<PokemonModel>, String>(PokemonModel.fromJsonList(mResponse.data['results']), mNextParams);
    } catch (e, stackTrace) {
      debugPrint('==> $runtimeType error: $e, stackTrace: $stackTrace');
      return const Tuple2<List<PokemonModel>, String>([], '');
    }
  }

  /// Obtiene los detalles de un Pokémon específico por su ID.
  ///
  /// Este método realiza una solicitud a la API de Pokémon para obtener información
  /// detallada de un Pokémon específico utilizando su ID único.
  ///
  /// @param id Una cadena que representa el ID único del Pokémon.
  ///
  /// @return Un [Future] que resuelve a un [PokemonModel] que contiene todos los
  ///         detalles del Pokémon solicitado.
  ///
  /// @throws [Exception] Si ocurre un error durante la solicitud HTTP o al procesar la respuesta.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// try {
  ///   final pokemonDetallado = await getPokemonForId('25'); // Obtiene detalles de Pikachu
  ///   // Usar pokemonDetallado
  /// } catch (e) {
  ///   print('Error al obtener detalles del Pokémon: $e');
  /// }
  /// ```
  ///
  /// Nota: Este método construye la URL de la solicitud utilizando el ID proporcionado
  /// y las constantes definidas en [BlEndpoint]. La respuesta se procesa y se convierte
  /// en un objeto [PokemonModel] para un fácil manejo de los datos. Si la solicitud falla
  /// o la respuesta no es válida, se lanza una excepción con un mensaje descriptivo.
  @override
  Future<PokemonModel> getPokemonForId(String id) async {
    try {
      final mUrl = Uri(
        scheme: BlEndpoint.mWebServiceScheme,
        host: BlEndpoint.mWebServiceURL,
        port: BlEndpoint.mWebServicePort,
        path: '/api/v2/pokemon/$id',
      );
      final mResponse = await mDio.get(mUrl.toString());
      debugPrint('==> $runtimeType respuesta: $mResponse');

      if (mResponse.statusCode == 200) {
        return PokemonModel.fromMap(mResponse.data);
      } else {
        throw Exception('Error al obtener datos del Pokémon: ${mResponse.statusCode}');
      }
    } catch (mError, mStackTrace) {
      debugPrint('==> $runtimeType error: $mError, stackTrace: $mStackTrace');
      throw Exception('Error al obtener datos del Pokémon: $mError');
    }
  }

  /// Obtiene la imagen de un Pokémon a partir de una URL proporcionada.
  ///
  /// Este método realiza una solicitud HTTP para descargar la imagen de un Pokémon
  /// utilizando la URL proporcionada. La imagen se devuelve como un array de bytes.
  ///
  /// @param mAuxUrl Una cadena que representa la URL de la imagen del Pokémon.
  ///
  /// @return Un [Future] que resuelve a un [Tuple2] donde:
  ///   - El primer elemento es un [bool] que indica si la descarga fue exitosa (true) o no (false).
  ///   - El segundo elemento es un [Uint8List] que contiene los bytes de la imagen si la descarga fue exitosa,
  ///     o null si hubo un error.
  ///
  /// @throws No lanza excepciones directamente, pero captura y maneja internamente cualquier error que pueda ocurrir.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final resultado = await getPokemonImage('https://ejemplo.com/imagen_pokemon.png');
  /// if (resultado.item1) {
  ///   // La descarga fue exitosa, usar resultado.item2 para acceder a los bytes de la imagen
  /// } else {
  ///   // Hubo un error en la descarga
  /// }
  /// ```
  ///
  /// Nota: Este método utiliza [mDioImage] para realizar la solicitud HTTP y está configurado
  /// para manejar respuestas de tipo bytes. Los errores se capturan y se registran para depuración.
  @override
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mAuxUrl) async {
    final mUrl = Uri.parse(mAuxUrl);
    debugPrint('==> $runtimeType mUrl: $mUrl');
    try {
      final response = await mDioImage.get(
        mUrl.toString(),
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        return Tuple2<bool, Uint8List?>(true, response.data as Uint8List);
      } else {
        return const Tuple2<bool, Uint8List?>(false, null);
      }
    } catch (e, stackTrace) {
      debugPrint('==> $runtimeType error: $e, stackTrace: $stackTrace');
      return const Tuple2<bool, Uint8List?>(false, null);
    }
  }
}
