import 'dart:typed_data';

import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:tuple/tuple.dart';

/// Repositorio abstracto para la gestión de datos de Pokémon.
///
/// Esta clase define la interfaz para acceder y manipular datos relacionados con Pokémon
/// en la aplicación. Actúa como una capa de abstracción entre la lógica de negocio y
/// la fuente de datos, permitiendo una implementación flexible y desacoplada.
///
/// Características principales:
/// - Define métodos para obtener listas de Pokémon, detalles individuales e imágenes.
/// - Utiliza tipos genéricos y estructuras de datos complejas para manejar respuestas variadas.
/// - Permite la implementación de diferentes fuentes de datos (API, base de datos local, etc.)
///   sin afectar la lógica de negocio.
///
/// Métodos definidos:
/// - [getPokemons]: Obtiene una lista paginada de Pokémon.
/// - [getPokemonForId]: Recupera los detalles de un Pokémon específico por su ID.
/// - [getPokemonImage]: Obtiene la imagen de un Pokémon.
///
/// Esta interfaz es crucial para mantener una arquitectura limpia y facilitar
/// pruebas unitarias, ya que permite la creación de implementaciones simuladas (mocks)
/// para pruebas y desarrollo.
///
/// Implementaciones concretas de esta interfaz deben manejar la lógica específica
/// de acceso a datos, como llamadas a API, consultas a bases de datos, o cualquier
/// otra fuente de información de Pokémon.
abstract class PokemonRepository {
  Future<Tuple2<List<PokemonModel>, String?>> getPokemons(String mParameters);
  Future<PokemonModel> getPokemonForId(String id);
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mUrl);
}
