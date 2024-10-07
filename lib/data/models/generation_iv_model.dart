import 'package:pokeapp_flutter/data/models/diamond_pearl_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_iv.dart';

class GenerationIvModel extends GenerationIv {
  GenerationIvModel({
    super.diamondPearl,
    super.heartgoldSoulsilver,
    super.platinum,
  });

  factory GenerationIvModel.fromMap(Map<String, dynamic> json) {
    return GenerationIvModel(
      diamondPearl: json["diamond-pearl"] == null ? null : DiamondPearlModel.fromMap(json["diamond-pearl"]),
      heartgoldSoulsilver: json["heartgold-soulsilver"] == null ? null : DiamondPearlModel.fromMap(json["heartgold-soulsilver"]),
      platinum: json["platinum"] == null ? null : DiamondPearlModel.fromMap(json["platinum"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "diamond-pearl": diamondPearl?.toMap(),
      // "heartgold-soulsilver": heartgoldSoulsilver?.toMap(),
      // "platinum": platinum?.toMap(),
    };
  }
}
