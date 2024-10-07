import 'package:pokeapp_flutter/data/models/other_model.dart';
import 'package:pokeapp_flutter/data/models/versions_model.dart';
import 'package:pokeapp_flutter/domain/entities/sprites.dart';

class SpritesModel extends Sprites {
  SpritesModel({
    super.backDefault,
    super.backFemale,
    super.backShiny,
    super.backShinyFemale,
    super.frontDefault,
    super.frontFemale,
    super.frontShiny,
    super.frontShinyFemale,
    super.other,
    super.versions,
  });

  factory SpritesModel.fromMap(Map<String, dynamic> json) {
    return SpritesModel(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
      other: json["other"] == null ? null : OtherModel.fromMap(json["other"]),
      versions: json["versions"] == null ? null : VersionsModel.fromMap(json["versions"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "back_default": backDefault,
      "back_female": backFemale,
      "back_shiny": backShiny,
      "back_shiny_female": backShinyFemale,
      "front_default": frontDefault,
      "front_female": frontFemale,
      "front_shiny": frontShiny,
      "front_shiny_female": frontShinyFemale,
      // "other": other?.toMap(),
      // "versions": versions?.toMap(),
    };
  }
}
