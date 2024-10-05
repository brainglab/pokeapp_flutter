import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/diamond_pearl.dart';

class GenerationIv {
  DiamondPearl? diamondPearl;
  DiamondPearl? heartgoldSoulsilver;
  DiamondPearl? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null ? null : DiamondPearl.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null ? null : DiamondPearl.fromMap(json["heartgold-soulsilver"]),
        platinum: json["platinum"] == null ? null : DiamondPearl.fromMap(json["platinum"]),
      );

  Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl?.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toMap(),
        "platinum": platinum?.toMap(),
      };
}
