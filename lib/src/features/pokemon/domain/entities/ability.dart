import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';

class Ability {
  Species? ability;
  bool? isHidden;
  int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: json["ability"] == null ? null : Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability?.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}
