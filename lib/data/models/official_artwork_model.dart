import 'package:pokeapp_flutter/domain/entities/official_artwork.dart';

class OfficialArtworkModel extends OfficialArtwork {
  OfficialArtworkModel({
    super.frontDefault,
    super.frontShiny,
  });

  factory OfficialArtworkModel.fromMap(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "front_default": frontDefault,
      "front_shiny": frontShiny,
    };
  }
}
