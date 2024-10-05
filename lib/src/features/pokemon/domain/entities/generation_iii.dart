import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/firered_leafgreen.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/official_artwork.dart';

class GenerationIii {
  OfficialArtwork? emerald;
  FireredLeafgreen? fireredLeafgreen;
  FireredLeafgreen? rubySapphire;

  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: json["emerald"] == null ? null : OfficialArtwork.fromMap(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null ? null : FireredLeafgreen.fromMap(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null ? null : FireredLeafgreen.fromMap(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toMap() => {
        "emerald": emerald?.toMap(),
        "firered-leafgreen": fireredLeafgreen?.toMap(),
        "ruby-sapphire": rubySapphire?.toMap(),
      };
}
