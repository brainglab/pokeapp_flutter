import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/domain/entities/stat.dart';

class StatModel extends Stat {
  StatModel({
    super.baseStat,
    super.effort,
    super.stat,
  });

  factory StatModel.fromMap(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: json["stat"] == null ? null : SpeciesModel.fromMap(json["stat"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "base_stat": baseStat,
      "effort": effort,
      // "stat": stat?.toMap(),
    };
  }
}
