import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/domain/entities/version_detail.dart';

class VersionDetailModel extends VersionDetail {
  VersionDetailModel({
    super.rarity,
    super.version,
  });

  factory VersionDetailModel.fromMap(Map<String, dynamic> json) {
    return VersionDetailModel(
      rarity: json["rarity"],
      version: json["version"] == null ? null : SpeciesModel.fromMap(json["version"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "rarity": rarity,
      // "version": version?.toMap(),
    };
  }
}
