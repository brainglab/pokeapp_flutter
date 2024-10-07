import 'package:pokeapp_flutter/domain/entities/generation_viii_icons.dart';

class GenerationViiiIconsModel extends GenerationViiiIcons {
  GenerationViiiIconsModel({
    super.frontDefault,
    super.frontFemale,
  });

  factory GenerationViiiIconsModel.fromMap(Map<String, dynamic> json) {
    return GenerationViiiIconsModel(
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
