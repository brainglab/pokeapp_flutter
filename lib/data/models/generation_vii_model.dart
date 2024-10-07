import 'package:pokeapp_flutter/data/models/generation_vii_icons_model.dart';
import 'package:pokeapp_flutter/data/models/home_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_vii.dart';

class GenerationViiModel extends GenerationVii {
  GenerationViiModel({
    super.icons,
    super.ultraSunUltraMoon,
  });

  factory GenerationViiModel.fromMap(Map<String, dynamic> json) {
    return GenerationViiModel(
      icons: json["icons"] == null ? null : GenerationViiIconsModel.fromMap(json["icons"]),
      ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null ? null : HomeModel.fromMap(json["ultra-sun-ultra-moon"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "icons": icons?.toMap(),
      // "ultra-sun-ultra-moon": ultraSunUltraMoon?.toMap(),
    };
  }
}
