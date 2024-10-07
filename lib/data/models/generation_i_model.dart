import 'package:pokeapp_flutter/data/models/red_blue_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_i.dart';

class GenerationIModel extends GenerationI {
  GenerationIModel({
    super.redBlue,
    super.yellow,
  });

  factory GenerationIModel.fromMap(Map<String, dynamic> json) {
    return GenerationIModel(
      redBlue: json["red-blue"] == null ? null : RedBlueModel.fromMap(json["red-blue"]),
      yellow: json["yellow"] == null ? null : RedBlueModel.fromMap(json["yellow"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "red-blue": redBlue?.toMap(),
      // "yellow": yellow?.toMap(),
    };
  }
}
