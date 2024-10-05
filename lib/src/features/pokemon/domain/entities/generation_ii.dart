import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/crystal.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/gold.dart';

class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: json["crystal"] == null ? null : Crystal.fromMap(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromMap(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromMap(json["silver"]),
      );

  Map<String, dynamic> toMap() => {
        "crystal": crystal?.toMap(),
        "gold": gold?.toMap(),
        "silver": silver?.toMap(),
      };
}
