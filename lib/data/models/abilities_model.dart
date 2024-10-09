import 'package:pokeapp_flutter/data/models/ability_model.dart';
import 'package:pokeapp_flutter/domain/entities/abilities.dart';

class AbilitiesModel extends Abilities {
  AbilitiesModel({
    super.ability,
    super.isHidden,
    super.slot,
  });

  factory AbilitiesModel.fromMap(Map<String, dynamic> json) {
    return AbilitiesModel(
      ability: AbilityModel.fromMap(json["ability"]),
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }
}
