import 'package:pokeapp_flutter/domain/entities/species.dart';

class Stat {
  int? baseStat;
  int? effort;
  Species? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });
}
