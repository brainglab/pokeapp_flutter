import 'package:pokeapp_flutter/domain/entities/crystal.dart';

class CrystalModel extends Crystal {
  CrystalModel({
    super.backDefault,
    super.backShiny,
    super.backShinyTransparent,
    super.backTransparent,
    super.frontDefault,
    super.frontShiny,
    super.frontShinyTransparent,
    super.frontTransparent,
  });

  factory CrystalModel.fromMap(Map<String, dynamic> json) {
    return CrystalModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      backShinyTransparent: json["back_shiny_transparent"],
      backTransparent: json["back_transparent"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      frontShinyTransparent: json["front_shiny_transparent"],
      frontTransparent: json["front_transparent"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "back_default": backDefault,
      "back_shiny": backShiny,
      "back_shiny_transparent": backShinyTransparent,
      "back_transparent": backTransparent,
      "front_default": frontDefault,
      "front_shiny": frontShiny,
      "front_shiny_transparent": frontShinyTransparent,
      "front_transparent": frontTransparent,
    };
  }
}
