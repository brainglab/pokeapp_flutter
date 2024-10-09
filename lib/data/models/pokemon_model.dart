import 'package:pokeapp_flutter/data/models/abilities_model.dart';
import 'package:pokeapp_flutter/data/models/cries_model.dart';
import 'package:pokeapp_flutter/data/models/game_indices_model.dart';
import 'package:pokeapp_flutter/data/models/held_items_model.dart';
import 'package:pokeapp_flutter/data/models/move_model.dart';
import 'package:pokeapp_flutter/data/models/p_type_model.dart';
import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/data/models/sprites_model.dart';
import 'package:pokeapp_flutter/data/models/stat_model.dart';
import 'package:pokeapp_flutter/domain/entities/abilities.dart';
import 'package:pokeapp_flutter/domain/entities/game_indices.dart';
import 'package:pokeapp_flutter/domain/entities/held_items.dart';
import 'package:pokeapp_flutter/domain/entities/move.dart';
import 'package:pokeapp_flutter/domain/entities/p_type.dart';
import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/domain/entities/species.dart';
import 'package:pokeapp_flutter/domain/entities/stat.dart';

/// Modelo que representa un Pokémon en la aplicación.
///
/// Esta clase extiende la entidad base [Pokemon] y proporciona funcionalidad
/// adicional para la capa de datos, incluyendo métodos de serialización y
/// deserialización.
///
/// Características principales:
/// - Hereda todos los atributos y métodos de la clase [Pokemon].
/// - Implementa métodos para crear instancias a partir de mapas JSON.
/// - Facilita la conversión entre la representación de datos y la entidad de dominio.
///
/// Uso típico:
/// ```dart
/// final pokemonData = {'id': 1, 'name': 'Bulbasaur', ...};
/// final pokemonModel = PokemonModel.fromMap(pokemonData);
/// ```
///
/// Esta clase es fundamental para la capa de datos, actuando como puente
/// entre los datos crudos (por ejemplo, respuestas JSON de una API) y
/// las entidades de dominio utilizadas en la lógica de negocio de la aplicación.
class PokemonModel extends Pokemon {
  PokemonModel({
    super.abilities,
    super.baseExperience,
    super.cries,
    super.forms,
    super.gameIndices,
    super.height,
    super.heldItems,
    super.id,
    super.isDefault,
    super.locationAreaEncounters,
    super.moves,
    super.name,
    super.order,
    super.pastAbilities,
    super.pastTypes,
    super.species,
    super.sprites,
    super.stats,
    super.types,
    super.weight,
  });

  /// Convierte una lista de objetos JSON en una lista de modelos PokemonModel.
  ///
  /// Este método estático toma una lista de objetos dinámicos (típicamente provenientes
  /// de una respuesta JSON) y los convierte en una lista de instancias de PokemonModel.
  ///
  /// @param jsonList Una lista de objetos dinámicos que representan Pokémon en formato JSON.
  ///                 Puede ser nula o vacía.
  ///
  /// @return Una lista de PokemonModel. Si la entrada es nula o vacía, se devuelve una lista vacía.
  ///
  /// Funcionamiento:
  /// 1. Inicializa una lista vacía de PokemonModel.
  /// 2. Verifica si la lista de entrada es nula o vacía.
  /// 3. Si es válida, itera sobre cada elemento de la lista.
  /// 4. Para cada elemento, crea un nuevo PokemonModel usando el método fromMap.
  /// 5. Añade cada modelo creado a la lista de resultados.
  ///
  /// Este método es útil para procesar respuestas de API que devuelven listas de Pokémon,
  /// facilitando la conversión de datos crudos a objetos utilizables en la aplicación.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final jsonData = [{'name': 'Pikachu', 'id': 25}, {'name': 'Charizard', 'id': 6}];
  /// final pokemonList = PokemonModel.fromJsonList(jsonData);
  /// ```
  static List<PokemonModel> fromJsonList(List<dynamic>? jsonList) {
    List<PokemonModel> items = [];
    if (jsonList == null || jsonList.isEmpty) {
      items = [];
    } else {
      for (var item in jsonList) {
        final mPokemonModel = PokemonModel.fromMap(item);
        items.add(mPokemonModel);
      }
    }

    return items;
  }

  /// Crea una instancia de PokemonModel a partir de un mapa de datos JSON.
  ///
  /// Este método de fábrica convierte un mapa de datos JSON en un objeto PokemonModel.
  /// Es crucial para deserializar los datos recibidos de la API de Pokémon.
  ///
  /// @param json Un mapa de tipo <String, dynamic> que contiene los datos del Pokémon.
  ///
  /// @return Una nueva instancia de PokemonModel con los datos proporcionados.
  ///
  /// Funcionamiento:
  /// - Procesa cada campo del JSON, convirtiéndolo al tipo de dato apropiado.
  /// - Maneja casos donde ciertos campos pueden ser nulos o requerir conversión especial.
  /// - Utiliza métodos fromMap de modelos relacionados para campos complejos.
  /// - Para el campo 'id', si no está presente, lo extrae de la URL del Pokémon.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final jsonData = {'name': 'Pikachu', 'id': 25, ...};
  /// final pokemon = PokemonModel.fromMap(jsonData);
  /// ```
  ///
  /// Nota: Este método es esencial para la capa de datos de la aplicación,
  /// permitiendo una fácil conversión de datos crudos a objetos de modelo.
  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      abilities: json["abilities"] == null ? [] : List<Abilities>.from(json["abilities"]!.map((x) => AbilitiesModel.fromMap(x))),
      baseExperience: json["base_experience"],
      cries: json["cries"] == null ? null : CriesModel.fromMap(json["cries"]),
      forms: json["forms"] == null ? [] : List<Species>.from(json["forms"]!.map((x) => SpeciesModel.fromMap(x))),
      gameIndices: json["game_indices"] == null ? [] : List<GameIndices>.from(json["game_indices"]!.map((x) => GameIndicesModel.fromMap(x))),
      height: json["height"],
      heldItems: json["held_items"] == null ? [] : List<HeldItems>.from(json["held_items"]!.map((x) => HeldItemsModel.fromMap(x))),
      id: json["id"] ?? int.parse(json["url"].split('/').reversed.skip(1).first),
      isDefault: json["is_default"],
      locationAreaEncounters: json["location_area_encounters"],
      moves: json["moves"] == null ? [] : List<Move>.from(json["moves"]!.map((x) => MoveModel.fromMap(x))),
      name: json["name"],
      order: json["order"],
      pastAbilities: json["past_abilities"] == null ? [] : List<dynamic>.from(json["past_abilities"]!.map((x) => x)),
      pastTypes: json["past_types"] == null ? [] : List<dynamic>.from(json["past_types"]!.map((x) => x)),
      species: json["species"] == null ? null : SpeciesModel.fromMap(json["species"]),
      sprites: json["sprites"] == null ? null : SpritesModel.fromMap(json["sprites"]),
      stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"]!.map((x) => StatModel.fromMap(x))),
      types: json["types"] == null ? [] : List<PType>.from(json["types"]!.map((x) => PTypeModel.fromMap(x))),
      weight: json["weight"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toMap())),
      // "base_experience": baseExperience,
      // "cries": cries?.toMap(),
      // "forms": forms == null ? [] : List<dynamic>.from(forms!.map((x) => x.toMap())),
      // "game_indices": gameIndices == null ? [] : List<dynamic>.from(gameIndices!.map((x) => x.toMap())),
      // "height": height,
      // "held_items": heldItems == null ? [] : List<dynamic>.from(heldItems!.map((x) => x.toMap())),
      // "id": id,
      // "is_default": isDefault,
      // "location_area_encounters": locationAreaEncounters,
      // "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toMap())),
      // "name": name,
      // "order": order,
      // "past_abilities": pastAbilities == null ? [] : List<dynamic>.from(pastAbilities!.map((x) => x)),
      // "past_types": pastTypes == null ? [] : List<dynamic>.from(pastTypes!.map((x) => x)),
      // "species": species?.toMap(),
      // "sprites": sprites?.toMap(),
      // "stats": stats == null ? [] : List<dynamic>.from(stats!.map((x) => x.toMap())),
      // "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x.toMap())),
      // "weight": weight,
    };
  }
}
