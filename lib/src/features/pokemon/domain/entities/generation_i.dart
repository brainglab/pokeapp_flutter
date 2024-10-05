import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/red_blue.dart';

class GenerationI {
  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI({
    this.redBlue,
    this.yellow,
  });

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null ? null : RedBlue.fromMap(json["red-blue"]),
        yellow: json["yellow"] == null ? null : RedBlue.fromMap(json["yellow"]),
      );

  Map<String, dynamic> toMap() => {
        "red-blue": redBlue?.toMap(),
        "yellow": yellow?.toMap(),
      };
}
