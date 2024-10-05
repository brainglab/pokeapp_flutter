import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_viii_icons.dart';

class GenerationViii {
  GenerationViiiIcons? icons;

  GenerationViii({
    this.icons,
  });

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: json["icons"] == null ? null : GenerationViiiIcons.fromMap(json["icons"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
      };
}
