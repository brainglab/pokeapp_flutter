import 'package:pokeapp_flutter/domain/entities/firered_leafgreen.dart';

class FireredLeafgreenModel extends FireredLeafgreen {
  FireredLeafgreenModel({
    super.backDefault,
    super.backShiny,
    super.frontDefault,
    super.frontShiny,
  });

  factory FireredLeafgreenModel.fromMap(Map<String, dynamic> json) {
    return FireredLeafgreenModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "back_default": backDefault,
      "back_shiny": backShiny,
      "front_default": frontDefault,
      "front_shiny": frontShiny,
    };
  }
}
