import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';

class GameIndex {
  int? gameIndex;
  Species? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: json["version"] == null ? null : Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version?.toMap(),
      };
}
