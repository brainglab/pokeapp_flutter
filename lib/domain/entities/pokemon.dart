import 'package:pokeapp_flutter/domain/entities/abilities.dart';
import 'package:pokeapp_flutter/domain/entities/cries.dart';
import 'package:pokeapp_flutter/domain/entities/game_indices.dart';
import 'package:pokeapp_flutter/domain/entities/held_items.dart';
import 'package:pokeapp_flutter/domain/entities/move.dart';
import 'package:pokeapp_flutter/domain/entities/species.dart';
import 'package:pokeapp_flutter/domain/entities/sprites.dart';
import 'package:pokeapp_flutter/domain/entities/stat.dart';
import 'package:pokeapp_flutter/domain/entities/p_type.dart';

/// Clase que representa la entidad Pokémon en el dominio de la aplicación.
///
/// Esta clase define la estructura básica de un Pokémon, incluyendo todas sus características
/// y atributos principales. Es una representación completa de un Pokémon que se utiliza
/// en toda la lógica de negocio de la aplicación.
///
/// Atributos principales:
/// - [abilities]: Lista de habilidades del Pokémon.
/// - [baseExperience]: Experiencia base que otorga al ser derrotado.
/// - [cries]: Sonidos o gritos característicos del Pokémon.
/// - [forms]: Diferentes formas que puede adoptar el Pokémon.
/// - [gameIndices]: Índices del Pokémon en diferentes juegos de la franquicia.
/// - [height]: Altura del Pokémon.
/// - [heldItems]: Objetos que el Pokémon puede llevar.
/// - [id]: Identificador único del Pokémon.
/// - [isDefault]: Indica si es la forma predeterminada del Pokémon.
/// - [locationAreaEncounters]: Áreas donde se puede encontrar al Pokémon.
/// - [moves]: Movimientos o ataques que puede aprender el Pokémon.
/// - [name]: Nombre del Pokémon.
/// - [order]: Orden del Pokémon en la Pokédex.
/// - [pastAbilities]: Habilidades que el Pokémon tenía en generaciones anteriores.
/// - [pastTypes]: Tipos que el Pokémon tenía en generaciones anteriores.
/// - [species]: Especie a la que pertenece el Pokémon.
/// - [sprites]: Imágenes o representaciones visuales del Pokémon.
/// - [stats]: Estadísticas base del Pokémon.
/// - [types]: Tipos elementales del Pokémon.
/// - [weight]: Peso del Pokémon.
///
/// Esta clase es fundamental para la manipulación y representación de datos de Pokémon
/// en toda la aplicación, sirviendo como base para operaciones de listado, búsqueda,
/// y visualización de información detallada de cada Pokémon.
class Pokemon {
  List<Abilities>? abilities;
  int? baseExperience;
  Cries? cries;
  List<Species>? forms;
  List<GameIndices>? gameIndices;
  int? height;
  List<HeldItems>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastAbilities;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<PType>? types;
  int? weight;

  Pokemon({
    this.abilities,
    this.baseExperience,
    this.cries,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastAbilities,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });
}
