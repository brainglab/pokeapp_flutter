import 'package:pokeapp_flutter/domain/entities/dream_world.dart';

class DreamWorldModel extends DreamWorld {
  DreamWorldModel({
    super.frontDefault,
    super.frontFemale,
  });

  factory DreamWorldModel.fromMap(Map<String, dynamic> json) {
    return DreamWorldModel(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "front_default": frontDefault,
      "front_female": frontFemale,
    };
  }
}
