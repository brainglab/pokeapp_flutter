// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/ability.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/cries.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/game_indices.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/held_items.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/move.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/sprites.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/stat.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/type.dart';

Pokemon pokemonFromMap(String str) => Pokemon.fromMap(json.decode(str));

String pokemonToMap(Pokemon data) => json.encode(data.toMap());

class Pokemon {
  List<Ability>? abilities;
  int? baseExperience;
  Cries? cries;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<HeldItem>? heldItems;
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

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        cries: json["cries"] == null ? null : Cries.fromMap(json["cries"]),
        forms: json["forms"] == null ? [] : List<Species>.from(json["forms"]!.map((x) => Species.fromMap(x))),
        gameIndices: json["game_indices"] == null ? [] : List<GameIndex>.from(json["game_indices"]!.map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: json["held_items"] == null ? [] : List<HeldItem>.from(json["held_items"]!.map((x) => HeldItem.fromMap(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null ? [] : List<Move>.from(json["moves"]!.map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: json["past_abilities"] == null ? [] : List<dynamic>.from(json["past_abilities"]!.map((x) => x)),
        pastTypes: json["past_types"] == null ? [] : List<dynamic>.from(json["past_types"]!.map((x) => x)),
        species: json["species"] == null ? null : Species.fromMap(json["species"]),
        sprites: json["sprites"] == null ? null : Sprites.fromMap(json["sprites"]),
        stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"]!.map((x) => Stat.fromMap(x))),
        types: json["types"] == null ? [] : List<PType>.from(json["types"]!.map((x) => PType.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "cries": cries?.toMap(),
        "forms": forms == null ? [] : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "game_indices": gameIndices == null ? [] : List<dynamic>.from(gameIndices!.map((x) => x.toMap())),
        "height": height,
        "held_items": heldItems == null ? [] : List<dynamic>.from(heldItems!.map((x) => x.toMap())),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_abilities": pastAbilities == null ? [] : List<dynamic>.from(pastAbilities!.map((x) => x)),
        "past_types": pastTypes == null ? [] : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species?.toMap(),
        "sprites": sprites?.toMap(),
        "stats": stats == null ? [] : List<dynamic>.from(stats!.map((x) => x.toMap())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x.toMap())),
        "weight": weight,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
