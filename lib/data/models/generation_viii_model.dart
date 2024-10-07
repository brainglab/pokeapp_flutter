import 'package:pokeapp_flutter/data/models/generation_viii_icons_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_viii.dart';

class GenerationViiiModel extends GenerationViii {
  GenerationViiiModel({
    super.icons,
  });

  factory GenerationViiiModel.fromMap(Map<String, dynamic> json) {
    return GenerationViiiModel(
      icons: json["icons"] == null ? null : GenerationViiiIconsModel.fromMap(json["icons"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "icons": icons?.toMap(),
    };
  }
}
