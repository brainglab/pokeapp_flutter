import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';

class VersionDetail {
  int? rarity;
  Species? version;

  VersionDetail({
    this.rarity,
    this.version,
  });

  factory VersionDetail.fromMap(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: json["version"] == null ? null : Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "rarity": rarity,
        "version": version?.toMap(),
      };
}
