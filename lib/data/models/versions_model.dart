import 'package:pokeapp_flutter/data/models/generation_i_model.dart';
import 'package:pokeapp_flutter/data/models/generation_ii_model.dart';
import 'package:pokeapp_flutter/data/models/generation_iii_model.dart';
import 'package:pokeapp_flutter/data/models/generation_iv_model.dart';
import 'package:pokeapp_flutter/data/models/generation_v_model.dart';
import 'package:pokeapp_flutter/data/models/generation_vii_model.dart';
import 'package:pokeapp_flutter/data/models/generation_viii_model.dart';
import 'package:pokeapp_flutter/data/models/home_model.dart';
import 'package:pokeapp_flutter/domain/entities/home.dart';
import 'package:pokeapp_flutter/domain/entities/versions.dart';

class VersionsModel extends Versions {
  VersionsModel({
    super.generationI,
    super.generationIi,
    super.generationIii,
    super.generationIv,
    super.generationV,
    super.generationVi,
    super.generationVii,
    super.generationViii,
  });

  factory VersionsModel.fromMap(Map<String, dynamic> json) {
    return VersionsModel(
      generationI: json["generation-i"] == null ? null : GenerationIModel.fromMap(json["generation-i"]),
      generationIi: json["generation-ii"] == null ? null : GenerationIiModel.fromMap(json["generation-ii"]),
      generationIii: json["generation-iii"] == null ? null : GenerationIiiModel.fromMap(json["generation-iii"]),
      generationIv: json["generation-iv"] == null ? null : GenerationIvModel.fromMap(json["generation-iv"]),
      generationV: json["generation-v"] == null ? null : GenerationVModel.fromMap(json["generation-v"]),
      generationVi: Map.from(json["generation-vi"]!).map((k, v) => MapEntry<String, Home>(k, HomeModel.fromMap(v))),
      generationVii: json["generation-vii"] == null ? null : GenerationViiModel.fromMap(json["generation-vii"]),
      generationViii: json["generation-viii"] == null ? null : GenerationViiiModel.fromMap(json["generation-viii"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "generation-i": generationI?.toMap(),
      // "generation-ii": generationIi?.toMap(),
      // "generation-iii": generationIii?.toMap(),
      // "generation-iv": generationIv?.toMap(),
      // "generation-v": generationV?.toMap(),
      // "generation-vi": Map.from(generationVi!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      // "generation-vii": generationVii?.toMap(),
      // "generation-viii": generationViii?.toMap(),
    };
  }
}
