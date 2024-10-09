import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';
import 'package:tuple/tuple.dart';

/// Caso de uso para obtener una lista paginada de Pokémon.
///
/// Esta clase implementa la lógica de negocio para recuperar una lista de Pokémon
/// utilizando parámetros de paginación.
///
/// Características principales:
/// - Encapsula la lógica de obtención de datos de múltiples Pokémon.
/// - Utiliza el [PokemonRepository] para acceder a los datos.
/// - Proporciona una interfaz simple para su uso en la capa de presentación.
///
/// Uso típico:
/// ```dart
/// final useCase = GetPokemonsUseCase(pokemonRepository: myRepository);
/// final result = await useCase.call('limit=20&offset=0');
/// ```
///
/// Esta clase es fundamental en la arquitectura de la aplicación, ya que:
/// 1. Separa la lógica de negocio de la implementación de datos.
/// 2. Facilita la prueba unitaria de esta funcionalidad específica.
/// 3. Permite una fácil reutilización en diferentes partes de la aplicación.
///
/// @param pokemonRepository Una instancia de [PokemonRepository] utilizada para acceder a los datos.
class GetPokemonsUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonsUseCase({required this.pokemonRepository});

  /// Ejecuta el caso de uso para obtener una lista paginada de Pokémon.
  ///
  /// Este método asíncrono es el punto de entrada principal para obtener
  /// una lista de Pokémon utilizando parámetros de paginación.
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
  /// 1. Recibe los parámetros de paginación como una cadena.
  /// 2. Utiliza el [pokemonRepository] para realizar la solicitud de datos.
  /// 3. Espera de forma asíncrona la respuesta del repositorio.
  /// 4. Retorna la tupla con la lista de Pokémon y la información de la siguiente página.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final parameters = 'limit=20&offset=0';
  /// final result = await getPokemonsUseCase.call(parameters);
  /// final pokemonList = result.item1;
  /// final nextPageParams = result.item2;
  /// ```
  ///
  /// Nota: Este método maneja la lógica de negocio para obtener una lista paginada de Pokémon,
  /// abstrayendo los detalles de implementación del repositorio y proporcionando
  /// una interfaz limpia para la capa de presentación.
  Future<Tuple2<List<PokemonModel>, String?>> call(String mParameters) async {
    return await pokemonRepository.getPokemons(mParameters);
  }
}
