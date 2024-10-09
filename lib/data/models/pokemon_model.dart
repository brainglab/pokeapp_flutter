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
