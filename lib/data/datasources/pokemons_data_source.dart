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
/// implementados por cualquier fuente de datos concreta, como una API remota
/// o una base de datos local.
///
/// Métodos definidos:
/// - [getPokemons]: Obtiene una lista paginada de Pokémon.
/// - [getPokemonForId]: Obtiene los detalles de un Pokémon específico por su ID.
/// - [getPokemonImage]: Obtiene la imagen de un Pokémon.
///
/// Beneficios:
/// - Facilita la implementación de diferentes fuentes de datos.
/// - Permite una fácil sustitución o modificación de la fuente de datos.
/// - Mantiene una separación clara entre la lógica de obtención de datos y el resto de la aplicación.
/// - Mejora la modularidad y facilita las pruebas unitarias.
/// - Proporciona una estructura consistente para manejar datos de Pokémon en toda la aplicación.
///
/// Esta abstracción es fundamental para mantener un diseño flexible y escalable,
/// permitiendo adaptar fácilmente la aplicación a diferentes orígenes de datos en el futuro.
abstract class PokemonDataSource {
  Future<Tuple3<bool, List<PokemonModel>, String?>> getPokemons(String mParameters);
  Future<Tuple2<bool, PokemonModel?>> getPokemonForId(String mId);
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
///   e imágenes de Pokémon.
/// - Maneja la paginación de resultados al obtener listas de Pokémon.
/// - Procesa las respuestas JSON de la API y las convierte en modelos de datos utilizables.
/// - Gestiona errores y excepciones durante las solicitudes HTTP.
/// - Optimiza el rendimiento mediante el uso eficiente de recursos de red.
///
/// Esta clase es fundamental para la capa de datos de la aplicación, actuando como
/// intermediario entre la API externa de Pokémon y la lógica de negocio de la aplicación.
/// Proporciona una abstracción robusta que facilita la escalabilidad y el mantenimiento
/// del código relacionado con la obtención de datos de Pokémon.
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
  /// @return Un [Future] que resuelve a un [Tuple3] conteniendo:
  ///   - item1: Un booleano que indica si la operación fue exitosa (true) o no (false).
  ///   - item2: Una lista de [PokemonModel] representando los Pokémon obtenidos.
  ///   - item3: Una cadena con los parámetros para la siguiente página de resultados.
  ///            Será null si no hay más resultados.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// try {
  ///   final resultado = await getPokemons('limit=20&offset=0');
  ///   if (resultado.item1) {
  ///     final listaPokemon = resultado.item2;
  ///     final parametrosSiguientePagina = resultado.item3;
  ///     // Usar listaPokemon y parametrosSiguientePagina
  ///   } else {
  ///     print('No se pudieron obtener los Pokémon');
  ///   }
  /// } catch (e) {
  ///   print('Error al obtener Pokémon: $e');
  /// }
  /// ```
  ///
  /// Nota: Este método construye la URL de la solicitud utilizando los parámetros
  /// proporcionados y las constantes definidas en [BlEndpoint]. Si ocurre un error,
  /// se imprime en la consola y se devuelve un Tuple3 con false, una lista vacía y una cadena vacía.
  @override
  Future<Tuple3<bool, List<PokemonModel>, String?>> getPokemons(String mParameters) async {
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
      return Tuple3<bool, List<PokemonModel>, String?>(true, PokemonModel.fromJsonList(mResponse.data['results']), mNextParams);
    } catch (e, stackTrace) {
      debugPrint('==> $runtimeType error: $e, stackTrace: $stackTrace');
      return const Tuple3<bool, List<PokemonModel>, String?>(false, [], '');
    }
  }

  /// Obtiene los detalles de un Pokémon específico por su ID.
  ///
  /// Este método realiza una solicitud a la API de Pokémon para obtener información
  /// detallada de un Pokémon específico utilizando su ID único.
  ///
  /// @param id Una cadena que representa el ID único del Pokémon.
  ///
  /// @return Un [Future] que resuelve a un [Tuple2] conteniendo:
  ///   - item1: Un booleano que indica si la operación fue exitosa (true) o no (false).
  ///   - item2: Un [PokemonModel] que contiene todos los detalles del Pokémon solicitado,
  ///            o un modelo vacío si la operación falló.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final resultado = await getPokemonForId('25'); // Obtiene detalles de Pikachu
  /// if (resultado.item1) {
  ///   final pokemonDetallado = resultado.item2;
  ///   // Usar pokemonDetallado
  /// } else {
  ///   print('No se pudo obtener los detalles del Pokémon');
  /// }
  /// ```
  ///
  /// Nota: Este método construye la URL de la solicitud utilizando el ID proporcionado
  /// y las constantes definidas en [BlEndpoint]. La respuesta se procesa y se convierte
  /// en un objeto [PokemonModel]. Si ocurre un error durante la solicitud o el procesamiento,
  /// se registra en la consola y se devuelve un Tuple2 con false y un modelo vacío.
  @override
  Future<Tuple2<bool, PokemonModel>> getPokemonForId(String id) async {
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
        return Tuple2<bool, PokemonModel>(true, PokemonModel.fromMap(mResponse.data));
      } else {
        return Tuple2<bool, PokemonModel>(false, PokemonModel());
      }
    } catch (mError, mStackTrace) {
      debugPrint('==> $runtimeType error: $mError, stackTrace: $mStackTrace');
      return Tuple2<bool, PokemonModel>(false, PokemonModel());
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
  /// Ejemplo de uso:
  /// ```dart
  /// final mResultado = await mPokemonDataSource.getPokemonImage('https://ejemplo.com/imagen_pokemon.png');
  /// if (mResultado.item1) {
  ///   // La descarga fue exitosa, usar mResultado.item2 para acceder a los bytes de la imagen
  ///   final mImagenBytes = mResultado.item2;
  ///   // Usar mImagenBytes para mostrar la imagen
  /// } else {
  ///   // Hubo un error en la descarga
  ///   customShowToast('No se pudo cargar la imagen del Pokémon');
  /// }
  /// ```
  ///
  /// Nota: Este método utiliza [mDioImage] para realizar la solicitud HTTP y está configurado
  /// para manejar respuestas de tipo bytes. Los errores se capturan y se registran para depuración.
  /// En caso de error, se devuelve un Tuple2 con false y null, permitiendo un manejo gracioso del fallo.
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
