import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/domain/entities/game_indices.dart';

class GameIndicesModel extends GameIndices {
  GameIndicesModel({
    super.gameIndex,
    super.version,
  });

  factory GameIndicesModel.fromMap(Map<String, dynamic> json) {
    return GameIndicesModel(
      gameIndex: json["game_index"],
      version: json["version"] == null ? null : SpeciesModel.fromMap(json["version"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "game_index": gameIndex,
    };
  }
}
