import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_i.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_ii.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_iii.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_iv.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_v.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_vii.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/generation_viii.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/home.dart';

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null ? null : GenerationI.fromMap(json["generation-i"]),
        generationIi: json["generation-ii"] == null ? null : GenerationIi.fromMap(json["generation-ii"]),
        generationIii: json["generation-iii"] == null ? null : GenerationIii.fromMap(json["generation-iii"]),
        generationIv: json["generation-iv"] == null ? null : GenerationIv.fromMap(json["generation-iv"]),
        generationV: json["generation-v"] == null ? null : GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]!).map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: json["generation-vii"] == null ? null : GenerationVii.fromMap(json["generation-vii"]),
        generationViii: json["generation-viii"] == null ? null : GenerationViii.fromMap(json["generation-viii"]),
      );

  Map<String, dynamic> toMap() => {
        "generation-i": generationI?.toMap(),
        "generation-ii": generationIi?.toMap(),
        "generation-iii": generationIii?.toMap(),
        "generation-iv": generationIv?.toMap(),
        "generation-v": generationV?.toMap(),
        "generation-vi": Map.from(generationVi!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii?.toMap(),
        "generation-viii": generationViii?.toMap(),
      };
}
