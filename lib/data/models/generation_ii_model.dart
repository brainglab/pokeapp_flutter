import 'package:pokeapp_flutter/data/models/crystal_model.dart';
import 'package:pokeapp_flutter/data/models/gold_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_ii.dart';

class GenerationIiModel extends GenerationIi {
  GenerationIiModel({
    super.crystal,
    super.gold,
    super.silver,
  });

  factory GenerationIiModel.fromMap(Map<String, dynamic> json) {
    return GenerationIiModel(
      crystal: json["crystal"] == null ? null : CrystalModel.fromMap(json["crystal"]),
      gold: json["gold"] == null ? null : GoldModel.fromMap(json["gold"]),
      silver: json["silver"] == null ? null : GoldModel.fromMap(json["silver"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "crystal": crystal?.toMap(),
      // "gold": gold?.toMap(),
      // "silver": silver?.toMap(),
    };
  }
}
