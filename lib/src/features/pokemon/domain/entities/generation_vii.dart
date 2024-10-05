import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_vii_icons.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/home.dart';

class GenerationVii {
  GenerationViiIcons? icons;
  Home? ultraSunUltraMoon;

  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: json["icons"] == null ? null : GenerationViiIcons.fromMap(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null ? null : Home.fromMap(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toMap(),
      };
}
