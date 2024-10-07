import 'package:pokeapp_flutter/domain/entities/gold.dart';

class GoldModel extends Gold {
  GoldModel({
    super.backDefault,
    super.backShiny,
    super.frontDefault,
    super.frontShiny,
    super.frontTransparent,
  });

  factory GoldModel.fromMap(Map<String, dynamic> json) {
    return GoldModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      frontTransparent: json["front_transparent"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "back_default": backDefault,
      "back_shiny": backShiny,
      "front_default": frontDefault,
      "front_shiny": frontShiny,
      "front_transparent": frontTransparent,
    };
  }
}
