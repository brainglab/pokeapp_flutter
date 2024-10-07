import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/domain/entities/p_type.dart';

class PTypeModel extends PType {
  PTypeModel({
    super.slot,
    super.type,
  });

  factory PTypeModel.fromMap(Map<String, dynamic> json) {
    return PTypeModel(
      slot: json["slot"],
      type: json["type"] == null ? null : SpeciesModel.fromMap(json["type"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "slot": slot,
      // "type": type?.toMap(),
    };
  }
}
