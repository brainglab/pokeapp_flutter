import 'package:pokeapp_flutter/domain/entities/generation_vii_icons.dart';

class GenerationViiIconsModel extends GenerationViiIcons {
  GenerationViiIconsModel({
    super.frontDefault,
    super.frontFemale,
  });

  factory GenerationViiIconsModel.fromMap(Map<String, dynamic> json) {
    return GenerationViiIconsModel(
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
