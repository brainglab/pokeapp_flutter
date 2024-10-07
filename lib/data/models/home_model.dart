import 'package:pokeapp_flutter/domain/entities/home.dart';

class HomeModel extends Home {
  HomeModel({
    super.frontDefault,
    super.frontFemale,
    super.frontShiny,
    super.frontShinyFemale,
  });

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "front_default": frontDefault,
      "front_female": frontFemale,
      "front_shiny": frontShiny,
      "front_shiny_female": frontShinyFemale,
    };
  }
}
