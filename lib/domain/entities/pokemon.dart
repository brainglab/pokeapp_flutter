import 'package:pokeapp_flutter/domain/entities/ability.dart';
import 'package:pokeapp_flutter/domain/entities/cries.dart';
import 'package:pokeapp_flutter/domain/entities/game_indices.dart';
import 'package:pokeapp_flutter/domain/entities/held_items.dart';
import 'package:pokeapp_flutter/domain/entities/move.dart';
import 'package:pokeapp_flutter/domain/entities/species.dart';
import 'package:pokeapp_flutter/domain/entities/sprites.dart';
import 'package:pokeapp_flutter/domain/entities/stat.dart';
import 'package:pokeapp_flutter/domain/entities/p_type.dart';

class Pokemon {
  List<Ability>? abilities;
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
