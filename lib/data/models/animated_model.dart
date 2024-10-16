import 'package:pokeapp_flutter/domain/entities/animated.dart';

class AnimatedModel extends Animated {
  AnimatedModel({
    super.backDefault,
    super.backFemale,
    super.backShiny,
    super.backShinyFemale,
    super.frontDefault,
    super.frontFemale,
    super.frontShiny,
    super.frontShinyFemale,
  });

  factory AnimatedModel.fromMap(Map<String, dynamic> json) {
    return AnimatedModel(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
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
    };
  }
}
