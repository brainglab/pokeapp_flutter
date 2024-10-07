import 'package:pokeapp_flutter/data/models/black_white_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_v.dart';

class GenerationVModel extends GenerationV {
  GenerationVModel({
    super.blackWhite,
  });

  factory GenerationVModel.fromMap(Map<String, dynamic> json) {
    return GenerationVModel(
      blackWhite: json["black-white"] == null ? null : BlackWhiteModel.fromMap(json["black-white"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "black-white": blackWhite?.toMap(),
    };
  }
}
