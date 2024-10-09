import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/domain/repositories/pokemon_repository.dart';

/// Caso de uso para obtener los detalles de un Pokémon específico por su ID.
///
/// Esta clase implementa la lógica de negocio para recuperar información detallada
/// de un Pokémon individual utilizando su identificador único.
///
/// Características principales:
/// - Encapsula la lógica de obtención de datos de un Pokémon específico.
/// - Utiliza el [PokemonRepository] para acceder a los datos.
/// - Proporciona una interfaz simple para su uso en la capa de presentación.
///
/// Uso típico:
/// ```dart
/// final useCase = GetPokemonForIdUseCase(pokemonRepository: myRepository);
/// final pokemon = await useCase.call('25'); // Obtiene los detalles de Pikachu (ID 25)
/// ```
///
/// Esta clase es fundamental en la arquitectura de la aplicación, ya que:
/// 1. Separa la lógica de negocio de la implementación de datos.
/// 2. Facilita la prueba unitaria de esta funcionalidad específica.
/// 3. Permite una fácil reutilización en diferentes partes de la aplicación.
///
/// @param pokemonRepository Una instancia de [PokemonRepository] utilizada para acceder a los datos.
class GetPokemonForIdUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonForIdUseCase({required this.pokemonRepository});

  /// Ejecuta el caso de uso para obtener un Pokémon por su ID.
  ///
  /// Este método asíncrono es el punto de entrada principal para obtener
  /// información detallada de un Pokémon específico utilizando su identificador único.
  ///
  /// @param id Una cadena que representa el ID único del Pokémon a buscar.
  ///           Debe ser un valor válido correspondiente a un Pokémon existente.
  ///
  /// @return Un [Future] que resuelve a un objeto [Pokemon] conteniendo
  ///         todos los detalles del Pokémon solicitado.
  ///
  /// Funcionamiento:
  /// 1. Recibe el ID del Pokémon como parámetro.
  /// 2. Utiliza el [pokemonRepository] para realizar la solicitud de datos.
  /// 3. Espera de forma asíncrona la respuesta del repositorio.
  /// 4. Retorna el objeto [Pokemon] obtenido.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final pokemonId = '25'; // ID de Pikachu
  /// final pokemon = await getPokemonForIdUseCase.call(pokemonId);
  /// print(pokemon.name); // Imprime: Pikachu
  /// ```
  ///
  /// Nota: Este método maneja la lógica de negocio para obtener un Pokémon,
  /// abstrayendo los detalles de implementación del repositorio y proporcionando
  /// una interfaz limpia para la capa de presentación.
  Future<Pokemon> call(String id) async {
    return await pokemonRepository.getPokemonForId(id);
  }
}
