import 'package:pokeapp_flutter/domain/entities/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    super.isHidden,
    super.slot,
  });

  factory AbilityModel.fromMap(Map<String, dynamic> json) {
    return AbilityModel(
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "is_hidden": isHidden,
      "slot": slot,
    };
  }
}
