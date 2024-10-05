import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';

class PType {
  int? slot;
  Species? type;

  PType({
    this.slot,
    this.type,
  });

  factory PType.fromMap(Map<String, dynamic> json) => PType(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type?.toMap(),
      };
}
