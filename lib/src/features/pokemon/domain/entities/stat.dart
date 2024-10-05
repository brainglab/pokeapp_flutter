import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';

class Stat {
  int? baseStat;
  int? effort;
  Species? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromMap(json["stat"]),
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toMap(),
      };
}
