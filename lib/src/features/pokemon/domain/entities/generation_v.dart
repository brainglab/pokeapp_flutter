import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/black_white.dart';

class GenerationV {
  BlackWhite? blackWhite;

  GenerationV({
    this.blackWhite,
  });

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null ? null : BlackWhite.fromMap(json["black-white"]),
      );

  Map<String, dynamic> toMap() => {
        "black-white": blackWhite?.toMap(),
      };
}
